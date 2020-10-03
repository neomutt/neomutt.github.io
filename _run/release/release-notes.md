---
title: Release Notes
description: Generating the Release Notes
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

Generating the Release Notes is an Art.
We need to summarise the 2200 commits, since the last release, into a readable announcement.
Also, we need to consider other (non-code) ways in which people have helped us.
e.g. Bug reports, Helping people on IRC, etc.

Once the Notes have been completed, they need to be transformed slightly for the different media and audiences.

The [management](https://github.com/neomutt/management) repo contains templates.
These are just suggestions.

- [changelog.md](https://github.com/neomutt/management/blob/master/release-templates/changelog.md)
- [dev-ml.txt](https://github.com/neomutt/management/blob/master/release-templates/dev-ml.txt)
- [github.md](https://github.com/neomutt/management/blob/master/release-templates/github.md)
- [user-ml.txt](https://github.com/neomutt/management/blob/master/release-templates/user-ml.txt)
- [website.md](https://github.com/neomutt/management/blob/master/release-templates/website.md)

It's probably easiest to start with the github template, writing in Markdown, then simplifying it where necessary.

## Finding Newsworthy Items

This is one of the slowest parts of creating a release, but also one of the most
important.  The users want to know of all the new features and the contributors
want to see their name in lights.

This needs to be done for all the NeoMutt repos, but clearly the majority of contributions will be in the `neomutt` repo.

Getting the list of contributors is simple.
Upstream committers can be excluded unless they've directly contributed to NeoMutt.
See the `mailmap` notes for more detail.

```
git shortlog --summary --email neomutt-20180716..
```

Next, get a list of all the commits

```
git log --graph --format="%h %s" neomutt-20180716..
```

We need to get the right level of detail, which means culling most of the information.
Start by looking for branches with similar commits, e.g.

- Lots of tests added
- Code tidying
- Refactoring
- Translations
- Documentation

These can quickly be summarised in a single line.
Next, look for significant events:

- New Features
- Bug fixes
- Config changes

Finally start grouping similar commits, looking for patterns that could be summarised.

:exclamation: **Do NOT** let this take too long.
Most people won't read far into the Release Notes.

## Layout

### Top

- **Notes**
  This first section is a brief overview of the Release.
  It should include any important notes that the user should be aware of.

- **Thanks**
  Here, we divide up the users into new and regular.
  Both lists should be randomised and @flatcap should be omitted.

To find out if a user has contributed before, it can be helpful to `grep` the website `_posts` directory.

### Major Changes

These are the important bullet-points to sell:

- **New Features**
- **Bug Fixes**
- **Config Changes**

### Minor Changes

Other significant changes:

- **Contrib**
- **Docs**
- **Features**
- **Translations**
- **Website**

### Code Changes

These may be of interest to developers:

- **Build**
  - Autosetup
  - Travis
- **Source**
  - Refactoring
  - Coverity defects
- **Upstream**

