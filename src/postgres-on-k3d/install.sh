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
EOF

cp -R ./bin "${BASEDIR}/"

ln -s $(readlink -f ./bin/setup-postgres-on-k3d.sh) /bin/setup-postgres-on-k3d

exit 0