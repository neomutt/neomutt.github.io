---
title: Translations
description: Updating the translations
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

## String Freeze

Before making a release, it's customary to call a "string freeze" (usually at least a week before).
After this, there must be no changes to translatable strings in the code.
(the strings look like `_("text")` or `_N("text")`)

This gives the translators time to catch up with the code changes.

Make the announcement to the Translation Team:
- [https://github.com/orgs/neomutt/teams/translators](https://github.com/orgs/neomutt/teams/translators)

## Update the Translations

**This must be done twice**: just before the String Freeze; just before the Release.

**Repos needed**:
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/management](https://github.com/neomutt/management)

**Tasks**:
- stats (before)
- git rebase
- po/POTFILES.in
- update-po
- stats (after)
- git merge
- re-create [translate]

### Stats (before)

Run this script before and after the updates as a quick check to see that
everything went well.

```
../management/translate/stats.sh
```

You'll see something like:

```
en_GB:	1404 translated
pt_BR:	1359 translated, 13 fuzzy, 32 untranslated
lt:	1359 translated, 13 fuzzy, 32 untranslated
zh_CN:	1351 translated, 21 fuzzy, 32 untranslated
de:	1335 translated, 33 fuzzy, 36 untranslated
...
```

### Git Rebase

Rebase the existing `translate` branch onto `main`.

```
git rebase --interactive main
```

### po/POTFILES.in

This file contains a list of all the source files that contain translatable strings.
For simplicity, it's a list of all the main source (excluding 3rd-party and auto-generated code).

Check that it's up-to-date.  This command may help:

```
(echo ./opcodes.h; find . -type f -name '*.c') | \
    grep -v -e "test/" -e jimsh0 -e makedoc -e conststrings -e git_ver | \
    sed 's/^..//' | \
    LANG=C sort -f \
    > po/POTFILES.in
```

### update-po

This `Makefile` target reads all the source files looking for translatable strings.
It will update the 'po' files with any new/deleted strings and update the source file locations in the `#:` comments.

```sh
./configure
make update-po
```

Next, clean out any dead translations (`#~`).

```sh
for i in po/*.po; do
  msgattrib --no-wrap --no-obsolete "$i" | sponge "$i"
done
```

(`sponge` can be found in the `moreutils` package)

Finally, edit `po/en_GB.po` to bring it up to 100%.
Fill in any missing translations, or fuzzy strings.

:spiral_notepad: **Note**: When making a release, edit all the 'po' files to update the 'Project-Id-Version:' header to the new version string.

:heart: **Creating a script** to do this, or better still improving the `Makefile` would be helpful.

### Stats (after)

```
../management/translate/stats.sh
```

Check the results against the earlier output.
Most languages will have changed by a few numbers, as translatable strings change, or as translators do their work.

### git merge

The update work is done.  Now it's time to commit the changes.

```sh
git commit --all --message "sync translations"
git checkout main
git merge --no-ff translate --message "update translations"
```

`main` may now be pushed to GitHub.

### Re-create [translate]

Finally, we need to create a fresh `[translate]` branch for new work to begin.

```sh
git branch --delete --force translate
../management/travis/translate-install.sh
git push --force --set-upstream origin translate
```

## Checks

Check Travis was successful:
- [https://github.com/neomutt/neomutt/branches](https://github.com/neomutt/neomutt/branches)
- [https://travis-ci.org/neomutt/neomutt/branches](https://travis-ci.org/neomutt/neomutt/branches)

Check web push was successful:
- Timestamp at bottom of [https://neomutt.org/translate](https://neomutt.org/translate)

Make the announcement to the Translation Team:
- [https://github.com/orgs/neomutt/teams/translators](https://github.com/orgs/neomutt/teams/translators)

## Credits

The 'Translation' section for the Release Notes is presented as a league table.
List all the languages that have been updated since the previous release.

- 100% Lithuanian
-  95% German
-  95% Finnish
-  91% Polish
-  73% Dutch

For GitHub and the Website, this list can be made prettier with national flags.
They both support `:denmark:` style emojis.

:spiral_notepad: **Note**: These languages don't have emojos: Basque, Catalan, Esperanto, Galician

| Flag             | Language              | Emoji              | Code  |
|------------------|-----------------------|--------------------|-------|
| -                | Basque                | -                  | eu    |
| :bulgaria:       | Bulgarian             | `:bulgaria:`       | bg    |
| -                | Catalan               | -                  | ca    |
| :cn:             | Chinese (Simplified)  | `:cn:`             | zh_CN |
| :taiwan:         | Chinese (Traditional) | `:taiwan:`         | zh_TW |
| :czech_republic: | Czech                 | `:czech_republic:` | cs    |
| :denmark:        | Danish                | `:denmark:`        | da    |
| :netherlands:    | Dutch                 | `:netherlands:`    | nl    |
| :uk:             | English (British)     | `:uk:`             | en_GB |
| -                | Esperanto             | -                  | eo    |
| :estonia:        | Estonian              | `:estonia:`        | et    |
| :finland:        | Finnish               | `:finland:`        | fi    |
| :fr:             | French                | `:fr:`             | fr    |
| -                | Galician              | -                  | gl    |
| :de:             | German                | `:de:`             | de    |
| :greece:         | Greek                 | `:greece:`         | el    |
| :hungary:        | Hungarian             | `:hungary:`        | hu    |
| :indonesia:      | Indonesian            | `:indonesia:`      | id    |
| :ireland:        | Irish                 | `:ireland:`        | ga    |
| :it:             | Italian               | `:it:`             | it    |
| :jp:             | Japanese              | `:jp:`             | ja    |
| :kr:             | Korean                | `:kr:`             | ko    |
| :lithuania:      | Lithuanian            | `:lithuania:`      | lt    |
| :poland:         | Polish                | `:poland:`         | pl    |
| :brazil:         | Portuguese (Brazil)   | `:brazil:`         | pt_BR |
| :ru:             | Russian               | `:ru:`             | ru    |
| :slovakia:       | Slovak                | `:slovakia:`       | sk    |
| :es:             | Spanish               | `:es:`             | es    |
| :sweden:         | Swedish               | `:sweden:`         | sv    |
| :tr:             | Turkish               | `:tr:`             | tr    |
| :ukraine:        | Ukrainian             | `:ukraine:`        | uk    |

## More info

For more info read: [Deployment using Travis](https://neomutt.org/dev/deploy)

