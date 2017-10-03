---
layout: concertina
title: Useful Programs
description: List of useful programs interacting with Mutt
author: Tobias Angele
username: toogley
status: stable
dir: "&mdash;"
---

# {{ page.title }}

{{ page.description }}

## Mail downloading and sending

* [offlineimap](https://github.com/OfflineIMAP/offlineimap) -- Read/Sync your
  IMAP mailboxes
* [imapfw](https://github.com/OfflineIMAP/imapfw) -- simple and powerful
  framework to work with mails, successor of OfflineIMAP
* [fdm](https://github.com/nicm/fdm) -- fetch mail from POP3 or IMAP servers,
  or receive local mail from stdin, and deliver it
* [getmail](http://pyropus.ca/software/getmail/) -- simple mail retrieval agent
  intended as a replacement for fetchmail. Support for IMAP4, POP3 and SSL
* [msmtp](http://msmtp.sourceforge.net/) -- is an SMTP client, supports
  multiple accounts, TLS/SSL, IDN, Delivery Status Notification and SOCKS
  Proxy.
* [isync](http://isync.sourceforge.net/) -- may be better than Mutt with IMAP
  header caching.
* [maildrop](http://www.courier-mta.org/maildrop/) -- mail delivery agent with
  filtering abilities
* [postfix](http://www.postfix.org/) -- It is Wietse Venema's mail server that
  started life at IBM research as an alternative to the widely-used Sendmail
  program. Now at Google, Wietse continues to support Postfix.

## Address books

* [ppl](http://ppladdressbook.org/) -- decentralized command line address book
* [notmuch-abook](https://github.com/guyzmo/notmuch-abook) -- Notmuch address
  book manager for Vim
* [goobook](https://pypi.python.org/pypi/goobook/1.9) -- Search your Google
  Contacts from the command line or Mutt.
* [abook](http://abook.sourceforge.net/) -- Text-based address book program
* [mutt-addressbook](https://pypi.python.org/pypi/mutt-addressbook) -- Extend
  Mutt's query command using LDAP directories
* [mates](https://github.com/pimutils/mates.rs) -- A very simple, highly
  extensible command line address book

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
* [mairix](http://www.rpcurnow.force9.co.uk/mairix/) -- An excellent mailbox
  searching tool for Mutt. Unmaintained.
* [nmzmail](http://flpsed.org/nmzmail.html) -- Another excellent mailbox
  searching tool for Mutt.
* [bogofilter](http://bogofilter.sourceforge.net/) -- mail filter that
  classifies mail as spam or ham (non-spam) by a statistical analysis of the
  message's header and content (body). The program is able to learn from the
  user's classifications and corrections.

## Encryption

* [passwordstore.org](https://www.passwordstore.org/) Password management tool
  which tries to be simple and follow the Unix philosophy.
* [GPG, GnuPG](http://www.gnupg.org/) -- GNU's privacy guard, a free (FOSS)
  replacement for PGP.

## Converting text formats

* [antiword](http://www.winfield.demon.nl/) -- Microsoft Word to txt converter.
* [rtf2html](http://www.wagner.pp.ru/~vitus/software/catdoc/) -- RTF to HTML
  converter (which then can be piped through `lynx -stdin -dump -force_html`).
* [pandoc](http://pandoc.org/) -- Pandoc is a Haskell library for converting
  from one markup format to another, and a command line tool that uses this
  library.
* [xlhtml](http://chicago.sourceforge.net/xlhtml/) -- Microsoft
  Excel/PowerPoint to HTML converter, see rtf2html.

## Grabbing URLs

* [urlview](https://github.com/sigpipe/urlview) -- Extract URLs from a text
  file and allow the user to select via a menu
* [urlscan](https://github.com/firecat53/urlscan) -- Mutt and terminal URL
  selector (similar to urlview)
* [extract_url](http://www.memoryhole.net/~kyle/extract_url/) -- This is a Perl
  script that extracts URLs from correctly-encoded MIME email messages or plain
  text.

## Miscellaneous

* [notifynotmuch](https://github.com/kspi/notifymuch)
* [notify-osd](https://launchpad.net/notify-osd) -- The Desktop Notifications
  framework provides a standard way of doing passive pop-up notifications on
  the Linux desktop. These are designed to notify the user of something without
  interrupting their work with a dialog box that they must close. Passive
  popups can automatically disappear after a short period of time.
* [mutt-vid](https://github.com/protist/mutt-vid) -- Manage multiple sender
  accounts in Mutt
* [mutt-ics](https://github.com/dmedvinsky/mutt-ics) -- Simple viewer for .ics
  files in Mutt
* [muttprint](http://muttprint.sourceforge.net/)
* [mailto-mutt](https://dset0x.github.io/mailto-mutt.html)
* [mailto-mutt](https://github.com/pazz/scripts/blob/master/mailto-mutt)
* [MailtoMutt?](http://mailtomutt.sourceforge.net/) -- A Cocoa application
  which handles mail to URLs, forwarding them to Mutt using AppleScript and
  Terminal.app.
* [post mode](http://post-mode.sourceforge.net/) -- An Emacs mode for composing
  email or USENET messages for an external user agent (Mutt, slrn, etc.).
* [t-prot](http://www.escape.de/users/tolot/mutt/) -- A program to clean up
  various email problems (long signatures, incorrect quoting, etc.).
* [mswatch](http://mswatch.sourceforge.net/) use with isync to sync local and
  server IMAP stores to track changes as they happen.
* [muttzilla](http://sourceforge.net/projects/muttzilla/) -- Make Mutt your
  mail reader in Netscape or Mozilla. Unmaintained.

