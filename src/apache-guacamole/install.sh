#!/bin/bash

. /etc/krapctl/environment

usage() { echo "Usage: $0 [-r helm_repo_url] [-v <chart_version>] [-n <namespace>]" 1>&2; exit 1; }

while getopts ":c:k:i:n:o:" o; do
    case "${o}" in
        o)
            OPERATORCHARTPATH=${OPTARG}
            ;;
        c)
            CHARTPATH=${OPTARG}
            ;;
        i)
            IMAGEPATH=${OPTARG}
            ;;
        k)
            KUSTOMIZEPATH=${OPTARG}
            ;;
        n)
            GUACNAMESPACE=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


mkdir -p /usr/lib/apache-guacamole/db
mkdir -p /usr/lib/apache-guacamole/etc
mkdir -p /usr/lib/apache-guacamole/work
chmod 0777 /usr/lib/apache-guacamole/work

cat <<EOF > /usr/lib/apache-guacamole/etc/environment
GUAC_OPERATOR_CHART_PATH="${OPERATORCHARTPATH}"
GUAC_CHART_PATH="${CHARTPATH}"
GUAC_KUSTOMIZE_PATH="${KUSTOMIZEPATH}"
GUAC_NAMESPACE="${GUACNAMESPACE}"
GUAC_IMAGE_PATH="${IMAGEPATH}"
EOF

cp -R ./db /usr/lib/apache-guacamole/
cp -R ./modules/* "${KRAPCTL_MODULES}"

exit 0