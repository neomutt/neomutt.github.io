---
title:       ASAN
description: Build the code using the Address Sanitizer
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/asan.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/asan.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/asan.yml
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

This action uses the [Address Sanitizer (ASAN)](../analysis/asan)
to build NeoMutt and the tests.

If any of the tests crash or leak memory, then ASAN will log the problem.
Any ASAN logs will be saved as an "Artifact".
It can be downloaded from Summary page of the Action Run.

See, [How to build NeoMutt](https://neomutt.org/dev/build)

**Steps**:
- Build Tests
- Run Tests
- Upload ASAN Log (on failure)

### Action Details

| Key     | Description                                                    | Details                                                                                        |
| :------ | :------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| Trigger | `git push`                                                     | To branches `main` or `devel/*`                                                                |
| Trigger | Pull Request                                                   |                                                                                                |
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

