---
layout: concertina
title: Coccinelle
description: Source code manipulation
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [http://coccinelle.lip6.fr/](http://coccinelle.lip6.fr/)

Coccinelle is a tool for manipulating C source code.  Because it really
understands C, you can make complex changes, e.g.  If `x` is an integer,
replace `if (!x)` with `if (x == 0)`

This means that you could define some code style rules and automatically check
that they're being used.

Coccinelle uses a transformation language that it applies to C source.
The output is a diff that can be applied.

```c
/* Source file to be checked */
int main()
{
  char *x = NULL;

  if (x == NULL)
    something();
}
```

```diff
// Find pointers that are checked against NULL
@@
type T;
identifier I;
statement S1;
@@

T *I;

(
- if (I == NULL)
+ if (!I)
S1
)
```

```sh
# Generate the diff
spatch --sp-file null-check.cocci source.c
```

```diff
--- source.c
+++ source.c
@@ -4,6 +4,6 @@ int main()
 {
   char *x = NULL;
 
-  if (x == NULL)
+  if (!x)
     something();
 }
```

Here are more examples that have been used on NeoMutt:

- [https://github.com/neomutt/coccinelle](https://github.com/neomutt/coccinelle)

- **See also**: [clang-format](clang-format)

