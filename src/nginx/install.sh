#!/bin/bash

usage() { echo "Usage: $0 [-p <path_to_flux_folder>] [-v <nginx_version>] [-n <nginx_namespace>]" 1>&2; exit 1; }

while getopts ":p:v:n:" o; do
    case "${o}" in
        p)
            FLUXPATH=${OPTARG}
            ;;
        v)
            NGINXVERSION=${OPTARG}
            ;;
        n)
            NGINXNAMESPACE=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


mkdir -p /usr/lib/nginx/bin
mkdir -p /usr/lib/nginx/etc
mkdir -p /usr/lib/nginx/work
chmod 0777 /usr/lib/nginx/work

cat <<EOF > /usr/lib/nginx/etc/environment
NGINX_FLUX_PATH="${FLUXPATH}"
NGINX_VERSION="${NGINXVERSION}"
NGINX_NAMESPACE="${NGINXNAMESPACE}"
EOF

cp -R ./bin /usr/lib/nginx/

ln -s /usr/lib/nginx/bin/setup-nginx /bin/setup-nginx

exit 0