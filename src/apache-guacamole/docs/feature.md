---
title: apache-guacamole
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure Apache Guacamole on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/apache-guacamole:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| helmRepository | The URL of the helm repository used | https://lsc-sde.github.io/iac-helm-repository/ |
| chartVersion | The version of the helm chart to use | 0.1.12 |
| guacNamespace | The namespace to deploy Apache Guacamole | guacamole |

### CLI Commands
The following scripts are provided by this feature:

#### setup apache guacamole
The ***setup apache guacamole*** command will install and configure apache guacamole on the local machine

Example usage:
```bash
setup-apache-guacamole
```

