---
title:       Doxygen
description: Build code docs
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/doxygen.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/doxygen.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/doxygen.yml
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

This action updates the [Code Docs](https://code.neomutt.org).

NeoMutt's code is thoroughly commented using Doxygen comment blocks.<br>
(Every function, struct, enum, global, and most members are documented)

Learn more about [Doxygen](../doxygen)

```comment
/**
 * mutt_path_basename - Find the last component for a pathname
 * @param str String to be examined
 * @retval ptr Part of pathname after last '/' character
 */
```

**Steps**:
- Validate the Doxygen headers
- Generate docs
- Commit to docs repo
- Push to docs repo

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                               | Mondays at 3am                                                                                                                           |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | [Pablo Morelli](https://github.com/pmorelli92)'s container push action | [https://github.com/pmorelli92/github-container-registry-build-push](https://github.com/pmorelli92/github-container-registry-build-push) |
| Secret  | Personal Access Token                                                  | `DOXYGEN_DEPLOY_KEY`                                                                                                                     |
| Runs-on | debian:sid                                                             | (for latest version of doxygen)                                                                                                          |

### See Also

| Description | Location                                                                                     |
| :---------- | :------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                           |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                               |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                     |
| Scripts     | [https://github.com/neomutt/action-doxygen](https://github.com/neomutt/action-doxygen)       |
| Docs Repo   | [https://github.com/neomutt/code](https://github.com/neomutt/code)                           |
| Results     | [Code Docs](https://code.neomutt.org)                                                        |

