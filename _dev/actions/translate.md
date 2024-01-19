---
title:       Translate
description: Update the Translation Leaderboard
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/translate.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/translate.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/translate.yml
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

<a href="https://neomutt.org/translate"><img style="float: right; width: 300px" src="/images/leaderboard.png"></a>

This action updates the [Translation Leaderboard](https://neomutt.org/translate)
every time a translator commits to the `translate` branch in the
[neomutt repo](https://github.com/neomutt/neomutt).

Learn more about [translations](../../translate)

**Steps**:
- Validate translations
- Calculate statistics
- Generate webpage
- Commit to website repo
- Push to website repo

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | `git push`                                                             | To branch `translate`                                                                                                                    |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | [Pablo Morelli](https://github.com/pmorelli92)'s container push action | [https://github.com/pmorelli92/github-container-registry-build-push](https://github.com/pmorelli92/github-container-registry-build-push) |
| Secret  | Personal Access Token                                                  | `TRANSLATE_DEPLOY_KEY`                                                                                                                   |
| Runs-on | ubuntu-latest                                                          |                                                                                                                                          |

### See Also

| Description | Location                                                                                     |
| :---------- | :------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                           |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                               |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                     |
| Scripts     | [https://github.com/neomutt/action-translate](https://github.com/neomutt/action-translate)   |
| Website     | [https://github.com/neomutt/neomutt.github.io](https://github.com/neomutt/neomutt.github.io) |
| Results     | [Translation Leaderboard](https://neomutt.org/translate)                                     |

