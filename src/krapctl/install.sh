#!/bin/bash

BASE_FOLDER="/usr/lib/krapctl"

while getopts ":b:" o; do
    case "${o}" in
        b)
            BASE_FOLDER=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

mkdir -p "${BASE_FOLDER}/bin"
mkdir -p "${BASE_FOLDER}/modules"
mkdir -p "${BASE_FOLDER}/work"
chmod 0777 "${BASE_FOLDER}/work"
mkdir -p /etc/krapctl

cat <<EOF > /etc/krapctl/environment
KRAPCTL_WORK="${BASE_FOLDER}/work"
KRAPCTL_MODULES="${BASE_FOLDER}/modules"
KRAPCTL_VERSION="0.1.0"
KRAPCTL_WORKSPACE_PATH="${localWorkspaceFolder}"
EOF

cp ./bin/* "${BASE_FOLDER}/bin/"
cp -R ./modules/* "${BASE_FOLDER}/modules/"

if [ ! -f "/usr/bin/krapctl" ]; then
    ln -s "${BASE_FOLDER}/bin/krapctl" /usr/bin/krapctl
fi
exit 0