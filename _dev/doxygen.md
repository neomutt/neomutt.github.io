---
layout: concertina
title: Doxygen
description: Formatted Comment Blocks
---

# Doxygen Comments

[Doxygen](http://doxygen.org) reads specially formatted comment blocks and
turns them into documentation.

The Doxygen [documentation](http://www.stack.nl/~dimitri/doxygen/manual/commands.html)
lists all the possible commands.  Some common ones are:

- **@param**   -- a function parameter
- **@struct**  -- a C-struct.
- **@union**   -- a union.
- **@enum**    -- an enumeration type.
- **@var**     -- a variable or typedef or enum value.
- **@def**     -- a #define.
- **@typedef** -- a type definition.
- **@file**    -- a file.

## Functions

Here's a basic template for a function comment.  It begins with two asterisks.

```
/**
 * ONE LINE DESCRIPTION OF FUNCTION
 * @param NAME1 SHORT-DESC
 * @param NAME2 SHORT-DESC
 * ...
 *
 * LONG DESCRIPTION
 *
 * @return DESC-OF-RETURN-VALUE
 */
```

The `@param` can have an optional suffix indicating the direction:

- `[in]` -- a normal inbound parameter
- `[out]` -- an "out-param" (a value passed to the caller)

```
/**
 * Turn a number into text
 * @param[in]  num  Number to be converted
 * @param[out] ptr  Where to store the new string
 *
```

The return value `@return` could be descriptive, e.g. "Number of apples", or a
list of possible values.

Here, we have inserted and extra `*` to make the text into a list (in Markdown).

```
 *
 * @return
 * *    0:  Error
 * *    n:  Success
 */
```

Here's an example function comment block from `sidebar.c`:

```
/**
 * Draw a line between the sidebar and the rest of mutt
 * @param num_rows Height of the Sidebar
 * @param num_cols Width of the Sidebar
 *
 * Draw a divider using characters from the config option "sidebar_divider_char".
 * This can be an ASCII or Unicode character.  First we calculate this
 * character's width in screen columns, then subtract that from the config
 * option "sidebar_width".
 *
 * @return
 * *    -1: Error: bad character, etc
 * *    0:  Error: 0 width character
 * *    n:  Success: character occupies n screen columns
 */
static int draw_divider (int num_rows, int num_cols)
```

