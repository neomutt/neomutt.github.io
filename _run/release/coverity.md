---
title: Coverity
description: Run static checks on the code
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

[Coverity](https://scan.coverity.com/projects/neomutt-neomutt) is a static analyser -- it checks the code for potential problems.

**Repos needed**:
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/management](https://github.com/neomutt/management)

## Install

To check the code, first create a `[coverity]` branch in the `neomutt` repo and push it to GitHub.

```sh
../management/travis/coverity-install.sh
git push --force --set-upstream origin coverity
```

Check the results of the build:
- [https://github.com/neomutt/neomutt/branches](https://github.com/neomutt/neomutt/branches)
- [https://travis-ci.org/neomutt/neomutt/branches](https://travis-ci.org/neomutt/neomutt/branches)

## Review Defects

After analysis, check the results:
- [https://scan.coverity.com/projects/neomutt-neomutt](https://scan.coverity.com/projects/neomutt-neomutt)

If necessary fix any defects that might impact the release.

