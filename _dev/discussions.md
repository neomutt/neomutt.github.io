---
layout: concertina
Title: Discussions
description: Closed Discussions on GitHub
status: wip
---

# {{ page.description }}

NeoMutt is very popular and its users come up with lots of great new ideas.

Unfortunately NeoMutt's development team is quite small, so they can't implement everything.

Below is a list of the issues where either the developers have no interest in or
can't help with.

They are closed for now, but they can be re-opened if someone volunteers to do
the work. Help will be freely given to volunteers. Issues where the result is
hard to achieve are labeled with
[difficulty:hard](https://github.com/neomutt/neomutt/issues?utf8=%E2%9C%93&q=label%3Adifficulty%3Ahard%20).
Please note, those hard issues are intentionally closed - they are sometimes
demotivating due to its difficulty.

### [#587 Better support for multipart/alternative?](https://github.com/neomutt/neomutt/issues/587)

Allow better nesting of mime parts

**Raised by** ([@mrzool](https://github.com/mrzool)) -- **Result**: desired, no interest

### [#535 Could '^g' be remapped?](https://github.com/neomutt/neomutt/issues/535)

Allow the 'abort' key to be remapped

**Raised by** ([@Alok](https://github.com/Alok)) -- **Result**: no interest

### [#504 imap: Mutt should handle dropped connections/routing problems gracefully.](https://github.com/neomutt/neomutt/issues/504)

Make IMAP able to handle dropped connections

**Raised by** ([@toogley](https://github.com/toogley)) -- **Result**: desired, hard

### [#467 Use cp1252 instead of iso-8859-1](https://github.com/neomutt/neomutt/issues/467)

Workaround some bad mailers sending cp1252 chars as iso-8859-1

**Raised by** [@gahr](https://github.com/gahr) on 2017-03-14 -- **Result**: low risk, charset-hook workaround

### [#469 Wish: more intelligent pasting](https://github.com/neomutt/neomutt/issues/469)

Respect the escape sequences for bracked paste mode

**Raised by** ([@phmarek](https://github.com/phmarek)) -- **Result**: no interest

### [#468 Stop asking for "Exit Mutt?"](https://github.com/neomutt/neomutt/issues/468)

Copy vim: don't try to exit on Ctrl-C, but tell the user what they need to know

**Raised by** ([@tdehaeze](https://github.com/tdehaeze)) -- **Result**: desired, no interest

### [#464 Limit or search by alias](https://github.com/neomutt/neomutt/issues/464)

Add the ability to limit, or search, the index by an alias

**Raised by** ([@mingsu](https://github.com/mingsu)) -- **Result**: no interest

### [#404 Use of gpg's group option](https://github.com/neomutt/neomutt/issues/404)

Use a GPG feature to allow encrypting to groups

**Raised by** [@Polichronucci](https://github.com/Polichronucci) on 2017-02-17 -- **Result**: no interest

### [#394 syntax highlighting inside mails](https://github.com/neomutt/neomutt/issues/394)

Allow flexible highlighting of emails

**Raised by** [@toogley](https://github.com/toogley) on 2017-02-13 -- **Result**: hard due to mutt's colour handling

### [#367 imap4 partial fetch request](https://github.com/neomutt/neomutt/issues/367)

Save bandwidth by only fetching a section of the index

**Raised by** [@rusnasonov](https://github.com/rusnasonov) on 2017-02-07 -- **Result**: desired, hard

### [#355 Danger: DMARC about to kill mailing list experience](https://github.com/neomutt/neomutt/issues/355)

Mailing lists don't play well with DMARC

**Raised by** [@nobrowser](https://github.com/nobrowser) on 2017-02-02 -- **Result**: not much we can do

### [#324 hcache: keep multiple mailbox caches open concurrently](https://github.com/neomutt/neomutt/issues/324)

Keep multiple hcache files open

**Raised by** [@sassmann](https://github.com/sassmann) on 2017-01-24 -- **Result**: hard work, need evidence of slowness first

### [#322 tag-thread in pager mode](https://github.com/neomutt/neomutt/issues/322)

Allow tagging of threads when in the pager

**Raised by** [@VinceTT](https://github.com/VinceTT) on 2017-01-24 -- **Result**: desired, no interest

### [#321 use a modern build system like cmake // refactor autotools toolchain](https://github.com/neomutt/neomutt/issues/321)

Replace autotools build system

**Raised by** [@toogley](https://github.com/toogley) on 2017-01-24 -- **Result**: easy, but too many potential problems for distros

### [#315 %F should display all participants](https://github.com/neomutt/neomutt/issues/315)

Display all the participants of an email in the index

**Raised by** [@guiniol](https://github.com/guiniol) on 2017-01-22 -- **Result**: no interest, wait for scripting?

### [#314 Thread summary instead of showing the first email when folded](https://github.com/neomutt/neomutt/issues/314)

Custom display of a folded collapsed thread

**Raised by** [@guiniol](https://github.com/guiniol) on 2017-01-22 -- **Result**: no interest, wait for scripting?

### [#309 Mouse support under terminals?](https://github.com/neomutt/neomutt/issues/309)

Support mouse clicks in the index, sidebar, etc

**Raised by** [@Chinggis6](https://github.com/Chinggis6) on 2017-01-20 -- **Result**: not too hard, low prority

### [#277 Subject separate from tree?](https://github.com/neomutt/neomutt/issues/277)

Create index_format expandos to display just the tree and just the subject

**Raised by** ([@iKarith](https://github.com/iKarith)) -- **Result**: desired, no interest

### [#273 Bindable command to unsubscribe from a mailing list](https://github.com/neomutt/neomutt/issues/273)

Command to (un)subscribe to/from mailing lists

**Raised by** [@nobrowser](https://github.com/nobrowser) on 2016-12-28 -- **Result**: non-trival, no interest

### [#265 influence which mail in a collapsed thread that is used to represent the thread](https://github.com/neomutt/neomutt/issues/265)

Pick an email to represent a collapsed thread

**Raised by** [@quite](https://github.com/quite) on 2016-12-08 -- **Result**: no interest, wait for scripting?

### [#254 Moving messages to trash is slow](https://github.com/neomutt/neomutt/issues/254)

Get IMAP to delete emails (move to trash)

**Raised by** [@darnir](https://github.com/darnir) on 2016-11-22 -- **Result**: desired, hard

### [#247 some highlighting rules leave an ugly box around the tree symbol](https://github.com/neomutt/neomutt/issues/247)

Colour bleeding due to NeoMutt's handling of colours.

**Raised by** [@qwence](https://github.com/qwence) on 2016-11-17 -- **Result**: repeatable, very hard to fix

### [#225 keywords patch and IMAP FLAGS?](https://github.com/neomutt/neomutt/issues/225)

Store keywords/tags in the IMAP flags

**Raised by** [@lrosenman](https://github.com/lrosenman) on 2016-11-08 -- **Result**: not a good idea, alternatives are being worked on

### [#213 Provide an alias for pgp_sign_as](https://github.com/neomutt/neomutt/issues/213)

Create an synonym for pgp_sign_as

**Raised by** [@agx](https://github.com/agx) on 2016-10-25 -- **Result**: no interest

### [#196 Feature: save-attach-hook](https://github.com/neomutt/neomutt/issues/196)

Choose attachment save dir by hook

**Raised by** [@RichiH](https://github.com/RichiH) on 2016-10-15 -- **Result**: desired, no interest

### [#194 ability to set attach-file starting directory and save-entry destination directory](https://github.com/neomutt/neomutt/issues/194)

Add options to configure attachment browser start dir

**Raised by** [@4nd3r](https://github.com/4nd3r) on 2016-10-11 -- **Result**: no interest, macro workaround

### [#192 different sorting for attachment browser](https://github.com/neomutt/neomutt/issues/192)

Create a separate sort option for the attachment browser

**Raised by** [@4nd3r](https://github.com/4nd3r) on 2016-10-11 -- **Result**: no interest

### [#171 Add placeholder to display the list of participants in a folded thread in index_format](https://github.com/neomutt/neomutt/issues/171)

When a thread is folded, display all the participants in the address field

**Raised by** [@guiniol](https://github.com/guiniol) on 2016-10-03 -- **Result**: desired, wait for scripting?

### [#150 Trash improvements](https://github.com/neomutt/neomutt/issues/150)

Better handling of deleted emails, modification of flags / headers

**Raised by** [@4nd3r](https://github.com/4nd3r) on 2016-09-18 -- **Result**: desired, hard

### [#131 notmuch: add modify-thread-labels](https://github.com/neomutt/neomutt/issues/131)

Extend the workflow of quasi-delete

**Raised by** [@guiniol](https://github.com/guiniol) on 2016-09-07 -- **Result**: no interest

### [#126 ignore / kill thread](https://github.com/neomutt/neomutt/issues/126)

All the user to mute (ignore/hide) all/part of a thread

**Raised by** [@kronat](https://github.com/kronat) on 2016-08-30 -- **Result**: desired, hard

### [#109 feature-request - make index_label take support pattern](https://github.com/neomutt/neomutt/issues/109)

Add a regex to the index_label color object

**Raised by** ([@antognolli](https://github.com/antognolli)) -- **Result**: no interest

### [#105 notmuch entire-thread outside a virtual folder](https://github.com/neomutt/neomutt/issues/105)

Locate all the messages in a thread of the given message

**Raised by** ([@a3nm](https://github.com/a3nm)) -- **Result**: no interest

### [#99 Add support for proxy](https://github.com/neomutt/neomutt/issues/99)

Let NeoMutt use a socks5 proxy

**Raised by** [@pickfire](https://github.com/pickfire) on 2016-08-12 -- **Result**: no interest

### [#98 Save or restricted sync](https://github.com/neomutt/neomutt/issues/98)

Partial synchronisation of mailbox changes

**Raised by** [@RichiH](https://github.com/RichiH) on 2016-08-11 -- **Result**: hard, not well-defined

### [#85 Neomutt true colors support](https://github.com/neomutt/neomutt/issues/85)

Allow full 24-bit (rgb) colours in Mutt

**Raised by** [@pickfire](https://github.com/pickfire) on 2016-07-22 -- **Result**: very hard

### [#83 Crash when using Torify and NeoMutt (Bug)](https://github.com/neomutt/neomutt/issues/83)

Using Torify causes NeoMutt to crash

**Raised by** [@flatcap](https://github.com/flatcap) on 2016-07-21 -- **Result**: feature disabled otherwise safe to use

### [#72 Get message-id after send](https://github.com/neomutt/neomutt/issues/72)

Extract message-id of last-sent email (when using command line)

**Raised by** [@ymuv](https://github.com/ymuv) on 2016-07-08 -- **Result**: not enough interest

### [#69 Option for robust macros with shell-escapes](https://github.com/neomutt/neomutt/issues/69)

Ideas to make macros more reliable and predictable

**Raised by** ([@scottkosty](https://github.com/scottkosty)) -- **Result**: desired, no interest

### [#67 Mailto handling](https://github.com/neomutt/neomutt/issues/67)

Handle mailto: links from external sources

**Raised by** [@cryptomaniac512](https://github.com/cryptomaniac512) on 2016-07-04 -- **Result**: hard to do portably

### [#64 using bright in index makes all index bright (Bug)](https://github.com/neomutt/neomutt/issues/64)

Colour bleeding due to NeoMutt's handling of colours.

**Raised by** [@4nd3r](https://github.com/4nd3r) on 2016-06-28 -- **Result**: repeatable, very hard to fix

### [#56 Vi-key bindings for mutt](https://github.com/neomutt/neomutt/issues/56)

Make NeoMutt more Vim-like

**Raised by** [@pickfire](https://github.com/pickfire) on 2016-06-20 -- **Result**: some bindings implemented, some changes to NeoMutt required for better emulation

### [#47 Rolling Releases (bleeding edge)](https://github.com/neomutt/neomutt/issues/47)

Distribute NeoMutt as a always-stable rolling release

**Raised by** [@flatcap](https://github.com/flatcap) on 2016-06-14 -- **Result**: hard to maintain, feature/bug-fix cadence adopted

### [#28 Patch Tree Proposal](https://github.com/neomutt/neomutt/issues/28)

Distribute NeoMutt as a set of feature patches

**Raised by** [@flatcap](https://github.com/flatcap) on 2016-05-20 -- **Result**: hard to maintain, no interest

### [#5 24bits (true color) support](https://github.com/neomutt/neomutt/issues/5)

Allow full 24-bit (rgb) colours in Mutt

**Raised by** [@timofonic](https://github.com/timofonic) on 2016-03-17 -- **Result**: very hard

### [#3 fuzzy address lookup](https://github.com/neomutt/neomutt/issues/3)

Allow Mutt to get its address book from an alternate source

**Raised by** [@257](https://github.com/257) on 2016-03-15 -- **Result**: hard

### [#2 send commands to remote instance](https://github.com/neomutt/neomutt/issues/2)

Be able to "drive" mutt from other programs, mailto:

**Raised by** [@257](https://github.com/257) on 2016-03-15 -- **Result**: hard, would require lots of work

