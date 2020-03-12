---
layout: concertina
title: Translating Strings
description: How to Translate Strings
---

# {{ page.description }}

## How does it work?

The NeoMutt program is written in English, but it has been through a process of
Internationalization and Localization.

**Internationalization** (abbreviated to **i18n**):

- is changing the source code of a program to allow it to look up strings that
  need translation
- is done by programmers

**Localization** (abbreviated to **l10n**):

- is providing a list of translated strings for a language
- is done by translators
- does not require programming skills

The translation team is currently managed by
[Rich Russon (flatcap)](mailto:rich@flatcap.org).

It would be a great help to the project (and Rich) if someone volunteered to
help with this.

## State of the translations

NeoMutt builds upon Mutt, so it has inherited its translations. Mutt hasn't
changed much (in years), [so most of them are still correct](/translate.html).

Here are some recent statistics for the Swedish translation:

| Count  | Description                              |
| -----: | :--------------------------------------- |
|   1321 | Total number of strings to be translated |
|    998 | Already translated                       |
|    219 | Fuzzy -- need checking by a human        |
|    104 | To do -- need translating                |

The "fuzzy" translations appear when the `msgfmt` tool finds a translation that
it thinks is correct. These translations are often wrong.

## Is the job technical?

No, it's quite simple -- you just need to be multi-lingual.

The translations are stored in "Portable Object" text files (.po)

Here's a sample from the Japanese translation (ja.po)

```
#: main.c:905
msgid "Mailbox is empty."
msgstr "メールボックスが空。"
```

- A comment, starting with a `#`
- "msgid" -- the string in English
- "msgstr" -- the string in Japanese

There are plenty of tools to help you with the translation process. One of
them is "poedit" -- it's quite simple to use. This screenshot shows some
translated, some fuzzy and some untranslated strings.

[![poedit](/images/poedit-thumb.png)](/images/poedit.png 'click to enlarge')

**Notes**:

- **Comments**: "poedit" allows you to add comments to each translation. If you
  think that the comment should apply to **all** translations, then notify the
  NeoMutt project and they can add the comment to the source.
- **Context**: The strings are sometimes hard to translate because they have no
  context. If you have any questions, ask the translations manager (at the top
  of the page).

## More information

The translation mechanism uses GNU's "gettext". Here are some of the relevant
parts of their docs:

- [Internationalization and Localization](https://www.gnu.org/software/gettext/manual/gettext.html#Concepts)
- [Format of PO Files](https://www.gnu.org/software/gettext/manual/gettext.html#PO-Files)
- [printf(1) strings](https://www.gnu.org/software/gettext/manual/gettext.html#c_002dformat-Flag)

If you're technical you could look at the NeoMutt source code:

```
git clone -b translate https://github.com/neomutt/neomutt
```

## Sharing your work

NeoMutt has new releases about once a month. Before each release, the
translators will be emailed and asked for their latest `.po` file. This will
be merged into NeoMutt and an updated copy will be mailed back.

## Translate-fu

There's a pretty good editor for translation files: 'poedit', but some of us are only really happy at the command line.

Here are some hints to improve your translate-fu!

### msgattrib - Filter

This tool will extract a subset of translations, e.g. fuzzy or untranslated:

```sh
msgattrib --no-wrap --only-fuzzy   de.po > de-fuzzy.po
msgattrib --no-wrap --untranslated de.po > de-untrans.po
```

Now you can focus on just bits that need some work.

### msggrep - Search

This is a powerful search tool.  You can find regexes in the msgid, msgstr or comments.  Recently, I wanted to examine the overlap between the IDN messages, so I used:

```sh
msggrep --no-wrap --msgid -e IDN fr.po > fr-idn.po
```

### msgcat - Combine

Now that we've finished working, we want to re-combine the files.  We can use `msgcat` to merge them:

```sh
msgcat --no-wrap --use-first de-fuzzy.po de.po > de-new.po
```

**Note:** Some reordering might occur, so `--sort-by-file` might help.

### msgfmt - Stats

To check the validity of your translation files, and to get some stats, we can use `msgfmt`.  We don't the compiled message file though.

```sh
msgfmt --statistics -c -o /dev/null fr.po
1087 translated messages, 185 fuzzy translations, 74 untranslated messages.
```

### Viewing the Source

Ideally, the L10n comments should be enough to tell the translator everything they need to know.  Sometimes, though, looking at the source can make things much clearer much more quickly.

Each of the tranlations is preceded by a location line:

```sh
#: compose.c:118 compose.c:970 send.c:292
```

Vim's `gf` (goto file) command will open the file under the cursor, but to use these efficiently I recommend vim users install the 'vim-fetch' plugin: https://github.com/wsdjeg/vim-fetch

'vim-fetch' adds a `gF` command that uses the line numbers to place the cursor on the exact source line you want.  It also allows you to edit files from the command line:

```sh
vim compose.c:118
```

