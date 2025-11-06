---
Title: Closed / Stalled Discussions
description: Closed and stalled discussions on GitHub
status: wip
---

# {{ page.description }}
{% include roadmap-links.html %}

NeoMutt is very popular and its users come up with lots of great new ideas.

## Downside

Unfortunately NeoMutt's development team is quite small, so they can't
implement everything.

Below is a list of the issues where either the developers have no interest in
or can't help with.

They are closed for now, but they can be re-opened if someone volunteers to do
the work. Help will be freely given to volunteers. Issues where the result is
hard to achieve are labeled with
[![difficulty-hard](/images/labels/difficulty-hard.svg)](https://github.com/neomutt/neomutt/issues?utf8=%E2%9C%93&q=label%3Adifficulty%3Ahard).
Please note, those hard issues are intentionally closed -- they are sometimes
demotivating due to its difficulty.

### [#741 add Memory Hole support to protect metadata][#741]

Encryption scheme that hides the subject.

: **Raised by** libBletchley -- **Result**: no interest

### [#678 Give line number to $editor with $edit_headers][#678]

Pass the line number to the editor, of the first line of the body.

: **Raised by** @qsuscs -- **Result**: no interest

### [#658 feature request: using $my_vars in macro \<shell-escape\>'s][#658]

Expand config variables in shell command lines

: **Raised by** @demure -- **Result**: hard, may be possible in future using lua

### [#587 Better support for multipart/alternative?][#587]

Allow better nesting of mime parts

: **Raised by** @mrzool -- **Result**: desired, no interest

### [#550 PR: Show alternating padding in help menus][#550]

Show lines of dots in rows in the help page to assist reading.

: **Raised by** @somini -- **Result**: hard, need better colour support in help

### [#535 Could '^g' be remapped?][#535]

Allow the 'abort' key to be remapped

: **Raised by** @Alok -- **Result**: no interest

### [#504 imap: Mutt should handle dropped connections/routing problems gracefully.][#504]

Make IMAP able to handle dropped connections

: **Raised by** @toogley -- **Result**: desired, hard

### [#469 Wish: more intelligent pasting][#469]

Respect the escape sequences for bracked paste mode

: **Raised by** @phmarek -- **Result**: no interest

### [#468 Stop asking for "Exit Mutt?"][#468]

Copy vim: don't try to exit on Ctrl-C, but tell the user what they need to know

: **Raised by** @tdehaeze -- **Result**: desired, no interest

### [#467 Use cp1252 instead of iso-8859-1][#467]

Workaround some bad mailers sending cp1252 chars as iso-8859-1

: **Raised by** @gahr on 2017-03-14 -- **Result**: low risk, charset-hook workaround

### [#464 Limit or search by alias][#464]

Add the ability to limit, or search, the index by an alias

: **Raised by** @mingsu -- **Result**: no interest

### [#404 Use of gpg's group option][#404]

Use a GPG feature to allow encrypting to groups

: **Raised by** @Polichronucci on 2017-02-17 -- **Result**: no interest

### [#394 syntax highlighting inside mails][#394]

Allow flexible highlighting of emails

: **Raised by** @toogley on 2017-02-13 -- **Result**: hard due to mutt's colour handling

### [#367 imap4 partial fetch request][#367]

Save bandwidth by only fetching a section of the index

: **Raised by** @rusnasonov on 2017-02-07 -- **Result**: desired, hard

### [#355 Danger: DMARC about to kill mailing list experience][#355]

Mailing lists don't play well with DMARC

: **Raised by** @nobrowser on 2017-02-02 -- **Result**: not much we can do

### [#324 hcache: keep multiple mailbox caches open concurrently][#324]

Keep multiple hcache files open

: **Raised by** @sassmann on 2017-01-24 -- **Result**: hard work, need evidence of slowness first

### [#322 tag-thread in pager mode][#322]

Allow tagging of threads when in the pager

: **Raised by** @VinceTT on 2017-01-24 -- **Result**: desired, no interest

### [#321 use a modern build system like cmake // refactor autotools toolchain][#321]

Replace autotools build system

: **Raised by** @toogley on 2017-01-24 -- **Result**: easy, but too many potential problems for distros

### [#315 %F should display all participants][#315]

Display all the participants of an email in the index

: **Raised by** @guiniol on 2017-01-22 -- **Result**: no interest, wait for scripting?

### [#314 Thread summary instead of showing the first email when folded][#314]

Custom display of a folded collapsed thread

: **Raised by** @guiniol on 2017-01-22 -- **Result**: no interest, wait for scripting?

### [#309 Mouse support under terminals?][#309]

Support mouse clicks in the index, sidebar, etc

: **Raised by** @Chinggis6 on 2017-01-20 -- **Result**: not too hard, low priority

### [#294 Have the keymap functions accept arguments][#294]

Allow some functions to accept arguments, e.g. `:exec shell-escape "uname -a"`

: **Raised by** @guyzmo -- **Result**: desired, no interest

### [#277 Subject separate from tree?][#277]

Create index_format expandos to display just the tree and just the subject

: **Raised by** @iKarith -- **Result**: desired, no interest

### [#273 Bindable command to unsubscribe from a mailing list][#273]

Command to (un)subscribe to/from mailing lists

: **Raised by** @nobrowser on 2016-12-28 -- **Result**: non-trivial, no interest

### [#265 influence which mail in a collapsed thread that is used to represent the thread][#265]

Pick an email to represent a collapsed thread

: **Raised by** @quite on 2016-12-08 -- **Result**: no interest, wait for scripting?

### [#254 Moving messages to trash is slow][#254]

Get IMAP to delete emails (move to trash)

: **Raised by** @darnir on 2016-11-22 -- **Result**: desired, hard

### [#247 some highlighting rules leave an ugly box around the tree symbol][#247]

Colour bleeding due to NeoMutt's handling of colours.

: **Raised by** @qwence on 2016-11-17 -- **Result**: repeatable, very hard to fix

### [#225 keywords patch and IMAP FLAGS?][#225]

Store keywords/tags in the IMAP flags

: **Raised by** @lrosenman on 2016-11-08 -- **Result**: not a good idea, alternatives are being worked on

### [#213 Provide an alias for pgp_sign_as][#213]

Create an synonym for pgp_sign_as

: **Raised by** @agx on 2016-10-25 -- **Result**: no interest

### [#196 Feature: save-attach-hook][#196]

Choose attachment save dir by hook

: **Raised by** @RichiH on 2016-10-15 -- **Result**: desired, no interest

### [#194 ability to set attach-file starting directory and save-entry destination directory][#194]

Add options to configure attachment browser start dir

: **Raised by** @4nd3r on 2016-10-11 -- **Result**: no interest, macro workaround

### [#192 different sorting for attachment browser][#192]

Create a separate sort option for the attachment browser

: **Raised by** @4nd3r on 2016-10-11 -- **Result**: no interest

### [#171 Add placeholder to display the list of participants in a folded thread in index_format][#171]

When a thread is folded, display all the participants in the address field

: **Raised by** @guiniol on 2016-10-03 -- **Result**: desired, wait for scripting?

### [#150 Trash improvements][#150]

Better handling of deleted emails, modification of flags / headers

: **Raised by** @4nd3r on 2016-09-18 -- **Result**: desired, hard

### [#149 Feature request: crypt-autoselectkey][#149]

Add variable crypt_autoselectkey, which allows forcing neomutt to autoselect a
key when only (a trusted) one is available in the "PGP keys matching ..." menu.

: **Raised by** @dannyob -- **Result**: desired, no interest

### [#131 notmuch: add modify-thread-labels][#131]

Extend the workflow of quasi-delete

: **Raised by** @guiniol on 2016-09-07 -- **Result**: no interest

### [#126 ignore / kill thread][#126]

All the user to mute (ignore/hide) all/part of a thread

: **Raised by** kronat on 2016-08-30 -- **Result**: desired, hard

### [#109 feature-request - make index_label take support pattern][#109]

Add a regex to the index_label color object

: **Raised by** @antognolli -- **Result**: no interest

### [#105 notmuch entire-thread outside a virtual folder][#105]

Locate all the messages in a thread of the given message

: **Raised by** @a3nm -- **Result**: no interest

### [#99 Add support for proxy][#99]

Let NeoMutt use a socks5 proxy

: **Raised by** @pickfire on 2016-08-12 -- **Result**: no interest

### [#98 Save or restricted sync][#98]

Partial synchronisation of mailbox changes

: **Raised by** @RichiH on 2016-08-11 -- **Result**: hard, not well-defined

### [#93 Open attachments in the background][#93]

Fork a new process to avoid NeoMutt waiting for an attachment viewer

: **Raised by** @RichiH -- **Result**: desired, too busy

### [#85 NeoMutt true colors support][#85]

Allow full 24-bit (rgb) colours in Mutt

: **Raised by** @pickfire on 2016-07-22 -- **Result**: very hard

### [#83 Crash when using Torify and NeoMutt (Bug)][#83]

Using Torify causes NeoMutt to crash

: **Raised by** @flatcap on 2016-07-21 -- **Result**: feature disabled otherwise safe to use

### [#72 Get message-id after send][#72]

Extract message-id of last-sent email (when using command line)

: **Raised by** @ymuv on 2016-07-08 -- **Result**: not enough interest

### [#69 Option for robust macros with shell-escapes][#69]

Ideas to make macros more reliable and predictable

: **Raised by** @scottkosty -- **Result**: desired, no interest

### [#67 Mailto handling][#67]

Handle mailto: links from external sources

: **Raised by** cryptomaniac512 on 2016-07-04 -- **Result**: hard to do portably

### [#64 using bright in index makes all index bright (Bug)][#64]

Colour bleeding due to NeoMutt's handling of colours.

: **Raised by** @4nd3r on 2016-06-28 -- **Result**: repeatable, very hard to fix

### [#56 Vi-key bindings for mutt][#56]

Make NeoMutt more Vim-like

: **Raised by** @pickfire on 2016-06-20 -- **Result**: some bindings implemented, some changes to NeoMutt required for better emulation

### [#47 Rolling Releases (bleeding edge)][#47]

Distribute NeoMutt as a always-stable rolling release

: **Raised by** @flatcap on 2016-06-14 -- **Result**: hard to maintain, feature/bug-fix cadence adopted

### [#28 Patch Tree Proposal][#28]

Distribute NeoMutt as a set of feature patches

: **Raised by** @flatcap on 2016-05-20 -- **Result**: hard to maintain, no interest

### #5 24bits (true color) support

Allow full 24-bit (rgb) colours in Mutt

: **Raised by** timofonic on 2016-03-17 -- **Result**: very hard

### [#3 fuzzy address lookup][#3]

Allow Mutt to get its address book from an alternate source

: **Raised by** @257 on 2016-03-15 -- **Result**: hard

### [#2 send commands to remote instance][#2]

Be able to "drive" mutt from other programs, mailto:

: **Raised by** @257 on 2016-03-15 -- **Result**: hard, would require lots of work


[#741]: <https://github.com/neomutt/neomutt/issues/741>
[#678]: <https://github.com/neomutt/neomutt/issues/678>
[#658]: <https://github.com/neomutt/neomutt/issues/658>
[#587]: <https://github.com/neomutt/neomutt/issues/587>
[#550]: <https://github.com/neomutt/neomutt/issues/550>
[#535]: <https://github.com/neomutt/neomutt/issues/535>
[#504]: <https://github.com/neomutt/neomutt/issues/504>
[#469]: <https://github.com/neomutt/neomutt/issues/469>
[#468]: <https://github.com/neomutt/neomutt/issues/468>
[#467]: <https://github.com/neomutt/neomutt/issues/467>
[#464]: <https://github.com/neomutt/neomutt/issues/464>
[#404]: <https://github.com/neomutt/neomutt/issues/404>
[#394]: <https://github.com/neomutt/neomutt/issues/394>
[#367]: <https://github.com/neomutt/neomutt/issues/367>
[#355]: <https://github.com/neomutt/neomutt/issues/355>
[#324]: <https://github.com/neomutt/neomutt/issues/324>
[#322]: <https://github.com/neomutt/neomutt/issues/322>
[#321]: <https://github.com/neomutt/neomutt/issues/321>
[#315]: <https://github.com/neomutt/neomutt/issues/315>
[#314]: <https://github.com/neomutt/neomutt/issues/314>
[#309]: <https://github.com/neomutt/neomutt/issues/309>
[#294]: <https://github.com/neomutt/neomutt/issues/294>
[#277]: <https://github.com/neomutt/neomutt/issues/277>
[#273]: <https://github.com/neomutt/neomutt/issues/273>
[#265]: <https://github.com/neomutt/neomutt/issues/265>
[#254]: <https://github.com/neomutt/neomutt/issues/254>
[#247]: <https://github.com/neomutt/neomutt/issues/247>
[#225]: <https://github.com/neomutt/neomutt/issues/225>
[#213]: <https://github.com/neomutt/neomutt/issues/213>
[#196]: <https://github.com/neomutt/neomutt/issues/196>
[#194]: <https://github.com/neomutt/neomutt/issues/194>
[#192]: <https://github.com/neomutt/neomutt/issues/192>
[#171]: <https://github.com/neomutt/neomutt/issues/171>
[#150]: <https://github.com/neomutt/neomutt/issues/150>
[#149]: <https://github.com/neomutt/neomutt/issues/149>
[#131]: <https://github.com/neomutt/neomutt/issues/131>
[#126]: <https://github.com/neomutt/neomutt/issues/126>
[#109]: <https://github.com/neomutt/neomutt/issues/109>
[#105]: <https://github.com/neomutt/neomutt/issues/105>
[#99]: <https://github.com/neomutt/neomutt/issues/99>
[#98]: <https://github.com/neomutt/neomutt/issues/98>
[#93]: <https://github.com/neomutt/neomutt/issues/93>
[#85]: <https://github.com/neomutt/neomutt/issues/85>
[#83]: <https://github.com/neomutt/neomutt/issues/83>
[#72]: <https://github.com/neomutt/neomutt/issues/72>
[#69]: <https://github.com/neomutt/neomutt/issues/69>
[#67]: <https://github.com/neomutt/neomutt/issues/67>
[#64]: <https://github.com/neomutt/neomutt/issues/64>
[#56]: <https://github.com/neomutt/neomutt/issues/56>
[#47]: <https://github.com/neomutt/neomutt/issues/47>
[#28]: <https://github.com/neomutt/neomutt/issues/28>
[#3]: <https://github.com/neomutt/neomutt/issues/3>
[#2]: <https://github.com/neomutt/neomutt/issues/2>

