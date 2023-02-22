---
title: Build Testing
description: Perform tests on the code
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

Before making a release, it's important to perform a wide variety of test builds.

**Repos needed**:
- [https://github.com/neomutt/management](https://github.com/neomutt/management)
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)

## [release]

The simplest way to test the code is to create a `[release]` branch in the `neomutt` repo.

```sh
../management/travis/release-install.sh
git push --force --set-upstream origin release
```

**Tests performed**:

- Build Source:
  - Using defaults
  - Include everything
  - Using slang
  - Using curses
- Test install
- Test uninstall
- Translations:
  - Check POTFILES
  - Check po files for validity
  - Test `make update-po`
- Test docs are valid
- Test config variables:
  - Check for new/deleted config
  - Check for changed default values
- Run unit tests
- Test Doxygen docs build
- Test whitespace
  - Check for trailing whitespace
  - Check for tabs in code
  - Check for space-tab
- Test out-of-tree
  - Build using curses
  - Test install
  - Test uninstall

## Extra tests

- Tidy the source code (but not the header files)
  `clang-format`

- Static analysis of the code
  `scan-build`

- Check the `#include`s are correct (and minimal)
  `iwyu`

- Check the spelling in the source
  `codespell`

- Parallel builds
  `parallel ../management/build/build-parallel.sh gcc {} :::: ../management/build/build-parallel.txt`

For more details, see: [Analyze NeoMutt](https://neomutt.org/dev/analysis)

