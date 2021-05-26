---
title: About
---

# {{ page.title }}

## What is NeoMutt?

**NeoMutt** is a command line **mail reader** based on Mutt.

It's versatile and highly configurable.

It has lots of [new features](feature.html) which come with documentation and sample config files.

### NeoMutt in action

<pre class="screen">
<span class="indicator">Fruit [1]     3/8</span>|  1    + Jan 24  Rhys Lee         (192)  Yew
Animals [1]   2/6|  2    + Feb 11  Grace Hall       (167)  Ilama
Cars            4|  3      Feb 23  Aimee Scott      (450)  Nectarine
Seas          1/7|  4    ! Feb 28  Summer Jackson   (264)  Lemon
                 |  5      Mar 07  Callum Harrison  (464)  Raspberry
                 |<span class="indicator">  6 N  + Mar 24  Samuel Harris    (353)  Tangerine          </span>
                 |  7 N  + Sep 05  Sofia Graham     (335)  Cherry
                 |  8 N    Sep 16  Ewan Brown       (105)  Ugli
                 |
                 |
</pre>

The sidebar on the left shows the folders; the index panel on the right shows the emails.

Almost every feature of the display can be configured, e.g. the visibility,
size, colour and content of the sidebar. The layout, colour and formatting of
the index panel.

## What is NeoMutt (the project)?

- NeoMutt is a project of projects
- A place to gather all the patches against Mutt
- A place for all the developers to gather

Hopefully this will build the community and reduce duplicated effort.

### Why call it NeoMutt?

NeoMutt is just a name. When [FlatCap](https://github.com/flatcap)
created the project, he needed a name that was unused on GitHub.

### Is it a Fork?

Yes NeoMutt is a **fork** of Mutt.

We still merge all of Mutt's changes into NeoMutt, but it's getting harder
because of the growing differences between them.

## Why?

- Reduce duplication
- Get patches in a state to be accepted upstream

Many hundreds of Mutt users have taken the time to patch Mutt to add features.
Unfortunately, it's usually the same patches as everyone else and effort is wasted.

Also, there are some heroic developers who have been maintaining multi-thousand line patches:

- Notmuch patch \>4 years
- Sidebar patch \>10 years - **Now accepted upstream**
- NNTP patch \>15 years

## What's been done so far?

### Additions to Mutt

[Sidebar](/feature/sidebar) has been completely overhauled,
merging features, fixing bugs, tidying code and documenting the results.

Sidebar is our first success story. The patch was accepted upstream and released in Mutt-1.7.0.

[Notmuch](/feature/notmuch) has been brought up-to-date, against
Mutt-1.8.0. It has been split out of the
[mutt-kz repo](https://github.com/karelzak/mutt-kz) and refactored slightly.

19 other [Features](/feature.html) have been tidied and documented.

## What's next?

NeoMutt now has all the big features that existed as patches. It's stable
and up-to-date with Mutt. So, what next?

Below is a list of areas we'd like to work on:

### Features / Enhancements

- There are a few more large features that we can incorporate and users ask
  for smaller enhancements almost daily.

### Bug-Fixes

- The more users there are of NeoMutt, the more bugs they find. That's
  good though. We're doing very well finding and fixing bugs.

### Mentoring

- If we break down some of our development problems into smaller, more
  manageable tasks, we can encourage new developers to take an active part,
  learning in the process.

### Better Sidebar integration

- [Notmuch](/feature/notmuch) and
- [NNTP](/feature/nntp) would really benefit from closer
- [Sidebar](/feature/sidebar) integration

### Unifying distros

- Many of the distros' feature patches have already been integrated into NeoMutt.
  Each patch NeoMutt adopts brings all the distros closer together, reducing
  their workload.

### Better Colour Support

- NeoMutt has added [Status-Color](/feature/status-color) and
  [Index-Color](/feature/index-color) patches.
  They work, but fall short of what's needed.

### Scripting

- NeoMutt could be so much more powerful if it had scripting capability.
  A possible candidate is [LUA](https://www.lua.org/), which is
  small, simple, but powerful.

### Upstream

- Get more features accepted into upstream Mutt

## Contact the Developers

You can contact the developers in several ways:

- [IRC Channel](irc://irc.libera.chat/neomutt) - **#neomutt** on **irc.libera.chat**

- **User Mailing List** - [Email](mailto:neomutt-users@neomutt.org) or [Subscribe](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)  
  This list is suitable for beginners and non-technical discussion is welcomed.

- **Devel Mailing List** - [Email](mailto:neomutt-devel@neomutt.org) or [Subscribe](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)  
  This list is for developers and will often have technical discussions about code and new features.

- **Raise an Issue on GitHub** - If you find a bug please [create a new issue](https://github.com/neomutt/neomutt/issues) for us to track the problem.

- **Contact the Lead developer** - Richard Russon \<[rich@flatcap.org](mailto:rich@flatcap.org)\>  
  Note: He is often busy, so replies might take some time.

