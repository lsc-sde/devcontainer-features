---
title: apache-superset
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure Apache Superset on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/apache-superset:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |

### Scripts
The following scripts are provided by this feature:

#### setup-apache-superset
The ***setup-apache-superset*** command will install and configure Apache Superset on the local machine

Example usage:
```bash
setup-apache-superset
```

