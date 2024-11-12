---
title: metallb
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure MetalLB on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/metallb:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |

### Scripts
The following scripts are provided by this feature:

#### setup-metallb
The ***setup-metallb*** command will install and configure MetalLB on the local machine

Example usage:
```bash
setup-metallb
```

