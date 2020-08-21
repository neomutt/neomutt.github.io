---
layout: concertina
title: Clang-Format
description: Source code formatter
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://clang.llvm.org/docs/ClangFormat.html](https://clang.llvm.org/docs/ClangFormat.html)

`clang-format` is a source code formatter -- it changes source files according to a config file.

In NeoMutt we use it to:
- Place `{}`s in the right place
- Adjust the whitespace: indent and around operators
- Sort the `#include`s (see the weighting strategy)
- Align a pointer `*` to the variable, not the type
- ... and much more

Unlike many similar tools, it really understands the code it's transforming.
It uses [clang](https://clang.llvm.org/) to create an
[AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the code.

[NeoMutt's config file](https://github.com/neomutt/neomutt/blob/master/.clang-format) ships with the code.

The config file looks like this:

```reply
Language: Cpp

TabWidth:          8
UseTab:            Never
IndentWidth:       2
ColumnLimit:       80
BreakBeforeBraces: Allman
```

Clang has documentation for [all of the options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html).

Running it is as simple as:

```sh
clang-format -i source.c
```

- As part of the release process, clang-format is run on all the 'c' source.
- The header files are tidied by hand to preserve the whitespace layout.
- Some small parts of the code are protected from change with these comment blocks

```c
// clang-format off
code here will not be formatted
// clang-format on
```
