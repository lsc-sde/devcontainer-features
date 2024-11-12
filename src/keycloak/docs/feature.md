---
title: keycloak
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature includes a collection of tools and scripts designed to make it easier to configure Keycloak on your local environment.

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/keycloak:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| fluxPath | The path where keycloak flux configuration is located | /workspaces/lsc-sde/products/sde-3rd-party/keycloak/iac-flux-keycloak/keycloak |
| keycloakVersion | The version of keycloak to install | 25.0.4 |
| keycloakNamespace | The namespace where keycloak will be installed | keycloak |
| imageName | The name of the keycloak image | k3d-devcontainer-registry.local:36471/keycloak |
| imagePath | The path where the keycloak image definition is located | /workspaces/lsc-sde/products/sde-3rd-party/keycloak/awms-keycloak-extensions |

### Scripts
The following scripts are provided by this feature:

#### setup-keycloak
The ***setup-keycloak*** command will install and configure Keycloak on the local machine

Example usage:
```bash
setup-keycloak
```

