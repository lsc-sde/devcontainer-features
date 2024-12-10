---
title: trust-manager
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
		"ghcr.io/lsc-sde/devcontainer-features/trust-manager:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| trustManagerVersion | The version of trust manager to install | 0.12.0 |
| trustManagerNamespace | The namespace trust manager will be installed into | cert-manager |

### Scripts
The following scripts are provided by this feature:

#### setup trustmanager
The ***setup trustmanager*** command will install and configure trust manager on the local machine's k3d instance

Example usage:
```bash
krapctl setup trustmanager
```

