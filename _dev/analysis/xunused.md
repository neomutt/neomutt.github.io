---
title: xunused
description: Find unused functions and methods
author: roccoblues
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://github.com/mgehre/xunused](https://github.com/mgehre/xunused)

**xunused** is a tool to find unused C/C++ functions and methods across source
files in the whole project.
It is built upon [clang](https://clang.llvm.org/) to parse the source code.

### Example

Just pass the [compilation database](https://clang.llvm.org/docs/JSONCompilationDatabase.html) as an argument to `xunused`.

```sh
xunused compile_commands.json
```

```
[8/342] Processing file /Users/dennis/projects/neomutt/email/globals.c
[1/342] Processing file /Users/dennis/projects/neomutt/sidebar/sidebar.c
[3/342] Processing file /Users/dennis/projects/neomutt/conn/zstrm.c
[2/342] Processing file /Users/dennis/projects/neomutt/postpone/postpone.c
[...]
color/parse_ansi.c:75: warning: Function 'ansi_skip_sequence' is unused
mutt/buffer.c:701: warning: Function 'buf_lower' is unused
/Users/dennis/projects/neomutt/mutt/buffer.h:81: note: declared here
mutt/buffer.c:715: warning: Function 'buf_upper' is unused
/Users/dennis/projects/neomutt/mutt/buffer.h:82: note: declared here
config/set.c:1083: warning: Function 'cs_str_delete' is unused
/Users/dennis/projects/neomutt/config/set.h:291: note: declared here
config/set.c:885: warning: Function 'cs_str_native_get' is unused
/Users/dennis/projects/neomutt/config/set.h:284: note: declared here
config/set.c:706: warning: Function 'cs_str_string_get' is unused
[...]
```

### Excluding test code

To find functions that are only used by tests but not any other code we need to exclude our test code.

In theory the `-filter` could be used for that. Unfortunately that only works
for *including* paths and not for excluding. And the underlying regular
expression engine doesn't support negative lookahead so something
like `-filter='.+^((?!test).)*$'` also doesn't help.

The easy brute force solution is to simply remove the test folder before running `xunused`.
