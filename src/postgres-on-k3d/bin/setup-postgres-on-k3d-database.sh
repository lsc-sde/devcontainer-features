#!/bin/bash

. /etc/k3d/setup/environment
. /usr/lib/postgres-on-k3d/etc/environment

usage() { echo "Usage: $0 -n <database> -o <owner>" 1>&2; exit 1; }

unset -v OWNERNAME
unset -v DATABASENAME

while getopts "o:n:" o; do
    case "${o}" in
        o)
            OWNERNAME="${OPTARG}"
            ;;
        n)
            DATABASENAME="${OPTARG}"
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${DATABASENAME}" ] || [ -z "${OWNERNAME}" ]; then 
    usage
fi

CURRENT_DATE=$(date '+%Y%m%d%H%M%S')
WORK_FOLDER="/usr/lib/postgres-on-k3d/work/${CURRENT_DATE}"
CURRENT_FOLDER=$(pwd)

mkdir -p "${WORK_FOLDER}"
cd "${WORK_FOLDER}"

export PGPASSWORD=$(kubectl get secret --namespace "${NAMESPACE}" "${PG_INSTANCE}" -o jsonpath="{.data.postgres-password}" | base64 -d)
nohup kubectl port-forward --namespace "${NAMESPACE}" "svc/${PG_INSTANCE}" 5432:5432 &


DBEXISTS=$(psql -h 127.0.0.1 -U postgres --csv -t -c "SELECT datname FROM pg_database WHERE datname = '${DATABASENAME}';")

if [ "${DBEXISTS}" == "${DATABASENAME}" ]; then
    echo "Database ${DATABASENAME} exists"
else
    echo "Creating database: ${DATABASENAME}"
    psql -h 127.0.0.1 -U postgres -c "CREATE DATABASE ${DATABASENAME} WITH OWNER = ${OWNERNAME};"
fi

cat <<EOF > grant-permissions.sql
GRANT ALL ON DATABASE ${DATABASENAME} TO ${OWNERNAME};
EOF

psql -h 127.0.0.1 -U postgres -f grant-permissions.sql

rm grant-permissions.sql

cd "${CURRENT_FOLDER}"