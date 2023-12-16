---
title:       Debug
description: Test all configure's --debug-* options
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/debug.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/debug.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/debug.yml
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

This is a weekly action that does a sanity check on all the debug options.
It performs one build with each option enabled and one build with all the options enabled.
The options include:

- `--debug-email`
- `--debug-graphviz`
- `--debug-window`
- ...

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
| Uses    | GitHub's upload artifacts action                               | [https://github.com/actions/upload-artifact](https://github.com/actions/upload-artifact)       |
| Uses    | [Hendrik Muhs](https://github.com/hendrikmuhs)' ccache-action  | [https://github.com/hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)   |
| Runs-on | ubuntu-latest                                                  | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                               |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Test Files  | [https://github.com/neomutt/neomutt-test-files](https://github.com/neomutt/neomutt-test-files) |

