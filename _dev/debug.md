---
layout: concertina
title: Debugging NeoMutt
description: How to Debug NeoMutt
---

# {{ page.title }}

- Logging
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

