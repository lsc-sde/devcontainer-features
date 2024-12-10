#!/bin/bash

. /etc/krapctl/environment

cp -R ./modules/* "${KRAPCTL_MODULES}"

usage() { echo "Usage: $0 [-p <path_to_flux_folder>] [-v <keycloak_version>] [-n <keycloak_namespace>]" 1>&2; exit 1; }

while getopts ":p:v:n:i:P:" o; do
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
        i)
            IMAGENAME=${OPTARG}
            ;;
        P)
            IMAGEPATH=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


mkdir -p /usr/lib/keycloak/db
mkdir -p /usr/lib/keycloak/etc
mkdir -p /usr/lib/keycloak/work
chmod 0777 /usr/lib/keycloak/work

cat <<EOF > /usr/lib/keycloak/etc/environment
KEYCLOAK_FLUX_PATH="${FLUXPATH}"
KEYCLOAK_VERSION="${KEYCLOAKVERSION}"
KEYCLOAK_NAMESPACE="${KEYCLOAKNAMESPACE}"
KEYCLOAK_IMAGE="${IMAGENAME}"
KEYCLOAK_IMAGE_PATH="${IMAGEPATH}"
EOF

cp -R ./db /usr/lib/keycloak/

exit 0