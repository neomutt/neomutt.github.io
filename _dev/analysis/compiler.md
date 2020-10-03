---
title: Compiler
description: Enable gcc/clang warnings
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- gcc [https://gcc.gnu.org/](https://gcc.gnu.org/)
- clang [https://clang.llvm.org/](https://clang.llvm.org/)
- ccache [https://ccache.samba.org/](https://ccache.samba.org/)
- [build scripts](https://github.com/neomutt/management/blob/master/build/README.md#developer-build-scripts)

One of the simplest ways to check your code is to turn on lots of compiler warnings.
You may not agree with some of them, but they highlight potential problems that can be easily avoided.

### Extra Flags

It's simple to add extra compiler/linker flags: set `EXTRA_CFLAGS` and/or `EXTRA_LDFLAGS`  
They will be appended to NeoMutt's settings, e.g.

```sh
./configure OPTIONS
# Enable debugging
make EXTRA_CFLAGS="-ggdb3 -O0 -DDEBUG"
```

### ccache

The Compiler Cache `ccache` is a must for any developer.  
Every time you compile a file, it keeps a hash of the preprocessed file and the object file that it created.
If you build that file again (and it hasn't changed), then the cached version will be used.

### Developer Build Scripts

NeoMutt has published [two build scripts for developers](https://github.com/neomutt/management/blob/master/build/README.md#developer-build-scripts).

Their style makes it very easy to enable/disable or add/remove compilation options.

