---
layout: concertina
title: Debugging NeoMutt
description: When things needs further investigation
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include build-links.html %}

## Available procedures

- [Logging](#logging)
- [Compile with debugging information](#compile)
- [Starting NeoMutt in a debugger](#debugger)
- [Attaching a debugger to NeoMutt](#attach)
- [Debugging a coredump](#coredump)

## Logging in NeoMutt <a id="logging"></a>

Enabling logging is the simplest method to find the cause of a problem.
The logging levels run from 1 (least) to 5 (most).

**Note**: Higher logging levels may contain private data.  Be careful before showing anyone.

Start NeoMutt with some logging:

```
neomutt -d 2
```

By default, NeoMutt will log to the file: `~/.neomuttdebug0`  
The file will be rotated each time NeoMutt is run.  
The filename can be overridden on the command line with the `-l` option.

The logging can be enabled in the config file with:

```
set debug_level = 2
set debug_file = neolog
```

## Compile with debugging information <a id="compile"></a>

You can compile NeoMutt with debugging information.
Follow the guidelines on how to compile NeoMutt according to your distribution, and when executing make, pass extra flags:

```shell
make EXTRA_CFLAGS="-g -O0"
```

## Starting NeoMutt in a debugger <a id="debugger"></a>

A good choice of debugger is `cgdb` (the curses front-end to `gdb`).
Alternatively, you can use the the Text User Interface (TUI) of `gdb -tui`

**Note**: When you run the debugger, it might suggest that you install development and debugging libraries.
This is a good idea!

NeoMutt is a curses app which makes it tricky to debug.
A simple solution is to use two windows.

In the **first** window, find out the device and sleep for ages.  
This window is where NeoMutt will appear.
Yours will be different (make a note).

```
tty
sleep 10000
```
```reply
/dev/pts/5
```

In the **second** window, we'll run the debugger, e.g. `cgdb`

```sh
cgdb neomutt

# Inside cdgb, set up the windows
tty /dev/pts/5
handle SIGPIPE noprint nostop
# set the default parameters for neomutt
set args -d 2
```

Now we're ready to debug, so run neomutt:

```
run
```

You'll see neomutt start up in the **first** window.  
You can use it as normal.  

Next, in the **second** window, hit <kbd>Ctrl-C</kbd>  
The debugger will stop and you can...

```shell
# Get a backtrace
bt
# Set a breakpoint
b mutt_getch
# Examine a variable
p Incoming->path
# Continue running
c
```

## Attaching a debugger to NeoMutt <a id="attach"></a>

If NeoMutt is already running, you can attach a debugger to it

```
ps ux | grep "neomutt"
cgdb --pid 1234
```

Once attached, you can:

```shell
# Get a backtrace
bt
# Set a breakpoint
b mutt_getch
# Examine a variable
p Incoming->path
# Continue running
c
```

## Debugging a coredump <a id="coredump"></a>

If NeoMutt crashes, it may leave a coredump (an image of the program at the time it crashed).
The location of this file depends on your OS and your account settings.

```
cgdb neomutt coredump
```

Then in `cgdb`, get a backtrace:

```
bt
```
