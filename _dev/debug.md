---
layout: concertina
title: Debugging NeoMutt
description: How to Debug NeoMutt
---

# {{ page.title }}

When things needs further investigation

## Available procedures

- Logging
- Compile with debugging information
- Starting NeoMutt in a debugger, e.g. [cgdb](https://cgdb.github.io/)
- Attaching a debugger to NeoMutt
- Debugging a coredump

## Logging in NeoMutt

```
mutt -d 5
```

```
tail -F ~/.muttdebug0
```

## Compile with debugging information

You can compile NeoMutt with debugging information.
Follow the guidelines on how to compile NeoMutt according to your distribution, and when executing make, pass the `-g` flag:

```shell
make EXTRA_CFLAGS=-g
```

## Starting NeoMutt in a debugger

```
cgdb neomutt
```

## Attaching a debugger to NeoMutt

```
ps ux | grep "neomutt"
cgdb --pid 1234
```

## Debugging a coredump

```
cgdb neomutt coredump
```

