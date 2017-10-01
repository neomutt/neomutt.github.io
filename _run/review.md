---
layout: concertina
title: Reviewing Issues
description: Reviewing Issues
status: wip
author: flatcap
---

# {{ page.title }}

## Overview

**Important points:**

* We don't want people to waste their time, either
  * writing code we don't want
  * duplicating the work of others

**For most new work some discussion is needed first.**

* What do you want to change?
* Why is that needed?
* What's the best way to do it?

**You can get approval from:**

* IRC
* Issue
* Mailing list

**Who gives approval?**

* Project reviewers (team on github)
  - Richard Russon ([@flatcap](https://github.com/flatcap))
  - Darshit Shah ([@darnir](https://github.com/darnir))
  - Guillaume Brogi ([@guiniol](https://github.com/guiniol))
  - Pierre-Elliott Bécue ([@p-eb](https://github.com/p-eb))
  - Bernard Pratz ([@guyzmo](https://github.com/guyzmo))
  - Damien Riegel ([@d-k-c](https://github.com/d-k-c))
  - Pietro Cerutti ([@gahr](https://github.com/gahr))

**Don't need approval for:**

* Fixing bugs (assign yourself before you start)
* Altering documentation
* Adding to the website
* Adding comment blocks
* Updating translations

**Feedback:**

* We want to know what's going on, so we can plan releases
* People need a little freedom to experiment before others express their
  opinions

**When does a user want:**

* Feedback?
* Review?
* Merge?

## Scenario -- NeoMutt member

### Coder has an idea

**Open issue 123**

- Coder: "I'd like to..."
- Reviewer: "OK, that's a good idea"

**Create branch in neomutt repo, either:**

- /issue/123
- /devel/feature-name

**Work:**

- write code
- push code (automatic travis build)
- repeat

### When code is ready for public scrutiny...

**Create pull request**

- Coder: "This relates to #123" (linking issue and PR)
- A.N.Other: "feedback"
- code
- repeat

### When code is ready for review...

- Comment: "@neomutt/reviewers please review"
- Reviewer 1: "change this"
- code
- Reviewer 1: "approved"
- Reviewer 2: "approved"

### When code is ready for merge...

- Reviewer: merge code

