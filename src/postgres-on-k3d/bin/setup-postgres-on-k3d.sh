#!/bin/bash

. /etc/k3d/setup/environment
. /usr/lib/postgres-on-k3d/etc/environment

CURRENT_DATE=$(date '+%Y%m%d%H%M%S')
WORK_FOLDER="/usr/lib/postgres-on-k3d/work/${CURRENT_DATE}"
CURRENT_FOLDER=$(pwd)

mkdir -p "${WORK_FOLDER}"
cd "${WORK_FOLDER}"

helm repo add postgres-on-k3d "${HELM_REPOSITORY}"
helm repo update
helm install k3d-postgres "postgres-on-k3d/${CHART_NAME}" --version "${CHART_VERSION}" -n "${NAMESPACE}"

cd "${CURRENT_FOLDER}"