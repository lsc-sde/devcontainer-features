---
title: ohdsi
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure OHDSI on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/ohdsi:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| pathToHelmChart | The path where the helm chart configuration is located | /workspaces/lsc-sde/iac/helm/ohdsi |
| ohdsiNamespace | The namespace where ohdsi is installed | ingress-nginx |

### Scripts
The following scripts are provided by this feature:

#### setup-ohdsi
The ***setup-ohdsi*** command will install and configure OHDSI on the local machine

Example usage:
```bash
setup-ohdsi
```

