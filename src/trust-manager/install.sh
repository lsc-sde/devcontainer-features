#!/bin/bash

usage() { echo "Usage: $0 [-v <version>] [-n <namespace>]" 1>&2; exit 1; }

while getopts ":v:n:" o; do
    case "${o}" in
        v)
            TRUSTMANAGERVERSION=${OPTARG}
            ;;
        n)
            TRUSTMANAGERNAMESPACE=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))


mkdir -p /usr/lib/trust-manager/bin
mkdir -p /usr/lib/trust-manager/etc
mkdir -p /usr/lib/trust-manager/work
chmod 0777 /usr/lib/trust-manager/work

cat <<EOF > /usr/lib/trust-manager/etc/environment
TRUSTMANAGER_VERSION="${TRUSTMANAGERVERSION}"
TRUSTMANAGER_NAMESPACE="${TRUSTMANAGERNAMESPACE}"
EOF

cp -R ./bin /usr/lib/trust-manager/

ln -s /usr/lib/trust-manager/bin/setup-trustmanager /bin/setup-trustmanager

exit 0