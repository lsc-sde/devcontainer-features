---
title: nginx
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure NGinX on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/nginx:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| fluxPath | The path where the flux configuration is located | /workspaces/lsc-sde/iac/flux/nginx |
| nginxVersion | The version of NGINX to install | 4.9.1 | 
| nginxNamespace | The namespace where nginx is installed | ingress-nginx |

### CLI Commands
The following scripts are provided by this feature:

#### setup nginx
The ***setup nginx*** command will install and configure NGinX on the local machine

Example usage:
```bash
krapctl setup nginx
```

