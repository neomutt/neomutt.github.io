---
title:       CIFuzz
description: Code Fuzzing
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/cifuzz.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/cifuzz.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/cifuzz.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
<a href="https://github.com/CodeIntelligenceTesting/cifuzz"><img src="/images/distro/cifuzz.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This action performs fuzzing on the code to detect errors.

**Steps**:
- Build Fuzzers
- Run Fuzzers

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | `git push`                                                             | To branch `main`                                                                                                                         |
| Trigger | Pull Request                                                           |                                                                                                                                          |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | Google's oss-fuzz                                                      | [https://github.com/google/oss-fuzz](https://github.com/google/oss-fuzz)                                                                 |
| Uses    | GitHub's upload artifacts action                                       | [https://github.com/actions/upload-artifact](https://github.com/actions/upload-artifact)                                                 |
| Runs-on | ubuntu-latest                                                          | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                                                                         |

### See Also

| Description | Location                                                                                               |
| :---------- | :----------------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                                     |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                         |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                               |
| CIFuzz      | [https://github.com/CodeIntelligenceTesting/cifuzz](https://github.com/CodeIntelligenceTesting/cifuzz) |

