---
title: Egypt
description: Source code grapher
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://github.com/neomutt/egypt](https://github.com/neomutt/egypt)

`gcc` can creating profiling info when it builds.
It generates a `.expand` file for each source file.

`egypt` is a script that takes these files and outputs a graphviz file. 

## Building NeoMutt

To build NeoMutt for `egypt`, you need to add a option to the compiler.
The simplest way is to:

```sh
export EXTRA_CFLAGS="-fdump-rtl-expand"
./configure [OPTIONS]
make
```

## Building Graphviz file

`egypt` can be run on any number of `.expand` files.

Just the startup code:

```sh
egypt main.c.*.expand init.c.*.expand > startup.gv
```

The compose dialog:

```sh
egypt compose/*.expand envelope/*.expand > compose.gv
```

## Viewing the Graphviz file

The ImageMagick package has a `display` program that can view `.gv` files
directly.

Alternatively, you can use GraphViz's `dot` program to convert it to an image:

```sh
dot -Tpng compose.gv > compose.png
```

## Filtering the output

The graphviz file is in text format and can get quite verbose.
Especially with the frequent use of library functions.
You may wish to filter out `mutt_buffer_string()`.

## Sample Output

![envelope](/images/graphviz.png)

