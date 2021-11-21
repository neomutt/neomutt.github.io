---
title:       Coverity
description: Static analysis of the code
source:      https://github.com/neomutt/neomutt/blob/master/.github/workflows/coverity.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/coverity.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/coverity.yml
author:      flatcap
---

<div style="float: right;">
<a href="https://github.com/neomutt/neomutt/actions/workflows/coverity.yml"><img src="https://github.com/neomutt/neomutt/actions/workflows/coverity.yml/badge.svg" /></a>
<a href="https://scan.coverity.com/projects/neomutt-neomutt"><img src="https://img.shields.io/coverity/scan/8495.svg" /></a>
<a href="https://coverity.com/"><img src="/images/coverity.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This action runs [Coverity](https://coverity.com/)'s analysis tools on the source code.
These tools check for resource leaks, potential NULL dereferences and much more.

This is a free service for open source, but limited to 2 scans per day.

**Steps**:
- Download Coverity tools
- Build NeoMutt with Coverity tools
- Submit Results

### Action Details

| Key     | Description              | Details                                                                                        |
| :------ | :----------------------- | :--------------------------------------------------------------------------------------------- |
| Trigger | Schedule                 | Mondays at 3am                                                                                 |
| Trigger | `git push`               | To branches `coverity/*`                                                                       |
| Uses    | GitHub's checkout action | [https://github.com/actions/checkout](https://github.com/actions/checkout)                     |
| Runs-on | ubuntu-latest            | [neomutt/docker-build](https://ghcr.io/neomutt/docker-build)                                   |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Results     | [Static Analysis](https://scan.coverity.com/projects/neomutt-neomutt)                          |

