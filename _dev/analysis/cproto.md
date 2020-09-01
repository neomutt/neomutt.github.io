---
layout: concertina
title: Cproto
description: Function prototype generator
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://invisible-island.net/cproto/cproto.html](https://invisible-island.net/cproto/cproto.html)

Given a source file, cproto, will generate prototypes for all the functions.
This is slightly useful on its own, but it can be used as the basis for:

- analysing functions and parameters
- generating doxygen comment blocks

```sh
cproto -D USE_SIDEBAR=1 -I .  -s source.c
```

- **See also**: [ctags](ctags)

