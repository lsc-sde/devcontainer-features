#!/bin/bash

. /etc/krapctl/environment

cp -R ./modules/* "${KRAPCTL_MODULES}"

mkdir -p /usr/lib/awms/etc
mkdir -p /usr/lib/awms/work
chmod 0777 /usr/lib/awms/work

cat <<EOF > /usr/lib/awms/etc/environment
NAMESPACE="${NAMESPACE}"
AWMS_DOCKER_IMAGE_DEFINITION="${AWMSDOCKERIMAGEDEFINITION}"
ANALYTICSWORKSPACE_HELM_CHART="${ANALYTICSWORKSPACEHELMCHART}"
CRATE_OPERATOR_PATH=${CRATEOPERATORPATH}
KUSTOMIZE_PATH="${KUSTOMIZEPATH}"
EOF

pip install kubernetes_asyncio
pip install lscsde_workspace_mgmt
pip install awms-kubespawner
pip install pytest
pip install pytest-asyncio
pip install build
pip install twine
pip install logger
pip install fastapi
pip install uvicorn
pip install kubernetes
pip install psycopg2-binary
MULTIDICT_NO_EXTENSIONS=1 pip install kopf
exit 0