#!/bin/bash

. /etc/krapctl/environment

cp -R ./modules/* "${KRAPCTL_MODULES}"

sh -c 'curl -s https://fluxcd.io/install.sh | FLUX_VERSION="${FLUXVERSION}" bash'

exit 0