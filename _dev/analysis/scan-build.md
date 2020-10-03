---
title: Scan-Build
description: Source code analyser
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://clang-analyzer.llvm.org/scan-build.html](https://clang-analyzer.llvm.org/scan-build.html)

scan-build is a static analyzer and part of the clang family of tools.
It can detect:
- Resource leaks
- Potential NULL dereferences
- Logically dead code
- and much more

It will create an HTML report for all the issues that it finds.
It's very simple to run:

```sh
# Configure NeoMutt as normal
./configure [OPTIONS]
# Run make under scan-build
scan-build make
```

- **See also**: [coverity](coverity)

