#!/bin/bash

. /etc/krapctl/environment

cp -R ./modules/* "${KRAPCTL_MODULES}"

mkdir -p /usr/lib/ohdsi/bin
mkdir -p /usr/lib/ohdsi/etc

cat <<EOF > /usr/lib/ohdsi/etc/environment
OHDSI_HELM_CHART_PATH="${PATHTOHELMCHART}"
OHDSI_NAMESPACE="${OHDSINAMESPACE}"
EOF


exit 0