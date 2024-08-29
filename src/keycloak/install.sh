#!/bin/bash

usage() { echo "Usage: $0 [-p <path_to_flux_folder>] [-v <keycloak_version>] [-n <keycloak_namespace>]" 1>&2; exit 1; }

while getopts ":p:v:n:" o; do
    case "${o}" in
        p)
            FLUXPATH=${OPTARG}
            ;;
        v)
            KEYCLOAKVERSION=${OPTARG}
            ;;
        n)
            KEYCLOAKNAMESPACE=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


mkdir -p /usr/lib/keycloak/bin
mkdir -p /usr/lib/keycloak/etc
mkdir -p /usr/lib/keycloak/work
chmod 0777 /usr/lib/keycloak/work

cat <<EOF > /usr/lib/keycloak/etc/environment
KEYCLOAK_FLUX_PATH="${FLUXPATH}"
KEYCLOAK_VERSION="${KEYCLOAKVERSION}"
KEYCLOAK_NAMESPACE="${KEYCLOAKNAMESPACE}"
EOF

cp -R ./bin /usr/lib/keycloak/

ln -s /usr/lib/keycloak/bin/setup-keycloak.sh /bin/setup-keycloak

exit 0