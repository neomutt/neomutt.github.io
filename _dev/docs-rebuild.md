---
title: Docs Rebuild
description: (Re-)Building the Documentation
---

# {{ page.title }}

For years, NeoMutt's documentation lived entirely in `manual.xml`, hand-assembled from
DocBook XML woven together with text parsed straight out of the C source (`opcodes.h`,
`functions.h`, `init.h`). It was:

- Huge
- Hard to maintain
- Hard to search
- Hard to build
- Heavily dependent on the code
- Entirely text

Separating the docs from the code, and converting DocBook to something easier to write
and maintain, was a long-standing wish here.

## Done: separation and conversion

Both of those steps have now happened. The documentation lives in its own repository,
[neomutt/docs](https://github.com/neomutt/docs), written in Markdown, built with
[Sphinx](https://www.sphinx-doc.org/) and hosted on [Read the
Docs](https://readthedocs.org/) at [docs.neomutt.org](https://docs.neomutt.org). It
follows the [Diátaxis](https://diataxis.fr/) framework, split into Tutorials, How-to
guides, Reference, and Explanation sections.

## What's left: the Reference section isn't synced from the code

The old system's one genuine advantage was that documentation for every config
variable, command, and function came straight from the source (`init.h`, `functions.h`,
`opcodes.h`), so it could never drift out of date. The new Reference section doesn't
have that yet — it's a one-time, hand-written export, not regenerated from the C source
as it changes. See [neomutt/docs#2](https://github.com/neomutt/docs/issues/2) for a
proposal on closing that gap.

## Contributing

The new format is far easier to contribute to than DocBook ever was — no build
toolchain, no XML, just Markdown files in an ordinary repo. If you'd like to help,
[neomutt/docs](https://github.com/neomutt/docs) is the place to start.
