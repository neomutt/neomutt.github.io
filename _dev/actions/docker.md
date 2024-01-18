---
title:       Docker
description: Build a docker image to speed up automated builds
source:      https://github.com/neomutt/docker/blob/main/.github/workflows/ubuntu.yml
badge:       https://github.com/neomutt/docker/actions/workflows/ubuntu.yml/badge.svg
logs:        https://github.com/neomutt/docker/actions/workflows/ubuntu.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
<a href="https://www.docker.com/"><img src="/images/docker.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This action create a [Docker image](https://www.docker.com/) that contains a
full build environment for NeoMutt.  This is used to speed up other actions
that build NeoMutt.

The image is based on Ubuntu 20.04.  It's automatically re-built once a month
to ensure it has all the latest updates.

**Steps**:
- Update all the packages
- Install all the build requirements
- Publish the image

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                               | On the first of the month, at 3am                                                                                                        |
| Trigger | `git push`                                                             | To branches `coveralls/*`                                                                                                                |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | [Pablo Morelli](https://github.com/pmorelli92)'s container push action | [https://github.com/pmorelli92/github-container-registry-build-push](https://github.com/pmorelli92/github-container-registry-build-push) |
| Runs-on | ubuntu-latest                                                          | (unmodified)                                                                                                                             |

### See Also

| Description | Location                                                                                                         |
| :---------- | :--------------------------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                                               |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                                   |
| Docker repo | [https://github.com/neomutt/docker](https://github.com/neomutt/docker)                                           |
| Dockerfile  | [https://github.com/neomutt/docker/blob/main/Dockerfile](https://github.com/neomutt/docker/blob/main/Dockerfile) |
| Results     | [Docker image](https://github.com/neomutt/docker/pkgs/container/ubuntu)                                          |

