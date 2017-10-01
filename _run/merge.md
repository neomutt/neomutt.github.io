---
layout: concertina
title: Branch Merging
description: When to merge? When to squash?
author: Richard Russon
status: wip
---

# {{ page.title }}

Recently, someone asked me the difference between GitHub's three merge options.
Here are some helpful pictures:

```reply
      A---B---C topic
     /
D---E---F---G master
```

A developer has created branch from master's commit E. (this is known as
a topic branch in git terminology)

They committed A, B, C.

Meanwhile commits F and G were added to master.

## Create a merge commit

```reply
      A---B---C topic
     /
D---E---F---G master
```

```
git checkout master
git merge --no-ff topic
```

```reply
      A---B---C topic
     /         \
D---E---F---G---H master
```

The topic branch has been merged into master with a "merge commit". The
topic's history hasn't been changed.

## Squash and merge

```reply
      A---B---C topic
     /
D---E---F---G---H master
```

```
git checkout topic
git rebase master
```

```reply
              A---B---C topic
             /
D---E---F---G master
```

The user's changes have been reapplied to the HEAD of master.

```
git rebase --interactive
```

```reply
              H topic
             /
D---E---F---G master
```

Git's interactive rebase allows you to reorder commits and squash them into one
bit commit: H.

```
git checkout master
git merge --ff topic
```

```reply
D---E---F---G---H master
```

The squashed commit, H, has been added to the HEAD of master.

## Rebase and merge

```reply
      A---B---C topic
     /
D---E---F---G master
```

```
git rebase master
```

The user's changes have been reapplied to the HEAD of master.

```reply
              A---B---C topic
             /
D---E---F---G master
```

```
git checkout master
git merge --no-ff topic
```

```reply
              A---B---C topic
             /         \
D---E---F---G-----------H master
```

The topic branch has been merged into master with a "merge commit". The topic's
history looks the same, but appears to have happened just now.

This option makes the history look tidiers. Rather than having multiple topic
branches being created and merged at different times (all overlapping), they
are separated out.

Here are three topic branches being merged sequentially:

```reply
              o---o---o      o---o---o      o---o---o
             /         \    /         \    /         \
o---o---o---o-----------o--o-----------o--o-----------o master
```

--------------------------------------------------------------------------------

When to merge? When to squash?

When work is merged into master:

- Each commit should build
- Each commit should be self-contained

If there are 1 or 2 commits, then fast-forward master:
  `merge --ff`

If there are more than 2 commits, then rebase and merge into master:
  `merge --no-ff`

GitHub's documentation is here:
  https://help.github.com/articles/merging-a-pull-request/
  https://help.github.com/articles/about-pull-request-merges/

