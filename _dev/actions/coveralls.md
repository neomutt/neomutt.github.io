---
title:       Coveralls
description: Code coverage tests
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/coveralls.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/coveralls.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/coveralls.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
<a href="https://coveralls.io/github/neomutt/neomutt"><img src="https://img.shields.io/coveralls/github/neomutt/neomutt" /></a>
<a href="https://coveralls.io/"><img src="/images/coveralls.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This actions performs coverage tests on the code and uploads the results to the
[Coveralls](https://coveralls.io/) service which stores the results and
generates [pretty graphs](https://coveralls.io/github/neomutt/neomutt).

The coverage tests don't cover the entire codebase, just eight core libraries:
 - [address](https://neomutt.org/code/lib_address.html) - Email Address manipulation
 - [compress](https://neomutt.org/code/lib_compress.html) - Compression code
 - [config](https://neomutt.org/code/lib_config.html) - Config variables
 - [core](https://neomutt.org/code/lib_config.html) - Account and Mailbox code
 - [email](https://neomutt.org/code/lib_email.html) - Email parsing
 - [mutt](https://neomutt.org/code/lib_mutt.html) - Utility code
 - [notmuch](https://neomutt.org/code/lib_notmuch.html) - Notmuch virtual mailbox
 - [store](https://neomutt.org/code/lib_store.html) - Key value store

**Steps**:
- Build Neomutt
- Build Tests
- Make Coverage
- Upload results to Coveralls

### Action Details

| Key     | Description                                                    | Details                                                                                        |
| :------ | :------------------------------------------------------------- | :--------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                       | Mondays at 3am                                                                                 |
| Trigger | Workflow (manual)                                              | [{{page.logs}}]({{page.logs}})                                                                 |
| Uses    | GitHub's checkout action                                       | [https://github.com/actions/checkout](https://github.com/actions/checkout)                     |
| Uses    | [Hendrik Muhs](https://github.com/hendrikmuhs)' ccache-action  | [https://github.com/hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)   |
| Uses    | [Coverall](https://coveralls.io/)'s github-action              | [https://github.com/coverallsapp/github-action](https://github.com/coverallsapp/github-action) |
| Runs-on | ubuntu-latest                                                  | [neomutt/docker-build](https://ghcr.io/neomutt/docker-build)                                   |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Test Files  | [https://github.com/neomutt/neomutt-test-files](https://github.com/neomutt/neomutt-test-files) |
| Results     | [Code Coverage](https://coveralls.io/github/neomutt/neomutt)                                   |

