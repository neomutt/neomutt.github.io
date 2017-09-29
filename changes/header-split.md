---
layout: concertina
title: Split up of mutt.h
---

# {{ page.title }}

mutt.h has been split up into a separate file for most of the structs within it.

| New File       | Contains                          |
| :------------- | :-------------------------------- |
| address.h      | struct Address                    |
| alias.h        | struct Alias                      |
| body.h         | struct Body                       |
| content.h      | struct Content                    |
| context.h      | struct Context                    |
| enter_state.h  | struct EnterState                 |
| envelope.h     | struct Envelope                   |
| format_flags.h | constants for mutt_formatString() |
| header.h       | struct Header                     |
| list.h         | struct List                       |
| mbyte_table.h  | struct MbCharTable                |
| options.h      | enumeration for boolean options   |
| parameter.h    | struct Parameter                  |
| pattern.h      | struct Pattern                    |
| state.h        | struct State                      |
| thread.h       | struct MuttThread                 |
| where.h        | an evil macro                     |

