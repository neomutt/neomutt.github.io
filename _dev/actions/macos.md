---
title:       macOS
description: Test builds on macOS
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/macos.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/macos.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/macos.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
<a href="https://www.apple.com/by/macos/monterey/"><img src="/images/distros/macos.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This is a weekly action that checks the build on macOS.
The current version is macOS 12 (Monterey).

It performs one minimal build of NeoMutt.

See, [How to build NeoMutt](https://neomutt.org/dev/build)

**Steps**:
- Configure NeoMutt
- Build NeoMutt
- Build Tests
- Run Tests

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
| Test Files  | [https://github.com/neomutt/neomutt-test-files](https://github.com/neomutt/neomutt-test-files) |

