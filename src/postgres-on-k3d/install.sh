#!/bin/bash

. /etc/krapctl/environment

BASEDIR="/usr/lib/postgres-on-k3d"
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


cp -R ./modules/* "${KRAPCTL_MODULES}"

apt-get update
apt-get install postgresql-client -y

exit 0
