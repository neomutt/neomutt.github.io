---
title: Site
---

# NeoMutt Website

## What's it made of?

This is the website of [The NeoMutt Project](/about.html). It was
created by Richard Russon ([FlatCap](https://github.com/flatcap)).

The site is hosted at [{{site.url}}]({{site.url}})
by [GitHub](https://github.com/) on their [GitHub Pages](https://pages.github.com/).

The pages were created using a mix of HTML and
[Kramdown](https://kramdown.gettalong.org/quickref.html), a flavour of Markdown
They are then processed by [Jekyll](https://jekyllrb.com/) (a static-website generator).

The site's theme is loosely based on Scott Emmons'
[Jekyll-Clean](https://github.com/scotte/jekyll-clean).
It also uses Twitter's [Bootstrap](https://getbootstrap.com)
framework and a colour scheme from Ian Wootten's
[jekyll-syntax](https://github.com/iwootten/jekyll-syntax) collection.

- Source Code for this site:  
  [NeoMutt Pages repository](https://github.com/neomutt/neomutt.github.io)
  Some pages are generated from files in the [NeoMutt source repository](https://github.com/neomutt/neomutt).

    - The NeoMutt Guide is generated from [docs/manual.xml.head](https://github.com/neomutt/neomutt/blob/main/docs/manual.xml.head)
      It is written in DocBook (XML). The Reference section is generated from
      [docs/config.c](https://github.com/neomutt/neomutt/blob/main/docs/config.c)
      and renamed feature notes come from [mutt_config.c](https://github.com/neomutt/neomutt/blob/main/mutt_config.c).

    - The Features pages are generated from a subset of the same file.
      Look for the `<sect1>` headings: `<sect1 id="account-cmd"> until <sect1 id="use-threads-feature">`

    - The Man pages are generated from separate files in the docs directory:
      - [docs/mbox.5](https://github.com/neomutt/neomutt/blob/main/docs/mbox.5)
      - [docs/mmdf.5](https://github.com/neomutt/neomutt/blob/main/docs/mmdf.5)
      - [docs/neomutt.man](https://github.com/neomutt/neomutt/blob/main/docs/neomutt.man)
      - [docs/neomuttrc.man.head](https://github.com/neomutt/neomutt/blob/main/docs/neomuttrc.man.head)
      - [docs/pgpewrap.1](https://github.com/neomutt/neomutt/blob/main/docs/pgpewrap.1)
      - [docs/smime_keys.1](https://github.com/neomutt/neomutt/blob/main/docs/smime_keys.1)

- NeoMutt Releases:  
  [https://github.com/neomutt/neomutt/releases/latest](https://github.com/neomutt/neomutt/releases/latest)
- Questions/Bugs with the website:  
  [https://github.com/neomutt/neomutt.github.io/issues](https://github.com/neomutt/neomutt.github.io/issues)
- NeoMutt Development:  
  [https://neomutt.org/dev.html](https://neomutt.org/dev.html)

The site is &copy; {{ site.time | date: '%Y' }} Richard Russon and released
under the
[Creative Commons Attribution](https://github.com/neomutt/neomutt.github.io/blob/main/LICENSE.md#creative-commons)
license.

The site was last updated on {{ site.time | date: '%Y-%m-%d at %H:%M:%S' }}

