#!/bin/bash

. /etc/k3d/setup/environment
. /usr/lib/postgres-on-k3d/etc/environment

usage() { echo "Usage: $0 -u <username> -p <password>" 1>&2; exit 1; }

unset -v USERNAME
unset -v USERPASS

while getopts "u:p:" o; do
    case "${o}" in
        u)
            USERNAME="${OPTARG}"
            ;;
        p)
            USERPASS="${OPTARG}"
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${USERNAME}" ] || [ -z "${USERPASS}" ]; then 
    usage
fi

CURRENT_DATE=$(date '+%Y%m%d%H%M%S')
WORK_FOLDER="/usr/lib/postgres-on-k3d/work/${CURRENT_DATE}"
CURRENT_FOLDER=$(pwd)

mkdir -p "${WORK_FOLDER}"
cd "${WORK_FOLDER}"

export PGPASSWORD=$(kubectl get secret --namespace "${NAMESPACE}" "${PG_INSTANCE}" -o jsonpath="{.data.postgres-password}" | base64 -d)
nohup kubectl port-forward --namespace "${NAMESPACE}" "svc/${PG_INSTANCE}" 5432:5432 &

cat <<EOF > create-user.sql
DO
\$do\$
BEGIN
    IF EXISTS (
        SELECT FROM pg_catalog.pg_roles
        WHERE  rolname = '${USERNAME}') THEN

        RAISE NOTICE 'Role "${USERNAME}" already exists. Skipping.';
    ELSE
        CREATE ROLE ${USERNAME} WITH
            LOGIN
            SUPERUSER
            CREATEDB
            CREATEROLE
            INHERIT
            NOREPLICATION
            CONNECTION LIMIT -1
            PASSWORD '${USERPASS}';

        RAISE NOTICE 'Role "${USERNAME}" Created.';
    END IF;

    GRANT postgres TO ${USERNAME} WITH ADMIN OPTION;
END
\$do\$
EOF

psql -h 127.0.0.1 -U postgres -f create-user.sql

rm create-user.sql

cd "${CURRENT_FOLDER}"