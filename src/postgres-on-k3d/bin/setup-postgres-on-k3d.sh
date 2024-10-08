#!/bin/bash

. /etc/k3d/setup/environment
. /usr/lib/postgres-on-k3d/etc/environment

CURRENT_DATE=$(date '+%Y%m%d%H%M%S')
WORK_FOLDER="/usr/lib/postgres-on-k3d/work/${CURRENT_DATE}"
CURRENT_FOLDER=$(pwd)

mkdir -p "${WORK_FOLDER}"
cd "${WORK_FOLDER}"

helm upgrade -i ${INSTANCE_NAME} "${HELM_REPOSITORY}/${CHART_NAME}" --version "${CHART_VERSION}" -n "${NAMESPACE}" --create-namespace

PGPASSWORD=$(kubectl get secret --namespace "${NAMESPACE}" "${PG_INSTANCE}" -o jsonpath="{.data.postgres-password}" | base64 -d)

cd "${CURRENT_FOLDER}"