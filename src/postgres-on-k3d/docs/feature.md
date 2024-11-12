---
title: postgres-on-k3d
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure Postgres on your local environment's K3D implementation.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/postgres-on-k3d:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| helmRepository | The URL where the helm chart is located | oci://registry-1.docker.io/bitnamicharts |
| chartName | The name of the helm chart to install | postgresql |
| chartVersion | The version of the helm chart to install | 15.5.20 |
| namespace | The namespace where postgres will be installed | postgres-on-k3d |
| instanceName | The name of the postgres instance | k3d-postgres |

### Scripts
The following scripts are provided by this feature:

#### setup-postgres-on-k3d.sh
The ***setup-postgres-on-k3d.sh*** command will install and configure Postgres on the local machine's k3d instance

Example usage:
```bash
setup-postgres-on-k3d.sh
```

