---
title: Address Sanitizer
description: Check for memory leaks, buffer overflows, etc
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://clang.llvm.org/docs/AddressSanitizer.html](https://clang.llvm.org/docs/AddressSanitizer.html)

**Note**: Running a program using ASAN will consume more memory and run more slowly than normal.

The Address Sanitizer adds compile-time options that can detect:

- Memory leaks
- Buffer overflows (and underflows)
- Out-of-bounds accesses to heap, stack and globals
- Memory use after free
- Double-free, invalid free

## Building

To build NeoMutt with the Address Sanitizer, you need to add a option to the compiler and linker.
The simplest way is to:

```sh
export EXTRA_CFLAGS="-fsanitize=address"
export EXTRA_LDFLAGS="-fsanitize=address"
```

Then, `./configure` and `make` as normal.

## Address Sanitizer Options

The Address Sanitizer's behaviour can be controlled by setting an environment variable.
Multiple options should be separated with a colon `:`

**Note**: Some platforms will need to use this options to show memory leaks:

```sh
export ASAN_OPTIONS=detect_leaks=1
```

This **highly recommended** option redirects the output to a file
(ncurses can cause the output become garbled).

This will create a file called `asan.PROCESS_ID`

```sh
export ASAN_OPTIONS=log_path=asan
```

This option reduces the clutter in the output:

```sh
export ASAN_OPTIONS=print_legend=0
```

Here are multiple options together, separated by colon `:`

```sh
export ASAN_OPTIONS=print_legend=0:log_path=asan
```

For a fuller list of options, see

- [https://github.com/google/sanitizers/wiki/AddressSanitizerFlags](https://github.com/google/sanitizers/wiki/AddressSanitizerFlags)

## Running NeoMutt

Now, run NeoMutt as normal.

If there are no memory problems, there will be no output from the Address Sanitizer.

## Sample Output

Here's some sample output from a couple of bugs:

### Memory Leak

This shows a simple memory leak.
It shows the callstack up to the point where the memory was allocated.

```reply
==61167==ERROR: LeakSanitizer: detected memory leaks

Direct leak of 19 byte(s) in 1 object(s) allocated from:
    #0 0x7eff1fd87667 in __interceptor_malloc (/lib64/libasan.so.6+0xb0667)
    #1 0x741c95 in mutt_mem_malloc mutt/memory.c:95
    #2 0x48f089 in get_hostname /home/mutt/work/neo/init.c:343
    #3 0x49259e in mutt_init /home/mutt/work/neo/init.c:929
    #4 0x4a4caa in main /home/mutt/work/neo/main.c:665
    #5 0x7eff1ea1c041 in __libc_start_main ../csu/libc-start.c:308

SUMMARY: AddressSanitizer: 19 byte(s) leaked in 1 allocation(s).
```

### Use After Free

This use-after-free example shows the callstack in three places:

- Where the memory was just accessed
- Where the memory was previously freed
- Where the memory was originally allocated

```reply
==60945==ERROR: AddressSanitizer: heap-use-after-free on address 0x60300004e0d0 at pc 0x7fc99e346f85 bp 0x7ffe360a98f0 sp 0x7ffe360a9098
READ of size 2 at 0x60300004e0d0 thread T0
    #0 0x7fc99e346f84  (/lib64/libasan.so.6+0x40f84)
    #1 0x4a9b8e in main /home/mutt/work/neo/main.c:1277
    #2 0x7fc99d04b041 in __libc_start_main ../csu/libc-start.c:308
    #3 0x40d55d in _start (/home/mutt/work/neo/neomutt+0x40d55d)

0x60300004e0d0 is located 0 bytes inside of 25-byte region [0x60300004e0d0,0x60300004e0e9)
freed by thread T0 here:
    #0 0x7fc99e3b6307 in __interceptor_free (/lib64/libasan.so.6+0xb0307)
    #1 0x741c4f in mutt_mem_free mutt/memory.c:75
    #2 0x49151e in mutt_opts_free /home/mutt/work/neo/init.c:691
    #3 0x4a9b6b in main /home/mutt/work/neo/main.c:1273
    #4 0x7fc99d04b041 in __libc_start_main ../csu/libc-start.c:308

previously allocated by thread T0 here:
    #0 0x7fc99e3603a7 in strdup (/lib64/libasan.so.6+0x5a3a7)
    #1 0x74dae5 in mutt_str_dup mutt/string.c:375
    #2 0x74df41 in mutt_str_replace mutt/string.c:451
    #3 0x4a9091 in main /home/mutt/work/neo/main.c:1189
    #4 0x7fc99d04b041 in __libc_start_main ../csu/libc-start.c:308
```

- **See also**: [valgrind](valgrind)

