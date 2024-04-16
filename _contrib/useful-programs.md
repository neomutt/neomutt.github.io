---
title: Useful Programs
description: List of useful programs interacting with Mutt
author: Tobias Angele
username: toogley
status: stable
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

## Mail downloading and sending

* [offlineimap](https://github.com/OfflineIMAP/offlineimap) -- read/sync your
  IMAP mailboxes
* [imapfw](https://github.com/OfflineIMAP/imapfw) -- simple and powerful
  framework to work with mails, successor of OfflineIMAP
* [fdm](https://github.com/nicm/fdm) -- fetch mail from POP3 or IMAP servers,
  or receive local mail from stdin, and deliver it
* [getmail](http://pyropus.ca/software/getmail/) -- simple mail retrieval agent
  intended as a replacement for fetchmail. Support for IMAP4, POP3 and SSL
* [msmtp](http://msmtp.sourceforge.net/) -- is an SMTP client, supports
  multiple accounts, TLS/SSL, IDN, DSN and SOCKS Proxy.
* [isync](http://isync.sourceforge.net/) -- may be better than Mutt with IMAP
  header caching.
* [maildrop](http://www.courier-mta.org/maildrop/) -- mail delivery agent with
  filtering abilities
* [postfix](http://www.postfix.org/) -- a Wietse Venema's mail server that
  started life at IBM research as an alternative to the widely-used Sendmail
  program. Now at Google, Wietse continues to support Postfix.
* [lieer](https://github.com/gauteh/lieer) -- can pull email and labels
  (and changes to labels) from your GMail account and store them locally
  in a maildir with the labels synchronized with a notmuch database.
  The changes to tags in the notmuch database may be pushed back remotely
  to your GMail account.

## Address books

See also: [external address queries](/guide/advancedusage.html#query).

* [mail-query](https://github.com/pbrisbin/mail-query) to query addresses found
  in the inbox
* [notmuch-addrlookup](https://github.com/aperezdc/notmuch-addrlookup-c) to query adresses
  indexed by notmuch
* [khard](https://github.com/scheibler/khard) to synchronize address books
  between your PC and mobile device with
  [vdirsyncer](https://github.com/untitaker/vdirsyncer).
* [notmuch-abook](https://github.com/guyzmo/notmuch-abook) -- Notmuch address
  book manager for Vim
* [goobook](https://pypi.python.org/pypi/goobook) -- search your Google
  Contacts from the command line or Mutt.
* [abook](http://abook.sourceforge.net/) -- text-based address book program
* [mutt-addressbook](https://pypi.python.org/pypi/mutt-addressbook) -- extend
  Mutt's query command using LDAP directories
* [mates](https://github.com/pimutils/mates.rs) -- a very simple, highly
  extensible command line address book

* [mutt_ldap_query.pl](https://github.com/namato/dotfiles/blob/e7ce282c8883dd1971356a0ea53c75b47105c8fa/scripts/ldap.pl) to query LDAP contacts (useful as a mutt `$query_tool`)
* [mutt-ldap.py](https://github.com/Konfekt/mutt-ldap) to query LDAP contacts (useful as a mutt `$query_tool`)

## Tagging, filtering, searching

* [afew](https://github.com/afewmail/afew) -- initial tagging script for
  Notmuch mail
* [notmuch](https://notmuchmail.org/) -- is a mail indexer. Essentially, is
  a very thin front end on top of Xapian. It provides Python, Vim, and Emacs
  bindings.
* [spamassassin](https://spamassassin.apache.org/) -- Spam-filtering tool, uses
  a variety of spam-detection techniques, including DNS-based and
  fuzzy-checksum-based spam detection, Bayesian filtering, external programs,
  blacklists and online databases.
* [procmail](https://wiki.archlinux.org/index.php/Procmail) -- can sort
  incoming mail into various directories and filter out spam messages. Procmail
  is stable, but no longer maintained.
* [mairix](http://www.rpcurnow.force9.co.uk/mairix/) -- an excellent mailbox
  searching tool for Mutt. Unmaintained.
* [nmzmail](http://flpsed.org/nmzmail.html) -- another excellent mailbox
  searching tool for Mutt.
* [bogofilter](http://bogofilter.sourceforge.net/) -- mail filter that
  classifies mail as spam or ham (non-spam) by a statistical analysis of the
  message's header and content (body). The program is able to learn from the
  user's classifications and corrections.

## Encryption

* [passwordstore.org](https://www.passwordstore.org/) -- password management
  tool which tries to be simple and follow the Unix philosophy.
* [GPG, GnuPG](https://www.gnupg.org/) -- GNU's Privacy Guard, a free (FOSS)
  replacement for PGP.

## Converting text formats

* [lesspipe.sh](https://github.com/wofr06/lesspipe) a universal terminal reader for any
  file format. To use it in `mutt`, add
  ```
  autoview text/* application/* image/* audio/*
  ```
  to your `.muttrc` and
  ```
  text/*;                           LESSQUIET=1 lesspipe.sh '%s'; copiousoutput
  application/*;                    LESSQUIET=1 lesspipe.sh '%s'; copiousoutput
  image/*;                          LESSQUIET=1 lesspipe.sh '%s'; copiousoutput
  audio/*;                          LESSQUIET=1 lesspipe.sh '%s'; copiousoutput
  ```
  to the file given by the value of `mailcap_path`.
* [plainMail2HTML](https://github.com/amitramon/plainMail2HTML) --
  plainMail2HTML enables users of Mutt (and possibly other textual Email clients)
  to send HTML-formatted Emails.
* [antiword](http://www.winfield.demon.nl/) -- Microsoft Word to TXT converter.
* [rtf2html](https://www.wagner.pp.ru/~vitus/software/catdoc/) -- RTF to HTML
  converter (which then can be piped through `lynx -stdin -dump -force_html`).
* [pandoc](https://pandoc.org/) -- is a Haskell library for converting from one
  markup format to another, and a command line tool that uses this library.
* [xlhtml](http://chicago.sourceforge.net/xlhtml/) -- Microsoft
  Excel/PowerPoint to HTML converter, see rtf2html.

## Grabbing URLs

* [urlview](https://github.com/sigpipe/urlview) -- extract URLs from a text
  file and allow the user to select via a menu
* [urlscan](https://github.com/firecat53/urlscan) -- Mutt and terminal URL
  selector (similar to urlview)
* [extract_url](https://www.memoryhole.net/~kyle/extract_url/) -- a Perl script
  that extracts URLs from correctly-encoded MIME email messages or plain text.

## Calendar Tools

* [mutt-ics](https://github.com/dmedvinsky/mutt-ics) -- simple viewer for .ics
  files in Mutt
* [mutt-ical](https://github.com/Konfekt/mutt-ical) to reply to invitations (sent as .ics file)
* [vcalendar-filter](https://github.com/terabyte/mutt-filters/blob/master/vcalendar-filter)
  to view calendar files (ics)
* [mutt2khal](https://github.com/pimutils/khal/blob/master/misc/mutt2khal) for
  passing calendar items to the command-line calendar
  [khal](https://github.com/pimutils/khal),
* [vkhal](https://github.com/nofeed/vkhal/) -- can display calendar items and
  import them into khal

## Miscellaneous

* [muttprint](http://muttprint.sourceforge.net/)
* [notifynotmuch](https://github.com/kspi/notifymuch) -- displays desktop
  notifications for unread mail in Notmuch database
* [notify-osd](https://launchpad.net/notify-osd) -- Canonical's
  on-screen-display notification agent \\
  The desktop notifications framework provides a standard way of doing passive
  pop-up notifications on the Linux desktop. These are designed to notify the
  user of something without interrupting their work with a dialog box that they
  must close. Passive pop-ups can automatically disappear after a short period
  of time.
* [ayatana-webmail](https://github.com/AyatanaIndicators/ayatana-webmail) - A
  desktop Notification daemon that can watch imap mailboxes using `IDLE`. Can
  also run sync commands when a new message arrives.
* [mutt-vid](https://gitlab.com/protist/mutt-vid) -- manage multiple sender
  accounts in Mutt
* [mutt-trim](https://github.com/Konfekt/mutt-trim) to unclutter and normalize
  quoted text in an e-mail
* [mailto-mutt](https://dset0x.github.io/mailto-mutt.html)
* [mailto-mutt](https://github.com/pazz/scripts/blob/master/mailto-mutt)
* [MailtoMutt?](http://mailtomutt.sourceforge.net/) -- a Cocoa application
  which handles mail to URLs, forwarding them to Mutt using AppleScript and
  Terminal.app.
* [post mode](http://post-mode.sourceforge.net/) -- an Emacs mode for composing
  email or Usenet messages for an external user agent (Mutt, slrn, etc.).
* [t-prot](http://www.escape.de/users/tolot/mutt/) -- a program to clean up
  various email problems (long signatures, incorrect quoting, etc.).
* [mswatch](http://mswatch.sourceforge.net/) use with isync to sync local and
  server IMAP stores to track changes as they happen.
* [muttzilla](https://sourceforge.net/projects/muttzilla/) -- make Mutt your
  mail reader in Netscape or Mozilla. Unmaintained.

## Vim Plugins

- [vim-mutt-aliases](https://github.com/Konfekt/vim-mutt-aliases/) to complete mail aliases in Vim
- [mutt-query-complete.vim](https://github.com/Konfekt/mutt-query-complete.vim) to complete mail addresses provided by the mutt `$query_tool` in Vim such as`notmuch address` or [mutt-ldap.py](https://github.com/wberrier/mutt-ldap)
- [vim-notmuch-addrlookup](https://github.com/Konfekt/vim-notmuch-addrlookup) to complete mail addresses indexed by [notmuch](https://notmuchmail.org).
- [vim-notmuch-address](https://github.com/adborden/vim-notmuch-address) -- to complete mail addresses in Vim


## Setup

- [Konfekt's mailcap file](https://gist.github.com/Konfekt/9797372146e65a70a44c1e24a35ae0a2) 
  (read by NeoMutt to determine how to display non-text files.)
- [Muttrc snippet](https://gist.github.com/Konfekt/acce52d3b0283f0c357125ddee2bb2e8/) 
  to view mail from Mutt in GUI Browser or E-Mail client under Windows (Subsystem for Linux) 

*[.ics]: Internet Calendaring and Scheduling (iCalendar)
*[DNS]: Domain Name System
*[DSN]: Delivery Status Notification
*[FOSS]: Free and Open Source Software
*[HTML]: Hyper Text Markup Language
*[IDN]: Internationalized Domain Names
*[IMAP4]: Internet Message Access Protocol version 4
*[IMAP]: Internet Message Access Protocol
*[LDAP]: Lightweight Directory Access Protocol
*[MIME]: Multipurpose Internet Mail Extensions
*[PGP]: Pretty Good Privacy
*[POP3]: Post Office Protocol, version 3
*[POP]: Post Office Protocol
*[RTF]: Rich Text Format
*[SMTP]: Simple Mail Transfer Protocol
*[SOCKS]: Socket Secure (Internet Protocol)
*[SSL]: Secure Sockets Layer
*[TLS]: Transport Layer Security
*[URL]: Uniform Resource Locator
*[URLs]: Uniform Resource Locator
