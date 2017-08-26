---
layout: concertina
title: Making NeoMutt
description: How NeoMutt Assembles the Source
---

# {{ page.title }}

The NeoMutt build relies on a lot of pre-/post-processing.

The diagrams below shows how the code and docs fit together.

[![make](/images/make-code-thumb.png)](/images/make-code.png) [![make](/images/make-docs-thumb.png)](/images/make-docs.png)

**Key**:
- Ellipse    : source file
- Square     : action
  - Blue square  : normal command
  - Green square : mutt script/command
- Red dot    : action is dependent on the environment (OS, libs, etc)
- Green star : action is dependent on user configuration
- {Braces}   : multiple files follow this pattern

**Source Code**:
- compulsory    : always compiled into mutt
- conditional   : depends on user config
- environmental : depends on OS's available libraries
- generated     : created from other files
- shared        : used in multiple places

**Diagram Source**:
- [Code](make-code.gv)
- [Docs](make-docs.gv)

Render the diagram with the command:
```
dot -Tpng make.gv > make.png
```

(from the `graphviz` package)

