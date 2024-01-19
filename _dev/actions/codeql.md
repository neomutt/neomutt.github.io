---
title:       CodeQL
description: Static Code Checking
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/codeql.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/codeql.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/codeql.yml
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

This action performs static code checks.

**Steps**:
- Configure Neomutt
- Build Neomutt
- Run CodeQL checker

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | `git push`                                                             | To branch `main`                                                                                                                         |
| Trigger | Pull Request                                                           |                                                                                                                                          |
| Trigger | Schedule                                                               | Mondays at 3am                                                                                                                           |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | [Simen Bekkhus](https://github.com/SimenB)' cpu-cores action           | [https://github.com/SimenB/github-actions-cpu-cores](https://github.com/SimenB/github-actions-cpu-cores)                                 |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | GitHub's CodeQL action                                                 | [https://github.com/github/codeql-action](https://github.com/github/codeql-action)                                                       |
| Runs-on | ubuntu-latest                                                          | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                                                                         |

### See Also

| Description | Location                                                                           |
| :---------- | :--------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                 |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                     |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)           |
| CodeQL      | [https://github.com/github/codeql-action](https://github.com/github/codeql-action) |

