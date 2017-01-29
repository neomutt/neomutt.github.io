---
layout: concertina
title: Coding Style
description: The preferred style for code committed to NeoMutt
---

# Coding Style

## at the moment (pre-fork)

Generally speaking, we don't want to diverge much from upstream mutt. We're
still merging patches in - and if we didn't follow upstream's coding style,
merging would be much harder.

That means:

* put your the braces of functions in new lines, like so:

```c
struct q_class_t
{
  int length;
  int index;
  int color;
  char *prefix;
  struct q_class_t *next, *prev;
  struct q_class_t *down, *up;
};
```

* define functions with underscores like `void mutt_account_unsetpass (..)`

* what a function does *should* be clear without the need to look into ites
  implementation - that means use expressive names!

* No global variable is a good variable - therefore avoid them.

* Explain with comments what a function does. That includes:

    - the return value and their meaning

    - parameters and their meaning


* Use only `/* Comment */` style comments. Don't use single line comments (`//
  Comment`)

* use a two spaces based indentation

* Wrap your code and comments at 80 Columns.

* Remove the braces of control statements (`if`, `switch` and such) which are
  only one line big.

```c
  if (a1->flags & MUTT_ACCT_USER)
    return (!strcmp (a1->user, user));
  if (a2->flags & MUTT_ACCT_USER)
    return (!strcmp (a2->user, user));
```

* Remove trailing whitespace

* Align operators like so:

```c
#define hexdigitp(a) (digitp (a) \
                      || (*(a) >= 'A' && *(a) <= 'F')  \
                      || (*(a) >= 'a' && *(a) <= 'f'))
```
