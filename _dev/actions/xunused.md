---
title:       XUnused
description: Check for unused functions
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/xunused.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/xunused.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/xunused.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This is a weekly action that checks the code for unused functions.

The checking is performed by [Matthias Gehre](https://github.com/mgehre)'s `xunused`.

See, [How to build NeoMutt](https://neomutt.org/dev/build)

**Steps**:
- Configure NeoMutt
- Build NeoMutt
- Check for unused functions

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                               | Mondays at 3am                                                                                                                           |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | [Hendrik Muhs](https://github.com/hendrikmuhs)' ccache-action          | [https://github.com/hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)                                             |
| Uses    | [Simen Bekkhus](https://github.com/SimenB)' cpu-cores action           | [https://github.com/SimenB/github-actions-cpu-cores](https://github.com/SimenB/github-actions-cpu-cores)                                 |
| Runs-on | ubuntu-latest                                                          | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                                                                         |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| XUnused     | [https://github.com/mgehre/xunused](https://github.com/mgehre/xunused)                         |

