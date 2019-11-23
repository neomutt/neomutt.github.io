---
layout: concertina
title: Mailmap
description: Update the Git Mailmap
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

The `.mailmap` file provides a lookup table for committers' names.
We use it to show the preferred name, email address and GitHub username.

**Repos needed**:
- [https://github.com/neomutt/aur-build](https://github.com/neomutt/aur-build)
- [https://github.com/neomutt/botty](https://github.com/neomutt/botty)
- [https://github.com/neomutt/doxygen](https://github.com/neomutt/doxygen)
- [https://github.com/neomutt/gentoo-neomutt](https://github.com/neomutt/gentoo-neomutt)
- [https://github.com/neomutt/homebrew-neomutt](https://github.com/neomutt/homebrew-neomutt)
- [https://github.com/neomutt/management](https://github.com/neomutt/management)
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/neomutt.github.io](https://github.com/neomutt/neomutt.github.io)
- [https://github.com/neomutt/neomutt.vim](https://github.com/neomutt/neomutt.vim)
- [https://github.com/neomutt/travis-build](https://github.com/neomutt/travis-build)

## File formats

We store data in two files in the [management](https://github.com/neomutt/management) repo.

1. `git/neomutt.txt` -- Everyone that has directly contributed to NeoMutt

The data is `<tab>`-separated.
The first line is the preferred style of full name and preferred email address.
Add one line for every address, exactly as it's stored in git.
If the user doesn't have a GitHub account, put `NONE` in that column.

```
FULL NAME<tab>EMAIL-ADDRESS<tab>GITHUB-USERNAME
<tab>FULL NAME <EMAIL-ADDR1>
<tab>FULL NAME <EMAIL-ADDR2>
```

e.g.

```
Richard Russon  rich@flatcap.org        flatcap
        Richard Russon <rich@flatcap.org>
        Richard Russon (DEPLOY) <rich@flatcap.org>
```

2. `git/mutt.txt` -- All the users whose work we've adopted from upstream

The Mutt data doesn't store the GitHub username, but is otherwise the same.

```
FULL NAME<tab>EMAIL-ADDRESS
<tab>FULL NAME <EMAIL-ADDR1>
<tab>FULL NAME <EMAIL-ADDR2>
```

e.g.

```
Kevin McCarthy  kevin@8t8.us
        Kevin McCarthy <kevin@8t8.us>
```

## Finding Names

This needs to be repeated for all of the NeoMutt repos except upstream, mirrors, etc.

**Ignore** these repos:

- [acutest](https://github.com/neomutt/acutest) 
- [aur-docker](https://github.com/neomutt/aur-docker) 
- [autosetup](https://github.com/neomutt/autosetup) 
- [code](https://github.com/neomutt/code) 
- [homebrew-core](https://github.com/neomutt/homebrew-core) 
- [upstream-mutt](https://github.com/neomutt/upstream-mutt) 
- [vim](https://github.com/neomutt/vim) 

First, take a copy of `git/mailmap-name-nick` from the `management` repo.
Edit all the NeoMutt contributors, prefixing each line with `EXISTS `.
Now change your `git` settings (`~/.gitconfig`) to use that mailmap.

```
[mailmap]
    file = /PATH/TO/mailmap-name-nick
```

**In each repo**, use `git shortlog` to generate a list of credits.

```
git shortlog --summary --email | grep -v -e UPSTREAM -e EXISTS
```

For each person in the list, we need to add an entry to one of our data files.
The `neomutt` repo, can contain commits from upstream Mutt.
This means we'll have to find out what the user did, to know which data file to use.

```
git log -n1 --author "STRING FROM SHORTLOG"
```

Using the commit hash, examine the change, or look at the context of the change in the log.
Almost all upstream commits will be in separate branches.

```
git log --oneline --graph
```

## Generate

Finally, generate the mailmap files using the scripts provided and commit the changes.

```
cd management/git
for i in *.sh; do ./$i > ${i%.sh}; done
git commit --all --message "update mailmaps"
```

