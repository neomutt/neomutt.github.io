---
title: Eliminating Config Globals
description: Steps leading to Account- and Mailbox-specific Config
author: flatcap
---

# {{ page.title }}

NeoMutt still has a lot of global variables.

Most of the Config Variables are backed by globals.
This is why when you switch Accounts you need to use `account-` and `folder-hook`s to set variables.

## Config System

The Config System support inheritance which will allow us to create Account- and Mailbox-specific config.
To use this facility means eliminating all of the `C_*` global variables.


This leads to my favourite diagram (and possibly the most complicated).
Understanding this will lead to Enlightenment :-)

(Click for more details)

<a href="https://github.com/neomutt/gfx/blob/master/arch/README.md#config-and-inheritance"><img width="200" src="https://github.com/neomutt/gfx/raw/master/arch/config-arch.svg"></a>

## Config Subset

The Config System can be accessed using a handle: `struct ConfigSubset *sub`
Initially, this will be the **global scope**, `NeoMutt->sub`.
Over time, this will be changed to `Account->sub` when Account-specific config is introduced, then eventually `Mailbox->sub`.

For dialogs, the `ConfigSubset` should be passed in as a parameter.

## Conversion

To upgrade the code, replace each `C_*` global variable with a Config System lookup.
There's a helper function for each config type.
These are strictly type-checked and will `assert()` on failure.

Here's an example of each function.

```c
const struct Address  *c_envelope_from_address = cs_subset_address(sub, "envelope_from_address");
const bool             c_fast_reply            = cs_subset_bool   (sub, "fast_reply");
const long             c_imap_fetch_chunk_size = cs_subset_long   (sub, "imap_fetch_chunk_size");
const short            c_connect_timeout       = cs_subset_number (sub, "connect_timeout");
const char const      *c_debug_file            = cs_subset_path   (sub, "debug_file");
const enum QuadOption  c_fcc_attach            = cs_subset_quad   (sub, "fcc_attach");
const struct Regex    *c_gecos_mask            = cs_subset_regex  (sub, "gecos_mask");
const struct Slist    *c_hidden_tags           = cs_subset_slist  (sub, "hidden_tags");
const short            c_pgp_sort_keys         = cs_subset_sort   (sub, "pgp_sort_keys");
const char const      *c_pattern_format        = cs_subset_string (sub, "pattern_format");
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
