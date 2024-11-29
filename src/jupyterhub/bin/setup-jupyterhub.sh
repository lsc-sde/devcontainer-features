#!/bin/bash

. /etc/k3d/setup/environment
. /usr/lib/jupyterhub/etc/environment

CURRENT_DATE=$(date '+%Y%m%d%H%M%S')
WORK_FOLDER="/usr/lib/jupyterhub/work/${CURRENT_DATE}"
CURRENT_FOLDER=$(pwd)

export FULL_IMAGE_NAME="${REGISTRY_NAME}:${REGISTRY_PORT}/${IMAGE_NAME}:${CURRENT_DATE}"


mkdir -p "${WORK_FOLDER}"

echo "Building docker image based on definition in: ${HUB_DOCKER_IMAGE_DEFINITION}"
cd "${HUB_DOCKER_IMAGE_DEFINITION}"
docker build . -t "${FULL_IMAGE_NAME}" "$@"

echo "pushing docker image ${FULL_IMAGE_NAME} to local registry"
docker push "${FULL_IMAGE_NAME}"

cd "${WORK_FOLDER}"


openssl req -new -nodes -out jupyter.csr -newkey rsa:4096 -keyout jupyter.key -subj '/CN=jupyter/C=GB/ST=Anywhere/L=Anywhere/O=LSCSDE'

cat <<EOF > jupyter.v3.ext 
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = jupyter.xlscsde.local
EOF

openssl x509 -req -in jupyter.csr -CA /usr/lib/trust-manager/work/ca.crt -CAkey /usr/lib/trust-manager/work/ca.key -CAcreateserial -out jupyter.crt -days 3650 -sha256 -extfile jupyter.v3.ext


echo "Installing Helm Chart ${CHART_NAME}:${CHART_VERSION} from ${HELM_REPOSITORY} to namespace ${NAMESPACE}"
helm repo add jupyterhub "${HELM_REPOSITORY}"
helm repo update


cat <<EOF > ./namespace.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: ${NAMESPACE}
  labels:
    xlscsde.local/inject: "enabled"
EOF
kubectl apply -f ./namespace.yaml

cat <<EOF > ./jupyterhub.values.yaml
hub:
  image:
    name: ${REGISTRY_NAME}:${REGISTRY_PORT}/${IMAGE_NAME}
    tag: "${CURRENT_DATE}"
    pullPolicy: Always
  extraEnv:
    DEFAULT_STORAGE_CLASS: "jupyter-default"
    DEFAULT_STORAGE_ACCESS_MODES: "ReadWriteOnce"
    DEFAULT_STORAGE_CAPACITY: "1Gi"

  config:
    GenericOAuthenticator:
      client_id: jupyter
      client_secret: jupyter
      keycloak_api_base_url: https://keycloak.xlscsde.local/admin/realms/lsc-sde
      oauth_callback_url: ""
      authorize_url: https://keycloak.xlscsde.local/realms/lsc-sde/protocol/openid-connect/auth
      token_url: https://keycloak.xlscsde.local/realms/lsc-sde/protocol/openid-connect/token
      userdata_url: https://keycloak.xlscsde.local/realms/lsc-sde/protocol/openid-connect/userinfo
      logout_redirect_url: https://keycloak.xlscsde.local/realms/lsc-sde/protocol/openid-connect/logout
      login_service: keycloak
      scope: 
      - 'openid'
      - 'profile'
      - 'realm_groups'
      
      username_claim: workspace_id
      username_key: workspace_id
      userdata_params:
        state: state
        realm_groups: groups

      admin_groups:
      - jupyter-admins

      allowed_groups: 
      - jupyter-users

      claim_groups_key: groups

    JupyterHub:
      authenticator_class: generic-oauth
  
  extraVolumes:
  - name: jupyterhub-certificates
    configMap:
      name: xlscsde-local-bundle
      defaultMode: 0644

  extraVolumeMounts:
  - name: jupyterhub-certificates
    mountPath: /etc/ssl/certs
    readOnly: true
proxy:
  service:
    type: ClusterIP
EOF


install_cmd=( helm upgrade -i )
install_cmd+=( -n "${NAMESPACE}" )
install_cmd+=( jh-test )
install_cmd+=( "jupyterhub/${CHART_NAME}" )
install_cmd+=( --version ${CHART_VERSION} )
install_cmd+=( -f ./jupyterhub.values.yaml )
echo "Executing ${install_cmd[@]}"
${install_cmd[@]}

helm upgrade -i -n awms-test awms-test "${ANALYTICSWORKSPACE_HELM_CHART}" --create-namespace

cd "${WORK_FOLDER}"
cat <<EOF > bindings.yaml
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: events-writer
rules:
- apiGroups:
  - events.k8s.io
  - ""
  resources:
  - events
  verbs:
  - create
  - patch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: jh-test:events-writer
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: events-writer
subjects:
- kind: ServiceAccount
  name: hub
  namespace: jh-test

---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: jh-test:awms-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: awms-test-admin
subjects:
- kind: ServiceAccount
  name: hub
  namespace: jh-test
EOF

kubectl apply -f bindings.yaml

cat <<EOF > pvc.yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: jupyter-default
provisioner: rancher.io/local-path
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
EOF

kubectl apply -f pvc.yaml

cat <<EOF > workspaces.yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspace
metadata:
  name: default-generic-workspace
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  displayName: Default Generic Workspace
  description: |
    Basic environment for testing with Python R and Julia.
  
  validity:
    availableFrom: "2022-01-01"
    expires: "2030-01-01"
  
  jupyterWorkspace:
    image: lscsde/datascience-notebook-default:0.1.0
    persistentVolumeClaim: 
      name: jupyter-default-generic-workspace
    resources:
      requests:
        memory: "256M"
        cpu: 0.1
      limits:
        memory: "1G"
        cpu: 0.5
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspace
metadata:
  name: test-workspace
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  displayName: Test Workspace
  description: |
    A workspace designed to test the capabilities
    of the AnalyticsWorkspace api's. This will be similar 
    to the default generic workspace workspace, but will 
    have slightly different parameters to ensure that 
    individual functionality of the system is working.
  
  validity:
    availableFrom: "2024-01-01"
    expires: "2025-01-01"
  
  jupyterWorkspace:
    image: lscsde/datascience-notebook-default:0.1.0
    persistentVolumeClaim: 
      name: jupyter-test-workspace
    resources:
      requests:
        memory: "256M"
        cpu: 0.1
      limits:
        memory: "1G"
        cpu: 0.5
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspace
metadata:
  name: test-workspace-tolerations
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  displayName: Test Workspace with Tolerations
  description: |
    A workspace designed to test the capabilities
    of the AnalyticsWorkspace api's. This will be similar 
    to the default generic workspace workspace, but will 
    have slightly different parameters to ensure that 
    individual functionality of the system is working.
  
  validity:
    availableFrom: "2024-01-01"
    expires: "2025-01-01"
  
  jupyterWorkspace:
    image: lscsde/datascience-notebook-default:0.1.0
    resources:
      requests:
        memory: "256M"
        cpu: 0.15
      limits:
        memory: "512M"
        cpu: 0.25
    
    tolerations:
    - key: "sdeAppType"
      value: "datascience-large"
      effect: "NoSchedule"
    
    nodeSelector:
      lsc-sde.nhs.uk/nodeType: datascience-large
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspace
metadata:
  name: omop-workspace
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  displayName: OMOP Darwin Workspace
  description: |
    OMOP workspace test
  
  validity:
    availableFrom: "2024-07-08"
    expires: "2024-10-01"
  
  jupyterWorkspace:
    image: lscsde/docker-datascience-jupyter-omop:darwin-v1.4.0-amd64
    persistentVolumeClaim: 
      name: jupyter-omop-darwin-workspace
    resources:
      requests:
        memory: "256M"
        cpu: 0.1
      limits:
        memory: "1G"
        cpu: 0.5
EOF
kubectl apply -f workspaces.yaml

cat <<EOF > workspace-bindings.yaml
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspaceBinding
metadata:
  name: default-generic-workspace-jovyan
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  workspace: default-generic-workspace
  username: "jovyan"
  expires: "2030-01-01"
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspaceBinding
metadata:
  name: test-workspace-jovyan
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  workspace: test-workspace
  username: "jovyan"
  expires: "2029-01-01"
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspaceBinding
metadata:
  name: test-workspace-tolerations-jovyan
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  workspace: test-workspace-tolerations
  username: "jovyan"
  expires: "2029-01-01"
---
apiVersion: xlscsde.nhs.uk/v1
kind: AnalyticsWorkspaceBinding
metadata:
  name: omop-workspace-jovyan
  namespace: jh-test
  annotations:
    kustomize.toolkit.fluxcd.io/prune: disabled
spec:
  workspace: omop-workspace
  username: "jovyan"
  expires: "2025-01-01"
EOF
kubectl apply -f workspace-bindings.yaml

cat <<EOF > ingress.yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: jupyter
  namespace: jh-test
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect : "true"
    nginx.ingress.kubernetes.io/force-ssl-redirect : "true"
    nginx.ingress.kubernetes.io/backend-protocol: "HTTP"
spec:
  ingressClassName: nginx
  rules:
  - host: jupyter.xlscsde.local
    http:
      paths:
      - pathType: Prefix
        path: "/"
        backend:
          service:
            name: proxy-public
            port: 
              name: http
  tls:
  - hosts:
    - jupyter.xlscsde.local
    secretName: example-tls-secret
EOF

kubectl create secret tls example-tls-secret --cert jupyter.crt --key jupyter.key -n jh-test

kubectl apply -f ./ingress.yaml

nohup kubectl port-forward svc/proxy-public -n jh-test 8080:80 &
cd "${CURRENT_FOLDER}"

kubectl rollout restart -n jh-test deployments/hub
