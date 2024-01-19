---
title:       Coverity
description: Static analysis of the code
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/coverity.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/coverity.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/coverity.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
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

Learn more about [Coverity](../analysis/coverity)

**Steps**:
- Download Coverity tools
- Configure NeoMutt
- Build NeoMutt with Coverity tools
- Submit Results

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                               | Mondays at 3am                                                                                                                           |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | GitHub's upload artifacts action                                       | [https://github.com/actions/upload-artifact](https://github.com/actions/upload-artifact)                                                 |
| Uses    | [Simen Bekkhus](https://github.com/SimenB)' cpu-cores action           | [https://github.com/SimenB/github-actions-cpu-cores](https://github.com/SimenB/github-actions-cpu-cores)                                 |
| Runs-on | ubuntu-latest                                                          | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                                                                         |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Results     | [Static Analysis](https://scan.coverity.com/projects/neomutt-neomutt)                          |

