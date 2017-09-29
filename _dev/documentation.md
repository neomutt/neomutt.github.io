---
layout: concertina
title: Documentation
description: Description of Neomutt's documentation process.
---

# {{ page.title }}

Please document your changes. Note that there are several places where you may
have to add documentation:

- doc/manual.xml.{head,tail} contain The Manual.
- doc/muttrc.man.{head,tail} contain an abridged version of The Manual in nroff
  format (see man(7)), which deals with configuration file commands.
- UPDATING includes short documentation of user-visible changes, i.e., any
  incompatibilities should go here.

Configuration _variables_ are documented directly in init.h. Note that this
includes documentation for possibly added format flags!

The parts of The Manual and the muttrc manual page dealing with these
variables, and the global Muttrc, are generated automatically from that
documentation. To start this process, type "make update-doc" in the top-level
source directory.

Note that you may have to update the makedoc utility (makedoc.c) when adding
new data types to init.h.

More precisely, variable name, type, and default value are directly extracted
from the initializer for the MuttVars array. Documentation is expected in
special comments which _follow_ the initializer. For a line to be included with
the documentation, it must (after, possibly, some white space) begin with
either "/**" or "**". Any following white space is ignored. The rest of the
line is expected to be plain text, with some formatting instructions roughly
similar to [ntg]roff:

- \fI switches to italics
- \fB switches to boldface
- \fT switches to monospace
- \fP switches to normal display after \fI, \fB or \fT
- \(as can be used to represent an asterisk (*). This is intended to help
  avoiding character sequences such as /* or */ inside comments.
- \(rs can be used to represent a backslash (\). This is intended to help
  avoiding problems when trying to represent any of the \ sequences used by
  makedoc.
- .dl on a line starts a "definition list" environment (name taken from HTML)
  where terms and definitions alternate.
- .dt marks a term in a definition list.
- .dd marks a definition in a definition list.
- .de on a line finishes a definition list environment.
- .ts on a line starts a "verbose tscreen" environment (name taken from SGML).
  Please try to keep lines inside such an environment short; a length of about
  40 characters should be OK. This is necessary to avoid a really bad-looking
  muttrc (5) manual page.
- .te on a line finishes this environment.
- .pp on a line starts a paragraph.
- $word will be converted to a reference to word, where appropriate. Note that
  $$word is possible as well. Use $$$ to get a literal $ without making
  a reference.
- '. ' in the beginning of a line expands to two space characters. This is used
  to protect indentations in tables.

Do _not_ use any other SGML or nroff formatting instructions here!

Required tools
--------------

For the complete list, you can always look up the .travis.yml files. Note that
these are the ubuntu packages.

