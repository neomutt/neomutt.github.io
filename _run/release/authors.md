---
title: Authors
description: Give credit to everyone who's contributed
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

Keep a list of everyone who has directly contributed to the NeoMutt project.
First check that the `mailmap` file, in the `management` repo, is up-to-date.

**Repos needed**:
- [https://github.com/neomutt/management](https://github.com/neomutt/management)
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/neomutt.github.io](https://github.com/neomutt/neomutt.github.io)

## Files

There are three files to update, in two repos:
- [neomutt](https://github.com/neomutt/neomutt): `AUTHORS.md`, `README.md`
- [neomutt.github.io](https://github.com/neomutt/neomutt.github.io): `credits.md`

## Repos to Check

Ideally, we should check all of NeoMutt's repos for new contributors.
In practice, only a handful are active, especially:

- [botty](https://github.com/neomutt/botty)
- [doxygen](https://github.com/neomutt/doxygen)
- [neomutt.github.io](https://github.com/neomutt/neomutt.github.io)
- [neomutt.vim](https://github.com/neomutt/neomutt.vim)
- [neomutt](https://github.com/neomutt/neomutt)

Some repos (upstream, mirrors, etc) **should be ignored**:

- [acutest](https://github.com/neomutt/acutest) 
- [aur-docker](https://github.com/neomutt/aur-docker) 
- [autosetup](https://github.com/neomutt/autosetup) 
- [code](https://github.com/neomutt/code) 
- [copr-neomutt ](https://github.com/neomutt/copr-neomutt)
- [homebrew-core](https://github.com/neomutt/homebrew-core) 
- [muttrc-mode-el](https://github.com/neomutt/muttrc-mode-el)
- [upstream-mutt](https://github.com/neomutt/upstream-mutt) 
- [vim](https://github.com/neomutt/vim) 

## AUTHORS.md

`AUTHORS.md` in the `neomutt` repo has the format:

```
[Richard Russon](https://github.com/flatcap "flatcap"),
```

Any contributors that don't have a GitHub account have the format:

```
Rubén Llorente,
```

:spiral_notepad: **Note**: Space characters in the author's name are replaced with `0xA0` Non-Breaking Spaces.

There's a `credit.sh` script in the management repo to generate this list.

## README.md

`README.md` in the `neomutt` repo contains a [shields.io](https://shields.io/) link to `AUTHORS.md`.

When `AUTHORS.md` has been changed, update the number of contributors in the link.
(here, it's 167):

```
[![Contributors](https://img.shields.io/badge/Contributors-167-orange.svg)]
```

## credits.md

`credits.md` in the `neomutt.github.io` repo has the same format as `AUTHORS.md`:

```
[Richard Russon](https://github.com/flatcap "flatcap"),
```

