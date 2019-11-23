---
layout: concertina
title: Vim Syntax
description: Update the Vim syntax highlighting
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

We distribute a [Vim syntax file](https://github.com/neomutt/neomutt.vim/blob/master/syntax/neomuttrc.vim) for highlighting NeoMutt config files.
This needs updating before each release.

**Repos needed**:
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/neomutt.vim](https://github.com/neomutt/neomutt.vim)
- [https://github.com/neomutt/vim](https://github.com/neomutt/vim)

## neomuttrc.vim

The Vim file is broken down into various sections.
Each section has a comment telling you where to find the information that you need.
Once you've checked a section, update the "CHECKED" date comment.

- Format strings, e.g. `$index_format`
- List of the different screens in neomutt
- List of hooks
- List of colour fields
- List of compose fields
- List of boolean config variables
- List of deprecated boolean config variables
- List of quad-type config variables
- List of deprecated quad-type config variables
- List of number config variables
- List of string config variables
- List of address config variables
- List of header-cache config variables
- List of magic config variables
- List of multi-byte table config variables
- List of path config variables
- List of regex config variables
- List of commands
- List of functions

Now check that the syntax file works and doesn't cause errors.

## Upstream

After the release has been made, the Vim file should be offered to upstream Vim.

Create a branch in our [mirror of the Vim repo](https://github.com/neomutt/vim), then create a Pull-Request.

