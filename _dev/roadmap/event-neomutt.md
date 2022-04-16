---
title: Event-Driven NeoMutt
description: A scheme for an event-driven NeoMutt
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include roadmap-links.html %}

## Nested Data

<img align="right" width="116" height="300" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/arch-data.svg">

At the heart of NeoMutt is the data. It starts with:

- The NeoMutt object (`N`) holds an Account List (`AL`)
- Each Account (`A`) holds a Mailbox List (`ML`)
- Each Mailbox (`M`) holds an Email List (`EL`)
- Each Email (`E`) is made up of an Envelope, Body and other Mime parts (not shown)

Some of these data objects are created by the core code in NeoMutt, but the
majority will be created by the backends (Maildir, IMAP, Notmuch, etc).

:bulb: **Note**: These objects are just raw data, only the data saved on your email
server.  They don't contain any GUI information (that's contained in the
[Views](#views)).

## Nested Windows

The GUI is composed of a set of nested Windows.  Some are visible, such as the
Sidebar and Pager, others are transparent containers used for alignment, etc.

**Scene**: User reads an email in the pager

Below, the tree and the diagram show the how the Windows are arranged.

```
Root Window (R)
├─▶ Help Line
├─▶ All Dialogs Container (D)
│   └─▶ Index-Pager Dialog (I)
│       ├─▶ Sidebar
│       └─▶ Container (4)
│           ├─▶ Index Container (5)
│           │   ├─▶ Index
│           │   └─▶ Index Bar (Status)
│           └─▶ Pager Container (6)
│               ├─▶ Pager
│               └─▶ Pager Bar
└─▶ Command Line / Message Window
```

<img width="600" height="330" src="https://raw.githubusercontent.com/neomutt/gfx/main/screenshots/window/dlg-index-pager.svg">

Each Window has a set of simple rules that determine its size and position.

- Index-Pager Dialog: Transparent, Maximise horizontal, Maximise vertical  
  Use all the available space given to it by its parent

- Sidebar: Visible, Fixed horizontal, Maximise vertical  
  Any remaining horizontal space will be used by Container (4)

- Index: Visible, Maximise horizontal, Fixed vertical

These rules allow the 'reflow' function to simply allocate screen space to the
Windows.

### Examples

1. User performs `:toggle sidebar_visible`
   - Sidebar Window is marked invisible
   - Reflow function resizes the Container (4) and all its children to use the extra space

2. User closes the Pager
   - Pager Container is marked invisible
   - Index Window is changed from "Fixed vertical" to "Maximise vertical"
   - Reflow function resizes the Index and moves the Index Bar (Status)

## Views

<img align="right" width="150" height="200" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/arch-view.svg">

The Email Index is simply the list of Emails in a certain Mailbox.
But:

- Which Mailbox?
- What order?
- What colours should be used?
- Which are tagged?

These questions are all answered by the Views.
For each data object there's a view object containing the user's visual
customisations and interactions with the data.

The diagram shows the Index (`I`) which owns a MailboxView (`MV`).
The MailboxView has a pointer to the data Mailbox (`M`) and also a child view, an
EmailView (`EV`), which points to some Emails (`E`).

:bulb: **Note**: There may be multiple Views, but there is only one Data object.

When composing an Email, if the user wants to attach an Email, then the sequence
looks like this: Index1 -> Compose -> Index2.  Index1 and Index2 may both refer
to the Mailbox, but they will have separate Views.  Changing the sort order in
Index2 won't affect Index1.

## Notifications

<img align="right" width="150" height="300" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/observer.svg">

To keep the Data and Views separate, NeoMutt uses an [Observer
Pattern](https://en.wikipedia.org/wiki/Observer_pattern) system of notifications.
Like the Data and the Windows, the Notifications are also nested.

The diagram shows four Subjects: the NeoMutt, Account, Mailbox and Email.  
Each has a Notification object (`N`) and a set of Observers (`O`).  
When a subject changes, all the observers will be notified.

:bulb: **Note**: Subjects are nested and Notifications will be propagated up the tree

<img width="600" height="300" src="https://raw.githubusercontent.com/neomutt/gfx/main/arch/notify.svg">

Current list of Subjects:

- NeoMutt -- Root of all notifications
- Account, AccountView
- Colour
- Command
- Config
- Email, EmailView
- Global, e.g. Startup, Shutdown
- Mailbox, MailboxView
- Window

### Example

**Sidebar**

The Sidebar uses data from three sources: Account, Mailbox and MailboxView, but
that's not all that affects the display.  Config variables, colours and some
commands can have an effect and the dimensions of the Window, too.

The config code doesn't know about the Sidebar, the Sidebar must register its
interest in the config, colours, commands, etc.  This helps to reduce
dependencies, whilst keeping things flexible.

