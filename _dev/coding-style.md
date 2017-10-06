---
layout: concertina
title: Coding Style
description: The preferred style for code committed to NeoMutt
status: wip
author: flatcap
---

# {{ page.title }}

## Overview

Whatever the language, coding style is always controversial.

This page outlines a small [set of rules][r], some [guidelines][g] and some
[top tips][t]. It's hoped that following these examples, we can keep NeoMutt's
code tidy.

NeoMutt also recommends using [editor-config][e] and [clang-format][c].

[r]: #rules
[g]: #guidelines
[t]: #top-tips
[e]: #editor-config
[c]: #clang-format

## Rules <a class="offset" id="rules"></a>

These rules are important. Please follow them to ensure your code is accepted.

### Indent

- Code should be indented using **2 spaces**.

```c
if (x == 0)
  return;
```

### Braces

- Braces must begin and end on new lines

```c
if (x == 0)
{
  red();
  blue();
}
```

### No tabs

- However deeply nested the code, it should not use tabs for indentation

### Trailing whitespace

- Delete spaces or tabs at the ends of lines

### New options

- when new options are added, the old behavior should be the default.

### Avoid global variables!

- We consider the use of global variables to be bad style, because it makes
  changes/refactorings much harder to realize. NeoMutt still has a lot of
  them. So if you want to reduce them, you're very welcome to do so. Ask on the
  devel mailinglist or on IRC, if you are interested.

### Special characters should be UTF-8

- special characters should be in UTF-8. If you find remnants from the times
  when this was an ISO-8859-1 source code tree, please feel free to fix them.

### Global and non-global functions

- global functions should have the prefix "mutt\_". All other functions should
  be declared "static".

## Guidelines <a class="offset" id="guidelines"></a>

These guidelines are NeoMutt's preferred way to style code. Some exceptions
will be allowed.

### General

- Function return type on the same line, e.g. `int function(int y)`
- Line length should be limited to 80-90 characters.

### Braces placement

There are many situations where C doesn't require braces. Often, this can lead
to code that's hard to read.

**General guideline**:

- The meaning of the code must be **immediately** clear.

First, here are a couple of good examples where braces aren't needed, but the
code is still clear.

Both the condition and the action are short and the entire 'if' is easy to
read.

```c
if (condition)
  action();
```

This case, with two levels of nesting is also simple to read.

```c
for (int i = 0; i < 10; i++)
  if (condition)
    action();
```

Next are three bad examples.

Here is some code from `find_subject()` in
[thread.c](https://github.com/neomutt/neomutt/blob/9f5acdc2/thread.c#L415)
It's hard to tell where the 'if' ends and the action begins.

```c
if (tmp != cur &&                    /* don't match the same message */
    !tmp->fake_thread &&             /* don't match pseudo threads */
    tmp->message->subject_changed && /* only match interesting replies */
    !is_descendant (tmp, cur) &&     /* don't match in the same thread */
    (date >= (option (OPTTHREADRECEIVED) ?
              tmp->message->received :
              tmp->message->date_sent)) &&
    (!last ||
     (option (OPTTHREADRECEIVED) ?
      (last->message->received < tmp->message->received) :
      (last->message->date_sent < tmp->message->date_sent))) &&
    tmp->message->env->real_subj &&
    mutt_strcmp (subjects->data, tmp->message->env->real_subj) == 0)
  last = tmp; /* best match so far */
```

This example is simpler, but could still probably do with `{}`s. It is from
`mutt_check_traditional_pgp()` in
[commands.c](https://github.com/neomutt/neomutt/blob/6b1ecf78dde6a629b97ddaeeddf94d58e6aa60e9/commands.c#L1062)

```c
if (Context->hdrs[Context->v2r[i]]->tagged &&
   !(Context->hdrs[Context->v2r[i]]->security & PGP_TRADITIONAL_CHECKED))
 rv = _mutt_check_traditional_pgp (Context->hdrs[Context->v2r[i]], redraw)
   || rv;
```

Finally, there's ugliness like this in `crypt_init()` in
[cryptglue.c](https://github.com/neomutt/neomutt/blob/3a415b2b1d5719d729aa60bb6491c496dd2f98f8/cryptglue.c#L59):

```c
  if (
#ifdef CRYPT_BACKEND_GPGME
      (! option (OPTCRYPTUSEGPGME))
#else
       1
#endif
      )
```

The factors that complicate an 'if' statement are:

- **Condition** spans multiple lines
- **Condition** is inconsistently indented
- **Action** spans multiple lines
- **Condition** and **Action** are separated by a comment
- **Condition** contains preprocessor statements

**Specific guidelines**:

- Refactor 'if' conditions that span more than 4 lines
- Enforced `{}`s for actions that span more than 1 line, or that contain
  comments
- Preprocessor conditions should not be embedded within an 'if' condition

### Whitespace

**Guidelines**:

- No spaces inside () or []
- Space around operators:
  - Maths `+-*/`
  - Logic `&&`, `||`
  - Comparisons `>=`, `==`
- No space between a function name and '('

**Note**: All these cases are handled by clang-format.

## Top tips <a class="offset" id="top-tips"></a>

These tips are generally good ideas. Their use is encouraged.

### Distinguish between `0` and `NULL`

Pointers should be assigned to `NULL`, not `0`. This helps to reinforce the
type, especially when you're deep with a function.

```c
FILE *fp = fopen(filename, "r");
/* lots of code ... */
fclose(fp);
fp = NULL;
```

`strcmp()` returns `0` when the strings match, but the code below is
misleading. You might be mistaken and think that `something()` is called if
the strings match.

```c
/* Misleading condition */
if (strcmp(apple, banana))
  something();
else
  other();
```

By reminding the user of the return type, the meaning is clearer:

```c
/* Clearer condition */
if (strcmp(apple, banana) == 0)
  something();
else
  other();
```

### Use `!` to test booleans and pointers only

There are many parts of Mutt's code that use `!` to test if a variable is equal
to zero. Using `!` consistently will help to reinforce the types to a human.

```c
int x = 0;
if (x == 0)

bool b = false;
if (!b)

char *str = NULL;
if (!str)
```

### Put `()`s around logic that contains whitespace

C allows you to write statements like:

```c
if (a == x && b == y && c == z)
```
Here, we're `&&`-ing three logical tokens. Because they contain whitespace,
the 'if' can be a little hard to read.

This is easier to read:

```c
if ((a == x) && (b == y) && (c == z))
```

Tokens that don't have any whitespace don't need to be `()`d, e.g.

```c
if (x && y && !z)
```

### Ternary operator `x ? y : z` -- one at a time

The ternary operator is good for short and simple if-then-else type things,
e.g.

```c
/* Clear use of a ternary operator */
x = (y > 0) ? 1 : 0;
```

However, when several ternary operators are used in one statement, it becomes
very hard to understand the meaning. This example is from `mbrtowc_iconv()` in
[mbyte.c](https://github.com/neomutt/neomutt/blob/2f4417e898ac719dee6b0ccb53668533410869e1/mbyte.c#L155)

```c
/* Multiple operators make the code hard to read */
return (pwc && *pwc) ? (ib - (k ? bufi + k : s)) : 0;
```

### Doxygen comment blocks

New, non-static (shared), functions should have a
[doxygen comment block](/dev/doxygen). These comment blocks should tell
a developer everything they need to know in order to use, or debug, that
function.

These comment blocks are parsed by doxygen and turned into cross-referenced
documentation.

### Inserting whitespace for clarity

Sometimes, inserting a little whitespace can greatly improve the legibility.

```c
if ((strcmp("supersedes:", uh->data, 11) != 0) &&
    (strcmp("subject:", uh->data, 8) != 0) &&
    (strcmp("return-path:", uh->data, 12) != 0))

if ((strcmp("supersedes:",  uh->data, 11) != 0) &&
    (strcmp("subject:",     uh->data,  8) != 0) &&
    (strcmp("return-path:", uh->data, 12) != 0))
```

### C99 features

These C99 features may be used:

- `// line comments`
- Scoped variables: `for (int i = 0; ...`
- Booleans: `#include <stdbool.h>`

### Misc

- Return from function early, if possible
- Initialise pointers to null
- Limit variables to the smallest possible scope
- For sets of constants, use `enum` rather than `#define`

## EditorConfig <a class="offset" id="editor-config"></a>

[EditorConfig][ec] provides plugins for most common editors which allow
projects to define their style in one place.

Here's NeoMutt's [.editorconfig][ecf] file.

It looks like this:

```conf
[*.{c,h}]
indent_size = 2
indent_style = space
```

[ec]:  <http://editorconfig.org/>
[ecf]: <https://github.com/neomutt/neomutt/blob/master/.editorconfig>

## Clang-Format <a class="offset" id="clang-format"></a>

Clang-format is a tool which automatically reformats C sources files according
to configurable style guides.

This tool can re-indent code, correct the placement of `{}`s and much much
more. Beginners are strongly recommended to use this tool on their code before
submitting it to NeoMutt.

Here is NeoMutt's [.clang-format][ncf] file. Clang's site has
[full documentation][cfd] of the format.

Any code that **needs** to stay as it was written should be surrounded by the
comments:

```c
// clang-format off
// clang-format on
```

These should be used as little as possible.

[ncf]: <https://github.com/neomutt/neomutt/blob/master/.clang-format>
[cfd]: <https://clang.llvm.org/docs/ClangFormatStyleOptions.html>

