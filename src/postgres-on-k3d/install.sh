#!/bin/bash

BASEDIR="/usr/lib/postgres-on-k3d"
mkdir -p "${BASEDIR}/bin"
mkdir -p "${BASEDIR}/etc"
mkdir -p "${BASEDIR}/work"
chmod 0777 "${BASEDIR}/work"

cat <<EOF > "${BASEDIR}/etc/environment"
HELM_REPOSITORY="${HELMREPOSITORY}"
NAMESPACE="${NAMESPACE}"
CHART_NAME="${CHARTNAME}"
CHART_VERSION="${CHARTVERSION}"
INSTANCE_NAME="${INSTANCENAME}"
PG_INSTANCE="${INSTANCENAME}-postgresql"
PG_FQDN="${INSTANCENAME}-postgresql.${NAMESPACE}.svc.cluster.local"
EOF

cp -R ./bin "${BASEDIR}/"

ln -s /workspaces/lsc-sde/products/sde/devcontainer-features/src/postgres-on-k3d/install.sh /bin/setup-postgres-on-k3d

exit 0