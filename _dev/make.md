---
layout: concertina
title: Making NeoMutt
description: How NeoMutt Assembles the Source
---

# {{ page.title }}

The NeoMutt build relies on a lot of pre-/post-processing.

The diagram below shows how all the files fit together.

[![make](/images/make-thumb.png)](/images/make.png)

**Key**:
- Ellipse    : source file
- Square     : action
  - Blue square  : normal command
  - Green square : mutt script/command
- Red dot    : action is dependent on the environment (OS, libs, etc)
- Green star : action is dependent on user configuration
- {Braces}   : multiple files follow this pattern

**Source Code**:
- compulsory   : always compiled into mutt
- conditional  : depends on user config
- enviromental : depends on OS's available libraries
- generated    : created from other files
- shared       : used in multiple places

[Diagram's source](make.gv)

Render the diagram with the command:
```
dot -Tpng make.gv > make.png
```

(from the `graphviz` package)

