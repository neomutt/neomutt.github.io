---
title: Home
---

# The NeoMutt Project

{:.subtitle}
“Teaching an Old Dog New Tricks”

## Overview

### What is it?

{:.readmore}
NeoMutt is a command line mail reader (or <abbr title="Mail User Agent">MUA</abbr>).
It's a fork of Mutt with added **features**.
[Read more...](about.html)

### Why?

The NeoMutt project is hoping to kick-start development on the Mutt project.

NeoMutt has already attracted about twenty developers and enthusiasts.

### What have you achieved, so far?

Lots of old Mutt patches have been brought up-to-date, tidied and documented.

{:.readmore}
Notably, the Sidebar patch has now been adopted by upstream Mutt.
[Read more...](feature.html)

### How can I try it out?

{:.readmore}
NeoMutt is available to download for various distros:
[Read more...](distro.html)

## I need help

Oh, sorry to hear that. If you are a GitHub user, you can raise a
[Website issue](https://github.com/neomutt/neomutt.github.io/issues) or a
[NeoMutt code issue](https://github.com/neomutt/neomutt/issues).

Alternatively, you can join the NeoMutt IRC channel:
[irc://irc.libera.chat/neomutt](irc://irc.libera.chat/neomutt)
(read about [some useful commands](/run/irc)), or contact the lead
developer, Richard&nbsp;Russon&nbsp;[&lt;rich@flatcap.org&gt;](mailto:rich@flatcap.org)

## I want to help NeoMutt

Brilliant. There are lots of ways you can contribute to the NeoMutt project.

Whatever your skills, or time available, **you can help**.

### [Easy Coding Tasks](/dev/easy-tasks)

These are a great way to start coding on NeoMutt.

A mentor will walk you though all the steps to making your first contribution.

### [Translation](/translate)

Are you a fluent speaker of a language, other than English?

You could help our translation effort.  It's simple to do and would benefit so many people.

### [Discussions](https://github.com/neomutt/neomutt/issues?q=is:issue+is:open+sort:updated-desc+label:status:discuss)

When developing new features, the developers would love to benefit from your experience.

If an issue is labelled "status:discuss", then you're encouraged to offer your thoughts and opinions.

### [Donation](https://www.paypal.me/russon/)

For the cost of a cup of coffee (or pint of beer :-)
you could bring happiness into the life of NeoMutt creator [FlatCap](https://github.com/flatcap).

## Twitter

We have a Twitter Feed [@NeoMutt_Org](https://twitter.com/NeoMutt_Org).

## Mailing lists

We have two public mailing lists: <a class="rm" href="/2016/08/17/news">Read more...</a>

### NeoMutt Users' Mailing List

Discuss your favourite features, share experiences, swap config files, ask for help...

[**Subscribe**](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)

### NeoMutt Developers' Mailing List

Listen in to the developers, propose new features, offer help...

[**Subscribe**](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)

## IRC - [irc://irc.libera.chat/neomutt](irc://irc.libera.chat/neomutt)

We now have a presence on IRC. To become familar with IRC
[read about useful commands](/run/irc). Come, say hello! Please
note, that we're a small group. Therefore, answers might take some time.

## Latest news

{% for p in site.posts limit:5 %}
- **{{ p.date | date: '%Y-%m-%d' }}** - [{{ p.title }}]({{ p.url }})
{% endfor %}
