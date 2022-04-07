---
title: Config System
description: How Config Variables are handled
author: flatcap
---

# {{ page.title }}

**tl;dr** This diagram is all you need to know :wink:

<table class="clean">
  <tr>
    <td valign="top"><img width="500" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/config-arch.svg"></td>
    <td valign="top"><b>Key</b><br><img width="250" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/config-arch-key.svg"></td>
  </tr>
</table>

## ConfigSet

Configuration begins with the ConfigSet.
It contains:
- Hash Table to store the Configs
- Set of registered Types
- Set of Observers

First we create a ConfigSet and register some Types.
Each Type is responsible for one data type.
Each Type has:

| name            | Human-readable name                                   |
| setter/getter   | Set/get the variable as a string                      |
| nsetter/ngetter | Setter/getter as a native type, e.g. `struct Address` |
| resetter        | Reset variable to factory settings                    |
| destructor      | Release the resources                                 |

Each Config Type implements the [`struct ConfigSetType` interface](https://neomutt.org/code/structConfigSetType.html)

```c
int      string_set         (const struct ConfigSet *cs, void *var,       struct ConfigDef *cdef, const char *value, struct Buffer *err);
int      string_get         (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef,                    struct Buffer *result);
int      native_set         (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef, intptr_t value,    struct Buffer *err);
intptr_t native_get         (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef,                    struct Buffer *err);
int      string_plus_equals (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef, const char *value, struct Buffer *err);
int      string_minus_equals(const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef, const char *value, struct Buffer *err);
int      reset              (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef,                    struct Buffer *err);
void     destroy            (const struct ConfigSet *cs, void *var, const struct ConfigDef *cdef);
```

Note that the word "string" in these functions doesn't refer to a String Config Type,
but rather a user-entered string that will be converted to the Config Type.

### Config Types

NeoMutt's Types are:

| Name    | Description                | Source           | C Type           |
| :------ | :------------------------- | :--------------- | :--------------- |
| Address | Email address              | config/address.c | `struct Address` |
| Bool    | Boolean                    | config/bool.c    | `bool`           |
| Enum    | Enumeration                | config/enum.c    | `unsigned char`  |
| Long    | Long                       | config/long.c    | `long`           |
| Mbtable | Multi-byte character table | config/mbtable.c | `struct MbTable` |
| Number  | Number                     | config/number.c  | `short`          |
| Path    | Path                       | config/path.c    | `char *`         |
| Quad    | Quad-option                | config/quad.c    | `unsigned char`  |
| Regex   | Regular expression         | config/regex.c   | `struct Regex`   |
| Slist   | List of strings            | config/slist.c   | `struct Slist`   |
| Sort    | Sorting                    | config/sort.c    | `short`          |
| String  | String                     | config/string.c  | `char *`         |

### Registering Config Names

Each Config Name is represented by a ConfigDef.  This links the user-facing
Name of the Item to a registered Type and a global Variable.

Here are some examples:

```c
// Name            Type|Flags                 Variable         Initial,   Data,        Validator
{ "timeout",       DT_NUMBER|DT_NOT_NEGATIVE, &C_Timeout,      600,       0,           NULL,
{ "move",          DT_QUAD,                   &C_Move,         MUTT_NO,   0,           NULL,
{ "print_command", DT_STRING|DT_COMMAND,      &C_PrintCommand, "lpr",     0,           NULL,
{ "sort",          DT_SORT|DT_SORT_REVERSE,   &C_Sort,         SORT_DATE, SortMethods, pager_validator,
```

### Notifications

The Config Set implements a notification system using `struct Notify`.  This
means that other code can register Observers of the Config and be notified when
anything changes.

## Walkthrough of a Config Item

### Part 1 - Number

This takes a fictional Config item "$foo_percentage"

NeoMutt defines the Number Type: DT_NUMBER which is backed by a short int.

The 'foo' module registers its variable:

```c
// Name             Type|Flags Variable   Initial, Data, Validator,         Docs
{ "foo_percentage", DT_NUMBER, &C_FooPct, 42,      0,    foo_pct_validator, "Amount of foo" },
```

NeoMutt will set the `C_FooPct` Variable (explanation below).
Note: The initial value is Type-specific.

and an observer:

```c
bool foo_config_event(ConfigSet *cs, HashElem *he, char *name, ConfigEvent ev);
```

Now we read the config file:

```
set foo_percentage = 96   # Dangerously high
```

- `mutt_parse_rc_line()` reads the config file
- `mutt_parse_rc_buffer()` identifies the 'set' command
- `parse_set()` splits the line into
    - 'foo_percentage' variable
    - the assignment '='
    - the value string '96'
- Lookup 'foo_percentage' in the ConfigSet HashTable
    - It has type `DT_NUMBER`
- Lookup `DT_NUMBER` in the Type definitions
- Delegate parsing to the "Number" Type

The "Number" Type has a 'setter' function to convert a string to data.
If any of the steps fail, the user will be notified and the Variable won't be
changed.

- Convert the string to an integer
- Check the range of the integer (we store our value in a short)
    - Is it less than `SHRT_MIN`?
    - Is it greater than `SHRT_MAX`?

**Validator**:

This variable has a validator function, which is now called.
In this case, it checks that the value is in the range 0-100.
If it's not, it returns false and an error message.

If the validator succeeds, then the Variable is set to the new value.
Finally, the ConfigSet sends out a notification to all the Observers.

- `foo_config_event()` is called

### Part 2 - Address

This takes a fictional Config item "$home_address"

NeoMutt defines the Address Type: `DT_ADDRESS` which is backed by a `struct Address` pointer.

The 'foo' module registers its variable:

```c
// Name           Type|Flags  Variable     Initial,           Data, Validator, Docs
{ "home_address", DT_ADDRESS, &C_HomeAddr, "jim@example.com", NULL, NULL,      "Home address" },
```

NeoMutt will set the `C_HomeAddr` Variable.

- 'home_address' has type `DT_ADDRESS`
- Lookup 'DT_ADDRESS' in the Type definitions
- Delegate parsing to the "Address" Type

Address Type:

- Allocate a new struct Address
- Parse the string into:
    - Real name
    - Email address

On success:
- Free the old value of `C_HomeAddr`
- Store the new value into `C_HomeAddr`
- Notify the Observers

On failure:
- Free the temporary Address
- Notify the user

This variable doesn't have a validator function.

### Part 2b - NULL

Some Types will allow an empty value to be set.
By default, NeoMutt stores empty strings as NULL.

Setting an Address Type to an empty string will release the old address and
set `C_HomeAddr` to NULL.

## Config Scope

### Global Config

There are ~450 Config Names in NeoMutt.  Half of these are defined in
[`mutt_config.c`](https://github.com/neomutt/neomutt/blob/master/mutt_config.c#L192).

Each Config Item is backed by a global Variable, many of which live in
[`mutt_globals.h`](https://github.com/neomutt/neomutt/blob/master/mutt_globals.h#L98)

### Library Config

The rest of the Config Items have been moved into libraries.

This allows the libraries to reduce the scope of their Config Variables.

For example, the Sidebar
[registers](https://github.com/neomutt/neomutt/blob/master/sidebar/config.c#L124) its
[Config Items](https://github.com/neomutt/neomutt/blob/master/sidebar/config.c#L71)
in `sidebar/config.c`

```c
// Name                    Type|Flags Variable                Initial, Data, Validator,
{ "sidebar_delim_chars",   DT_STRING, &C_SidebarDelimChars,   "/.",    0,    NULL,
{ "sidebar_divider_char",  DT_STRING, &C_SidebarDividerChar,  0,       0,    NULL,
{ "sidebar_folder_indent", DT_BOOL,   &C_SidebarFolderIndent, false,   0,    NULL,
```

## Config Elimination

NeoMutt still has a lot of global variables.

Most of the Config Variables are backed by globals.
This is why when you switch Accounts you need to use `account-` and `folder-hook`s to set variables.

### Config System

The Config System support inheritance which will allow us to create Account- and Mailbox-specific config.
To use this facility means eliminating all of the `C_*` global variables.

This leads to my favourite diagram at the top of this page.
Understanding this will lead to Enlightenment :-)

### Config Subset

The Config System can be accessed using a handle: `struct ConfigSubset *sub`
Initially, this will be the **global scope**, `NeoMutt->sub`.
Over time, this will be changed to `Account->sub` when Account-specific config is introduced, then eventually `Mailbox->sub`.

For dialogs, the `ConfigSubset` should be passed in as a parameter.

### Conversion

To upgrade the code, replace each `C_*` global variable with a Config System lookup.
There's a helper function for each config type.
These are strictly type-checked and will `assert()` on failure.

Here's an example of each function.

```c
const struct Address  *c_envelope_from_address = cs_subset_address(sub, "envelope_from_address");
const bool             c_fast_reply            = cs_subset_bool   (sub, "fast_reply");
const long             c_imap_fetch_chunk_size = cs_subset_long   (sub, "imap_fetch_chunk_size");
const short            c_connect_timeout       = cs_subset_number (sub, "connect_timeout");
const char            *c_debug_file            = cs_subset_path   (sub, "debug_file");
const enum QuadOption  c_fcc_attach            = cs_subset_quad   (sub, "fcc_attach");
const struct Regex    *c_gecos_mask            = cs_subset_regex  (sub, "gecos_mask");
const struct Slist    *c_hidden_tags           = cs_subset_slist  (sub, "hidden_tags");
const short            c_pgp_sort_keys         = cs_subset_sort   (sub, "pgp_sort_keys");
const char            *c_pattern_format        = cs_subset_string (sub, "pattern_format");
```

Each variable is named to match the Config Variable and is **const** to discourage the coder from changing it (which would have no effect on the actual config).

## Elimination

Once all the `C_*` variable uses have been eliminated from a library, the Config
Definitions can be updated.

- Delete the `C_*` config definitions
- Delete the `C_*` config prototypes
- Replace `C_*` with `NULL` in the Config Definition
- Flag the Config with `DT_NO_VARIABLE` in the call to `cs_register_variables()`

For example commits, see:

- [4e434fe556 send: get Config from a ConfigSubset](https://github.com/neomutt/neomutt/commit/4e434fe5564430ad23d00eb7886f8b5283eefd4c)
- [47a7ab79af send: no variable](https://github.com/neomutt/neomutt/commit/47a7ab79af5b3e2755c0e75dda168664bf835135)
