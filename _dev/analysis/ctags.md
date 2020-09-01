---
layout: concertina
title: Ctags
description: Source tags generator
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

`ctags` generates tags files that your editor can use to lookup symbols in the source:
all the functions, structs, global variables, etc.

It can be run:

```sh
# Recursively
ctags -R .

# On specific files
ctags source1.c source2.c
```

Unfortunately, that will include some source that isn't useful.
Using `find` can help exclude some files and directories:

```sh
find . -name '*.[ch]' ! -path './autosetup/*' ! -path './test/*' ! -path './doc/*' ! -path './pgp*.c' | cut -b3- | xargs ctags
```

`ctags` can also extract certain types of information.
This can be useful for analysis of the code.

```sh
ctags -R -x --c-kinds=f   . > functions.txt
ctags -R -x --c-kinds=gsu . > structs.txt
ctags -R -x --c-kinds=v   . > variables.txt
```

- **See also**: [cproto](cproto)

