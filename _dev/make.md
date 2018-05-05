---
layout: concertina
title: Making NeoMutt
description: How NeoMutt Assembles the Source
---

# {{ page.title }}

The NeoMutt build relies on a lot of pre-/post-processing.

The diagrams below shows how the code and docs fit together.

[![make](/images/make-code-thumb.png)](/images/make-code.png 'click to enlarge')
[![make](/images/make-docs-thumb.png)](/images/make-docs.png 'click to enlarge')

**Key**:

- Ellipse        : source file
- Square         : action
  - Blue square  : normal command
  - Green square : NeoMutt script/command
- Red dot        : action is dependent on the environment (OS, libs, etc.)
- Green star     : action is dependent on user configuration
- {Braces}       : multiple files follow this pattern

**Source Code**:

- compulsory     : always compiled into NeoMutt
- conditional    : depends on user config
- environmental  : depends on OS's available libraries
- generated      : created from other files
- shared         : used in multiple places

**Diagram Source**:

- [Code](/images/make-code.gv)
- [Docs](/images/make-docs.gv)

Render the diagrams with the `dot` command:

```
dot -Tpng make-code.gv > make-code.png
dot -Tpng make-docs.gv > make-docs.png
```

(from the [`graphviz` package](http://graphviz.org/))

