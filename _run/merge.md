---
title: Branch Merging
description: When to merge? When to squash?
author: Richard Russon
status: wip
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

Integrate your work and bring things together

## Initial situation

Recently, someone asked about the difference between GitHub's three merge options.
Here are some helpful pictures:

```reply
      A---B---C topic
     /
D---E---F---G main
```

A developer has created branch from main's commit E (this is known as a topic
branch in Git terminology).

They committed A, B, C.

Meanwhile commits F and G were added to main.

## Create a merge commit

```reply
      A---B---C topic
     /
D---E---F---G main
```

```
git checkout main
git merge --no-ff topic
```

```reply
      A---B---C topic
     /         \
D---E---F---G---H main
```

The topic branch has been merged into main with a "merge commit". The
topic's history hasn't been changed.

## Squash and merge

```reply
      A---B---C topic
     /
D---E---F---G---H main
```

```
git checkout topic
git rebase main
```

```reply
              A---B---C topic
             /
D---E---F---G main
```

The user's changes have been reapplied to the HEAD of main.

```
git rebase --interactive
```

```reply
              H topic
             /
D---E---F---G main
```

Git's interactive rebase allows you to reorder commits and squash them into one
bit commit: H.

```
git checkout main
git merge --ff topic
```

```reply
D---E---F---G---H main
```

The squashed commit, H, has been added to the HEAD of main.

## Rebase and merge

```reply
      A---B---C topic
     /
D---E---F---G main
```

```
git rebase main
```

The user's changes have been reapplied to the HEAD of main.

```reply
              A---B---C topic
             /
D---E---F---G main
```

```
git checkout main
git merge --no-ff topic
```

```reply
              A---B---C topic
             /         \
D---E---F---G-----------H main
```

The topic branch has been merged into main with a "merge commit". The topic's
history looks the same, but appears to have happened just now.

This option makes the history look tidier. Rather than having multiple topic
branches being created and merged at different times (all overlapping), they
are separated out.

Here are three topic branches being merged sequentially:

```reply
              o---o---o      o---o---o      o---o---o
             /         \    /         \    /         \
o---o---o---o-----------o--o-----------o--o-----------o main
```

--------------------------------------------------------------------------------

When to merge? When to squash?

When work is merged into main:

- Each commit should build
- Each commit should be self-contained

If there are 1 or 2 commits, then fast-forward main:
  `merge --ff`

If there are more than 2 commits, then rebase and merge into main:
  `merge --no-ff`

GitHub's documentation is here:

- [Merging a pull request](https://help.github.com/articles/merging-a-pull-request/)
- [About pull request merges](https://help.github.com/articles/about-pull-request-merges/)

