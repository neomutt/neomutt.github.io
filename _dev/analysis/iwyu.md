---
title: Include-What-You-Use
description: Header file checker
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://include-what-you-use.org/](https://include-what-you-use.org/)

**iwyu** is a tool for deciding which `#include`s are needed, or not.
Including the right files, and no more, can speed up builds.
It also helps to show the dependencies of a file.

**iwyu** uses [clang](https://clang.llvm.org/) to create an
[AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the code.

### Example

A sample call and its output.

```sh
iwyu -I. -Xiwyu --no_comments -Xiwyu --pch_in_code -Xiwyu --mapping_file=neomutt.imp thread.c
```

```reply
thread.c should remove these lines:
- #include "globals.h"

The full include-list for thread.c:
#include "config.h"
#include "thread.h"
#include <limits.h>
#include <stdlib.h>
#include <time.h>
#include "body.h"
#include "header.h"
#include "mutt/mutt.h"
#include "sort.h"
```

Common options used are:

| Option                       | Description                            | Notes           |
| :--------------------------- | :------------------------------------- | :-------------- |
| `-I.`                        | Add an include dir `.`                 | Passed to clang |
| `-DSYMBOL`                   | Define a SYMBOL                        | Passed to clang |
| `-Xiwyu --no_comments`       | Don't add notes to the output          | IWYU option     |
| `-Xiwyu --pch_in_code`       | The file has an important header first | IWYU option     |
| `-Xiwyu --mapping_file=FILE` | Use this lookup file                   | IWYU option     |

### Mapping File

It's hard for **iwyu** to work out which header files the developers think are
important.  For example, in NeoMutt, you can replace lots of library headers:

```c
#include "mutt/message.h"
#include "mutt/address.h"
#include "mutt/rfc2047.h"
#include "mutt/mapping.h"
#include "mutt/hash.h"
```

with one helper header

```c
#include "mutt/mutt.h"
```

The [mapping file](https://github.com/neomutt/management/blob/master/iwyu/neomutt.imp)
also provides fixes for some header files in glibc that cause confusion.
It looks like this:

```python
# Include one library header rather than the individual headers.
{ include: [ '@"mutt/.*"', private, '"mutt/mutt.h"', public ] },
{ include: [ '@"conn/.*"', private, '"conn/conn.h"', public ] },
```

