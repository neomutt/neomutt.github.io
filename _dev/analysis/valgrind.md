---
layout: concertina
title: Valgrind
description: Run time memory checker
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [http://valgrind.org/](http://valgrind.org/)

Valgrind is a set of debugging tools.

**Note**: Running a program under will consume more memory and run much more slowly than normal.

### Memchecker

The default tool is a memory-checker, e.g.

```sh
valgrind -v --leak-check=full --track-origins=yes neomutt
```

The results can be saved to a file by adding `--log-file v.txt`

It reports:
- Leaked memory (and where it was allocated)
- Out of bounds memory accesses
- Conditionals that relied on uninitialised memory

```reply
LEAK SUMMARY:
   definitely lost: 1,368 bytes in 22 blocks
   indirectly lost: 179 bytes in 5 blocks
     possibly lost: 1,352 bytes in 18 blocks
   still reachable: 672,679 bytes in 640 blocks
```

### Memchecker Suppressions

Memchecker reports **every** problem it finds, including any shared libraries.
These false-positives can be ignored using a suppression file.
To generate one, run the program with an extra argument:

```sh
valgrind -v --leak-check=full --track-origins=yes --gen-suppressions=all neomutt
```

Valgrind's output will include suppression blocks like this:

```reply
{
   <insert_a_suppression_name_here>
   Memcheck:Leak
   match-leak-kinds: possible
   fun:calloc
   fun:g_malloc0
   fun:type_node_any_new_W
   fun:type_node_fundamental_new_W
   fun:g_type_register_fundamental
   fun:_g_object_type_init
   fun:gobject_init
   fun:gobject_init_ctor
   fun:call_init.part.0
   fun:call_init
   fun:_dl_init
   obj:/usr/lib64/ld-2.27.so
}
```

Cut out the ones you'd like to ignore, then put them in a file, `sup.txt`, then
re-run your program:

```sh
valgrind -v --leak-check=full --track-origins=yes --suppressions=sup.txt neomutt
```

### Callgrind

Callgrind is a profiler.  It records which functions are called, how often and
how long each one took, e.g.

```sh
valgrind --tool=callgrind neomutt
```

It creates a log file `callgrind.out.[PID]` which can be viewed in
[kcachegrind](https://kcachegrind.github.io/html/Home.html).

[![kcachegrind](/images/kcg-thumb.png)](/images/kcachegrind.png)

### Debugging with Valgrind

[Running NeoMutt under a debugger](../build/debug) can be a good way to find bugs, but
sometimes it's hard to see the **exact** point when something goes wrong.
Using Valgrind and gdb in combination, it's possible to trap the instruction
that causes a buffer overrun, or reads an uninitialised piece of memory.

**Note**: Memory **leaks** can't be detected as they happen.

Window 1:
```sh
valgrind --vgdb=yes --vgdb-error=0 neomutt [ARGS]
```

Window 2:
```sh
gdb neomutt
# Inside gdb
target remote | vgdb
continue
```

Valgrind adds extra commands to gdb to examine the memory.
See [Valgrind's documentation](http://valgrind.org/docs/manual/manual-core-adv.html) for more details.

