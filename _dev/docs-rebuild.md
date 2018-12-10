---
layout: concertina
title: Docs Rebuild
description: (Re-)Building the Documentation
status: wip
---

# {{ page.title }}

Everything in NeoMutt is documented, but... If you don't know what you're
looking for, you're unlikely to find it.

## The problem

The docs are:

- Huge
- Hard to maintain
- Hard to search
- Hard to build
- Heavily dependent on the code
- Entirely text

The guide needs to be split up and re-grouped, thematically: a chapter on the
pager; a chapter on IMAP, ...

Some projects' documentation have handy links: "Click here to improve the
docs". It would be wonderful if we could do this.

## Document format

The docs are written in DocBook XML. It's a rich language allowing you can make
\<note\>Notes\</note\>, \<example\>Examples\</example\>,
\<chapter\>Chapters\</chapter\> and \<section\>Sections\</section\>. As well as
normal HTML things like titles and paragraphs.

If the docs were stored in a big XML file, things would be easy. Open
a DocBook-compatible editor and off you go... Unfortunately, `manual.xml`
isn't the start of the journey, it's the middle!

## Generating manual.xml

[This diagram](https://neomutt.org/images/make-docs.svg) shows the NeoMutt build
process. It includes the steps needed to build manual.xml

To reduce the duplication of text, source of the source code is parsed to
generate the manual.

### opcodes.h

[opcodes.h](https://github.com/neomutt/neomutt/blob/master/opcodes.h)
are processed by a perl script:
[gen-map-doc](https://github.com/neomutt/neomutt/blob/master/doc/gen-map-doc)

| Function ID            | Description                               |
| :--------------------- | :---------------------------------------- |
| OP_ATTACH_VIEW_MAILCAP | force viewing of attachment using mailcap |
| OP_ATTACH_VIEW_TEXT    | view attachment as text                   |
| OP_ATTACH_COLLAPSE     | toggle display of subparts                |

### functions.h

[functions.h](https://github.com/neomutt/neomutt/blob/master/functions.h)
is processed by a perl script:
[gen-map-doc](https://github.com/neomutt/neomutt/blob/master/doc/gen-map-doc)

| function name  | function ID   | default key |
| :------------- | :------------ | :---------- |
| top-page       | OP_TOP_PAGE   | 'H'         |
| next-entry     | OP_NEXT_ENTRY | 'j'         |
| previous-entry | OP_PREV_ENTRY | 'k'         |

### init.h

[init.h](https://github.com/neomutt/neomutt/blob/master/init.h)
is processed by a program:
[makedoc](https://github.com/neomutt/neomutt/blob/master/doc/makedoc.c)
It reads the variable, its type and default value. It also processed the
description which is written in NROFF (man) format.

```c
{ "ascii_chars", DT_BOOL, R_BOTH, OPTASCIICHARS, 0 },
/*
 ** .pp
 ** If \fIset\fP, Mutt will use plain ASCII characters when
 ** displaying thread ** and attachment trees, instead of the default
 ** \fIACS\fP characters.
 */
```

### Some assembly required

Finally we can build `manual.xml`. Take `doc/manual.xml.head` add the
functions, commands and variables, then add `doc/manual.xml.tail`

`manual.xml` is now complete and valid DocBook.

## Rendering manual.xml

DocBook comes with some standard XSLT files. They define transformations from
DocBook to HTML. Chapters are turned into separate pages. Sections are given
\<h1\>, \<h2\> headings, etc.

Also, \<note\> and \<example\> are turned into \<span\> or \<div\> with
classes, so that they can be themed. This is also where \<quote\>s are turned
into "smart quoted" strings.

We now have some HTML, that looks machine-generated.

## Generating the website

NeoMutt's website is hosted by GitHub's Pages. It's a static site which uses
[Jekyll](https://jekyllrb.com) to allow some templating and "magic".

To turn manual.xml into a website requires quite a lot of post-processing. The
main script is: [build](https://github.com/neomutt/docbook/blob/master/build)
in the [docbook repo](https://github.com/neomutt/docbook)

`build` takes the HTML files and tidies them, cuts out the bits we want and
gives them a YAML header (for Jekyll). It also fixes some of the links between
documents. Along the way we also fix any formatting problems that we introduced
(smart quotes).

## The future

Mutt's re-use strategy means that if you fix one piece of documentation, then
it will be replicated into all the forms of documentation. But, it means you
need to know where the source is. This is preventing users from helping us.

### Step 1 -- Separation

The docs should be completely separate from the code.

Good:

- Docs can be maintained by non-technical users
- Simplifies build process
- Simplifies website generation

Bad:

- Requires synchronisation between docs and code

### Step 2 -- Conversion

I like DocBook. It's expressive and capable, but it's not user-friendly.
A good alternative would be Markdown.

Good:

- Easy to read and edit
- Can be converted to HTML
- Supported by our current website

Bad:

- Less expressive
- Initial conversion will take a lot of work

### Step 3 -- Reorganisation

Once the docs are easily editable, then we can encourage users to help.

To do:

- Split guide into more manageable sections
- Add more HowTos -- simple answers to specific problems
- More pictures of NeoMutt in action

## Conclusion

NeoMutt is a complex program to use. It's a big problem for new users.

By re-working the docs, we can encourage new users to NeoMutt and make sure
that all users get the most out of NeoMutt.

These changes won't reduce the amount of work by much, but crucially, they will
reduce the technical difficulty of the work.

These are jobs what will transform NeoMutt! (These are not jobs for the
faint-hearted!)

---

What do you think?

Are **YOU** up for a challenge?

Please help.

