---
title: Makefiles
description: Tidy the Makefiles
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

The build machinery contains quite a few lists, e.g. files to be compiled.

- `auto.def`
- `contrib/Makefile.autosetup`
- `doc/Makefile.autosetup`
- `Makefile.autosetup`
- `po/Makefile.autosetup`
- `test/Makefile.autosetup`

Review the file lists:

- Unwrap long lists
- Sort them alphabetically
- Wrap them back to 80 characters

:spiral_notepad: **Note**: Please sort in the `C` locale, e.g.

```sh
LANG=C sort < list
```

