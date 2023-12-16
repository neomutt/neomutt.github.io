---
title:       Fedora
description: Do test builds on some Fedora releases
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/fedora.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/fedora.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/fedora.yml
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

This is a weekly action that checks the build on the Fedora releases.
The current versions are: 37 (previous), 38 (current) and 39 (Rawhide).

For each of of the releases it does three builds: default, minimal and everything.

See, [How to build NeoMutt](https://neomutt.org/dev/build)

**Steps**:
- Build NeoMutt
- Build Tests
- Run Tests

### Action Details

| Key     | Description                                                    | Details                                                                                        |
| :------ | :------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                       | Mondays at 3am                                                                                 |
| Trigger | Workflow (manual)                                              | [{{page.logs}}]({{page.logs}})                                                                 |
| Uses    | GitHub's checkout action                                       | [https://github.com/actions/checkout](https://github.com/actions/checkout)                     |
| Uses    | [Hendrik Muhs](https://github.com/hendrikmuhs)' ccache-action  | [https://github.com/hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)   |
| Runs-on | ubuntu-latest                                                  | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                               |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Test Files  | [https://github.com/neomutt/neomutt-test-files](https://github.com/neomutt/neomutt-test-files) |

