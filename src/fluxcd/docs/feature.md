---
title: fluxcd
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure FluxCD on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/fluxcd:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |

### CLI Commands
The following scripts are provided by this feature:

#### setup fluxcd
The ***setup fluxcd*** command will install and configure FluxCD on the local machine

Example usage:
```bash
krapctl setup fluxcd
```

