#!/bin/bash

usage() { echo "Usage: $0 [-r helm_repo_url] [-v <chart_version>] [-n <namespace>]" 1>&2; exit 1; }

while getopts ":r:v:n:" o; do
    case "${o}" in
        r)
            HELMREPOSITORY=${OPTARG}
            ;;
        v)
            CHARTVERSION=${OPTARG}
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


mkdir -p /usr/lib/apache-guacamole/bin
mkdir -p /usr/lib/apache-guacamole/db
mkdir -p /usr/lib/apache-guacamole/etc
mkdir -p /usr/lib/apache-guacamole/work
chmod 0777 /usr/lib/apache-guacamole/work

cat <<EOF > /usr/lib/apache-guacamole/etc/environment
GUAC_HELM_REPOSITORY="${HELMREPOSITORY}"
GUAC_VERSION="${CHARTVERSION}"
GUAC_NAMESPACE="${GUACNAMESPACE}"
EOF

cp -R ./bin /usr/lib/apache-guacamole/
cp -R ./db /usr/lib/apache-guacamole/

ln -s /usr/lib/apache-guacamole/bin/setup-apache-guacamole /bin/setup-apache-guacamole

exit 0