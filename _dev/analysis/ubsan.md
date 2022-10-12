---
title: Undefined Behaviour Sanitizer
description: Check for undefined behaviour
author: pmatos
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html)

**Note**: Running a program using UBSAN will incur in a small runtime cost.

## Building

To build NeoMutt with the Undefined Behaviour sanitizer, you need to add a option to the compiler and linker.
The simplest way is to:

```sh
./configure --ubsan [OPTIONS]
make
```

Alternatively, you can specify additional build flags:

```sh
export EXTRA_CFLAGS="-fsanitize=undefined"
export EXTRA_LDFLAGS="-fsanitize=undefined"
./configure [OPTIONS]
make
```

There are further options that allows you to select specific groups of warnings, while disabling others. If you really want to dabble with this, please check the documentation on the [Clang site](https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html).

## Running NeoMutt

Now, run NeoMutt as normal.

If there are undefined behaviour issues, you'll see messages during runtime starting with `runtime error:`, otherwise no error has been found on the current execution path.

## Sample Output

Here's a sample output found by `gahr` during an initial run of this sanitizer:

```reply
imap/mdata.c:117:28: runtime error: load of misaligned address 0x00080402dfc6 for type 'uint32_t' (aka 'unsigned int')
```

- **See also**: [asan](asan)
