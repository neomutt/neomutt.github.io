---
layout: concertina
title: Coding Style
description: The preferred style for code committed to NeoMutt
status: notes
author: flatcap
---

## Overview

@toogley
> new coding style must **really** be an improvement

Yes, that's the goal, but we should be prepared for a journey of several stages.

Tidying the code will make it more consistent and easier to read.
But that's just one step.  After that will come much more refactoring to undo
the years of neglect that the code has suffered.

> clang-format produces, the following: [ugly code]

This will always be a problem.  Whatever style we pick, there will always be
some places where we want to bend the rules.  The solution will depend on the
number of exceptions.

If there are **few exceptions** then we can surround the blocks with
`// clang-format off` type comments.  This would mean that we could run
`clang-format` automatically before each commit.

If there are **many exceptions**, then the code will become a mess of clang
comments (or we cannot run automatic tidying).

> we have to make sure that our new clang-format option set really works in all
> cases of the mutt source code.

I think that the best we can do is:

- Pick some options that approximate Mutt's style
- Run clang-format on the source tree
- Cherry-pick old code where it looks better

## Upstream

Upstream's preferences are:

- No tabs
- 2 space indent
- `{}`s on new lines

The plan is to reformat NeoMutt's code base in such a way that we can still
integrate upstream Mutt's patches.  This limits how much we can change.

Additionally, there are three other style choices where the NeoMutt developers
have expressed a preference.

- No space between the function name and the opening bracket, e.g.
  `x = function(y);`

- Function return type on the same line, e.g.
  `int function(int y)`

- Line length should have a soft limit of 80 characters.
  This can be achieved by using clang-format's style penalties:

```conf
# Allow about 5 characters over the column limit, before forcing a line-break
PenaltyExcessCharacter 1
```

Example: [**.clang-format**](/dev/clang-format)

## Braces

I'm reluctant to make a strict ruling, here, as long as one guideline is followed:
- The meaning of the code must be **immediately** clear.

Let's start with a simple case, one that I think everyone will accept.
Both the condition and the action are short and the entire 'if' is easy to parse.

```c
if (condition)
  action();
```

Also, this case is simple to read:

```c
for (int i = 0; i < 10; i++)
  if (condition)
    action();
```

At the other extreme, this is from `find_subject()` in [thread.c](https://github.com/neomutt/neomutt/blob/neomutt/thread.c#L415)
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

This example is simpler, but could still probably do with `{}`s.
It is from `mutt_check_traditional_pgp()` in [commands.c](https://github.com/neomutt/neomutt/blob/neomutt/commands.c#L1062)

```c
if (Context->hdrs[Context->v2r[i]]->tagged &&
   !(Context->hdrs[Context->v2r[i]]->security & PGP_TRADITIONAL_CHECKED))
 rv = _mutt_check_traditional_pgp (Context->hdrs[Context->v2r[i]], redraw)
   || rv;
```

Finally, there's ugliness like this in `crypt_init()` in [cryptglue.c](https://github.com/neomutt/neomutt/blob/neomutt/cryptglue.c#L59):

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

**I propose as guidelines**:
- Refactor 'if' conditions that span more than 4 lines
- Enforced `{}`s for actions that span more than 1 line, or that contain comments
- Preprocessor conditions should not be embedded within an 'if' condition

## Whitespace

All these cases are handled by clang-format:
- No trailing whitespace
- No tabs
- No spaces inside () or []
- Space around operators:
  - Maths `+-*/`
  - Logic `&&`, `||`
  - Comparisons `>=`, `==`
  - etc
- No space between a function name and '('

## Neomutt Additions

`clang-format` can enforce a lot of style onto the code, but I'd like to suggest
a few more things.  If an idea is liked, it may get added to our style guide.

### Distinguish between `0` and `NULL`

Pointers should be assigned to `NULL`, not `0`.  This helps to reinforce the
type, especially when you're deep with a function.

```c
FILE *fp = fopen(filename, "r");
/* lots of code ... */
fclose(fp);
fp = NULL;
```

`strcmp()` returns `0` when the strings match, but the code below is misleading.
You might be mistaken and think that `something()` is called if the strings
match.
```c
if (strcmp(apple, banana))
  something();
else
  other();
```

By reminding the user of the return type, the meaning is clearer:

```c
if (strcmp(apple, banana) == 0)
  something();
else
  other();
```

### Use `!` to test booleans and pointers only

There are many parts of Mutt's code that use `!` to test if a variable is equal
to zero.  Using `!` consistently will help to reinforce the types to a human.

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
Here, we're `&&`-ing three logical tokens.
Because they contain whitespace, the 'if' can be a little hard to read.

This is easier to read:
```c
if ((a == x) && (b == y) && (c == z))
```

Tokens that don't have any whitespace don't need to be `()`d, e.g.

```c
if (x && y && !z)
```

### Ternary operator `x ? y : z` - one at a time

The ternary operator is good for short and simple if-then-else type things, e.g.
```c
x = (y > 0) ? 1 : 0;
```

However, when several ternary operators are used in one statement, it becomes
very hard to understand the meaning.  This example is from `mbrtowc_iconv()` in
[mbyte.c](https://github.com/neomutt/neomutt/blob/neomutt/mbyte.c#L155)
```c
return (pwc && *pwc) ? (ib - (k ? bufi + k : s)) : 0;
```

### Doxygen Comment Blocks

New, non-static (shared), functions should have a [doxygen comment block](/dev/doxygen).
These comment blocks should tell a developer everything they need to know in
order to use, or debug, that function.

These comment blocks are parsed by doxygen and turned into cross-referenced
documentation.

### Inserting Whitespace for Clarity

Sometimes, inserting a little whitespace can greatly improve the legibility.

```c
if ((ascii_strncasecmp ("supersedes:", uh->data, 11) != 0) &&
    (ascii_strncasecmp ("subject:", uh->data, 8) != 0) &&
    (ascii_strncasecmp ("return-path:", uh->data, 12) != 0))

if ((ascii_strncasecmp ("supersedes:",  uh->data, 11) != 0) &&
    (ascii_strncasecmp ("subject:",     uh->data,  8) != 0) &&
    (ascii_strncasecmp ("return-path:", uh->data, 12) != 0))
```

### C99 Features

These C99 features may be used in new code added by NeoMutt:

- `// line comments`
- Scoped variables: `for (int i = 0; ...`
- Booleans: `#include <stdbool.h>`

## Wrap Up

Any code that **needs** to stay as it was written should be surrounded by the
comments:
```c
// clang-format off
// clang-format on
```

These should be used as little as possible.

An alternative, for some situations is to use a strategically-placed comment:
```c
#define hexdigitp(a) (digitp (a)      // significant comment  \
   || (*(a) >= 'A' && *(a) <= 'F')                            \
   || (*(a) >= 'a' && *(a) <= 'f'))
```

Many people have shown a preference for the `{}`s to be nestled.  Unfortunately,
this means there are changes to the 'if' line, which make a nightmare out of
importing upstream changes.
```c
if (test) {
} else {
}
```

@nobrowser
> If someone creates an issue for cleaning the header files, I'll take it.

Noted, thanks.

> We need a policy decision though

Nearly there...

> A proper fix will probably lead to huge merge conflicts.

Fortunately, the header files seldom change.
I will happily exchange a small amount of merge pain, for tidier headers.

@guyzmo
> Subtle, unimportant, changes to whitespace will lead to HUGE diffs

Yes, but if we're going to reformat the source, we might as well do it
thoroughly.

---

Very soon, we will have a style guide for our code.
There will be a `.clang-format` config file and plenty of code examples.

Thank you for your thoughtful debate.

