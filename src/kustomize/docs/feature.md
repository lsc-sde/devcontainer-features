---
title: kustomize
parent: Features
layout: page
grand_parent: Dev Containers
---

This feature installs the kustomize cli onto your devcontainer

### Usage

```json
{
    "features": {
        ...
		"ghcr.io/lsc-sde/devcontainer-features/kustomize:latest" : {}
    }
}
```

### Options

| Name | Description | Default Value |
| --- | --- | --- |
| kustomizeInstallUrl | The URL for the kustomize installation | https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh |


