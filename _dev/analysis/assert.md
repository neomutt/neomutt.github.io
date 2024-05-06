---
title: Assertions
description: Check for unexpected events
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

## `assert()` - abort the program if assertion is false

The `assert()` macro can help programmers find bugs in their programs, or
handle exceptional cases via a crash that will produce limited debugging output.

It's a useful tool, but it has some limitations when used in NeoMutt:

- It doesn't clear the screen.
- A debugger stops about 6 levels beneath the actual macro
- It kills the running program

## `ASSERT()` - stop the program if assertion is false

NeoMutt now has an upgraded `ASSERT()` macro.

1. It calls `endwin()` to reset the screen mode
2. A debugger will stop **ON** the macro, rather than about 6 levels beneath it
3. You can continue running NeoMutt by stepping over the `ASSERT()`

Inspiration from Chris Wellons' https://nullprogram.com/blog/2022/06/26/

## Using `ASSERT()`

To use the `ASSERT()` macro:

```c
#include "mutt/lib.h"

void function(const char *str)
{
  ASSERT(str);
}
```

To disable the macro at build time, define `NDEBUG`, e.g.

```sh
./configure OPTIONS...
make "EXTRA_CFLAGS="-DNDEBUG"
```

## Sample Output

When combined with `configure --debug-backtrace` the output may look like:

```
NeoMutt 20240425-37-55fed8
Backtrace
    assertion_dump() ip = 21, sp = 7ffd651127a0
    op_print() ip = 4c, sp = 7ffd651127d0
    index_function_dispatcher() ip = 14e, sp = 7ffd65112820
    dlg_index() ip = b70, sp = 7ffd65112890
    main() ip = 2a41, sp = 7ffd65112950

index/functions.c:2080:op_print() -- assertion failed ((priv->menu->current % 2) == 1)
Illegal instruction (core dumped)
```

## Debugging

When the assertion fails, the debugger will stop immediately on the `ASSERT()` line.
This gives you a chance to examine the variables, and even **step over the problem**.

```c
2075│ /**
2076│  * op_print - Print the current entry - Implements ::index_function_t - @ingroup index_function_api
2077│  */
2078│ static int op_print(struct IndexSharedData *shared, struct IndexPrivateData *priv, int op)
2079│ {
2080├─> ASSERT((priv->menu->current % 2) == 1);
2081│   struct EmailArray ea = ARRAY_HEAD_INITIALIZER;
2082│   ea_add_tagged(&ea, shared->mailbox_view, shared->email, priv->tag_prefix);
2083│   mutt_print_message(shared->mailbox, &ea);
2084│   ARRAY_FREE(&ea);
2085│
2086│   /* in an IMAP folder index with imap_peek=no, printing could change
2087│    * new or old messages status to read. Redraw what's needed.  */
2088│   const bool c_imap_peek = cs_subset_bool(shared->sub, "imap_peek");
2089│   if ((shared->mailbox->type == MUTT_IMAP) && !c_imap_peek)
2090│   {
2091│     menu_queue_redraw(priv->menu, (priv->tag_prefix ? MENU_REDRAW_INDEX : MENU_REDRAW_CURRENT));
2092│   }
2093│
2094│   return FR_SUCCESS;
2095│ }
```

In `gdb`, you can step over this problem by jumping to a new line, e.g. `j 2094`

NeoMutt will continue running and at the next refresh repaint the entire screen.
