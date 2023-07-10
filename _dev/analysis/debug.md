---
title: Debug
description: Configure Debug Options
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

NeoMutt can be built with a variety of different debugging options.

They enable code that _might_ be useful to other developers.

| Configure Option    | Description                             |
| :------------------ | :-------------------------------------- |
| `--debug-backtrace` | Enable backtrace support with libunwind |
| `--debug-color`     | Enable Color dump                       |
| `--debug-email`     | Enable Email dump                       |
| `--debug-graphviz`  | Enable Graphviz dump                    |
| `--debug-names`     | Enable Name lookup tables               |
| `--debug-notify`    | Enable Notifications dump               |
| `--debug-queue`     | Enable TAILQ debugging                  |
| `--debug-window`    | Enable windows dump                     |

These options are tested weekly by the [Debug Action](https://github.com/neomutt/neomutt/actions/workflows/debug.yml).

- **See also**: [Actions](https://neomutt.org/dev/actions)

## Backtrace

If you have `libunwind` installed, then NeoMutt can generate backtraces if it
crashes or exits abnormally.  The output is also logged to `.neomuttdebug0`

This is useful, but no substitute for [ASAN](asan.md).

```sh
# Enable backtrace support with libunwind
./configure --debug-backtrace
```

The output might look like this:

```reply
NeoMutt 20230517-195-e79e91-dirty
Backtrace
    curses_segv_handler() ip = 25, sp = 7ffd889bb740
    op_print() ip = 41, sp = 7ffd889bc4d0
    index_function_dispatcher() ip = 14f, sp = 7ffd889bc520
    dlg_index() ip = bf3, sp = 7ffd889bc590
    main() ip = 2816, sp = 7ffd889bca30

Segmentation fault (core dumped)
```

## Color

The colours are stored in lots of global variables.

```sh
# Enable Color dump
./configure --debug-color
```

Enabling this option exposes a suite of functions to dump the colours to the log.

Where possible, ANSI escape sequence will be logged so that `cat`ing the log will show the correct colours.

- `attr_color_list_dump()`
- `curses_colors_dump()`
- `merged_colors_dump()`
- and many more

It also defines a `color_debug()` function that works like `mutt_debug()`.

**Note**: The functions are all conditionally defined.  There's no need for `#ifdef USE_DEBUG_COLOR` around them.

## Email

Sometimes a quick dump is all you need.

```sh
# Enable Email dump
./configure --debug-email
```

This exposes a some functions to dump the contents of an `Email`.

- `dump_email()`
- `dump_body()`
- `dump_envelope()`
- ...

The output looks like this:

```reply
Email
    path: cur/1656086025.R18315247289739240151.flatcap:2,S
    Flags: display_subject,mime,old,read,recip_valid,subject_changed,threaded,visible
    Security: [NONE]
    Sent: Tue, 16 Jul 2019 11:29:41 UTC (+0100)
    Recv: Tue, 16 Jul 2019 11:29:41 UTC
    num_hidden: 0
    recipient: 4
    offset: 0
    lines: 0
    index: 1106
    msgno: 1094
    vnum: 1094
    score: 0
    attach_total: 0
```

## Graphviz

Often when debugging, it's hard to visualise how object fit together.
Graphviz can help by generating **live** diagrams.

```sh
# Enable Graphviz dump
./configure --debug-graphviz
```

When enabled, it exposes four functions to dump various objects and their children:

- `dump_graphviz()` - Dump a `MailboxView`
- `dump_graphviz_attach_ctx()` - Dump an `AttachCtx`
- `dump_graphviz_body()` - Dump the `Body` of an `Email`
- `dump_graphviz_email()` - Dump an entire `Email`

The code in `debug/graphviz.c` contains a number of defines that control the display, e.g. `GV_HIDE_ADATA`

```c
#include "debug/lib.h"

// ...
dump_graphviz("title", mv);
```

It will create a dated file in the current directory, e.g. `17\:42\:05-title.gv`

The ImageMagick package has a `display` program that can view `.gv` files directly.

Alternatively, you can use GraphViz's `dot` program to convert it to an image:

```sh
dot -Tpng file.gv > file.png
```

The output can look like this:

<img width="800" src="https://raw.githubusercontent.com/neomutt/gfx/main/account/imap.svg">

**Note**: The pointer values are real!

## Names

When debugging, it's often useful to display the symbolic name rather than just `42`.

```sh
# Enable Name lookup tables
./configure --debug-names
```

Enabling this option exposes functions to name various types, e.g.

- `name_menu_type()` for `enum MenuType`
- `name_notify_mailbox()` for `enum NotifyMailbox`

More types are welcome.

## Notify

More and more of NeoMutt is driven by notifications.
Keeping track of them can be hard.

```sh
# Enable Notifications dump
./configure --debug-notify
```

When enabled, NeoMutt creates an observer on the `NeoMutt` object that dumps every notification.
It tries to dump as much information as it can, e.g.

```reply
Notification: NT_INDEX
    Event Type: 13
    Event Sub-type: 64
    Event Data: 0x1dad1c0
    Global Data: (nil)
```

## Queue

The Linux and BSD kernels share an implementation of List and Queue types.
NeoMutt has adopted it too.

It's very powerful, but quite hard to understand.

```sh
# Enable TAILQ debugging
./configure --debug-queue
```

Enabling this option turns on debugging in the List/Queue macros.
When they change, the objects will store their old state and the address of the code that changed them.

## Window

NeoMutt's windows are actually a tree of nested windows.

The [gfx repo](https://github.com/neomutt/gfx/tree/main/screenshots/window#window-layouts-for-neomutt) has lots of diagrams.

```sh
# Enable windows dump
./configure --debug-window
```

When enabled, NeoMutt will dump the state of all the windows to the log.
Using `tail`, you can watch the output live.

```sh
tail -F ~/.neomuttdebug0 | sed 's/.*\]<.> [a-z0-9_]\+() //'
```

The output shows:
- Whether it's visible `✓` or not `✗`
- It's absolute screen position, `[20,11]`
- The size of the window: fixed, maximise, minimise
- Whether it expands horizontally, or vertically
- The type, e.g. `WT_HELP_BAR`
- The window's size `(75,10)`
- And which is focussed, `<-- FOCUS`

```reply
✓[0,0] MUTT_WIN_SIZE_FIXED-V WT_ROOT (95,22)
    ✗[0,0] MUTT_WIN_SIZE_FIXED-V WT_HELP_BAR (95,1)
    ✓[0,0] MUTT_WIN_SIZE_MAXIMISE-V WT_ALL_DIALOGS (95,21)
        ✓[0,0] MUTT_WIN_SIZE_MAXIMISE-H WT_DLG_INDEX (95,21)
            ✓[0,0] MUTT_WIN_SIZE_FIXED-H WT_SIDEBAR (20,21)
            ✓[20,0] MUTT_WIN_SIZE_MAXIMISE-V WT_CONTAINER (75,21)
                ✓[20,0] MUTT_WIN_SIZE_MINIMISE-V WT_INDEX (75,11)
                    ✓[20,0] MUTT_WIN_SIZE_FIXED-V WT_MENU (75,10)
                    ✓[20,10] MUTT_WIN_SIZE_FIXED-V WT_STATUS_BAR (75,1)
                ✓[20,11] MUTT_WIN_SIZE_MAXIMISE-V WT_PAGER (75,10)
                    ✓[20,11] MUTT_WIN_SIZE_MAXIMISE-V WT_CUSTOM (75,9) <-- FOCUS
                    ✓[20,20] MUTT_WIN_SIZE_FIXED-V WT_STATUS_BAR (75,1)
    ✓[0,21] MUTT_WIN_SIZE_MINIMISE-V WT_CONTAINER (95,1)
        ✓[0,21] MUTT_WIN_SIZE_FIXED-V WT_MESSAGE (95,1)
```

