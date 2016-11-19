---
layout: concertina
distro: Gentoo
icon: gentoo.png
homepage: https://packages.gentoo.org/packages/mail-client/mutt
title: NeoMutt for Gentoo
maintainer: grobian
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

Fabian has added some of the NeoMutt features to the Mutt install. We’re
working together to add more.  Gentoo's Mutt is not exactly NeoMutt for
this reason.

## Installation <a class="offset" id="install"></a>

```
# emerge -av mail-client/mutt
```

```reply
[ebuild   N    ] mail-client/mutt-1.7.1-r3  USE="berkdb crypt doc gpg imap mbox nls nntp sasl smime smtp ssl -debug -gdbm (-gnutls) -idn -kerberos -libressl -notmuch -pop -qdbm (-selinux) -sidebar -slang -tokyocabinet -vanilla" 3.9 MiB

Total: 1 package (1 reinstall), Size of downloads: 3.9 MiB

Would you like to merge these packages? [Yes/No]
```

Have a good look at the USE-flags, such that you enable the features you need,
such as imap, ssmtp, etc.

## Update <a class="offset" id="update"></a>

```
emerge -auv mail-client/mutt
```

## Removal <a class="offset" id="remove"></a>

```
emerge -av --depclean mail-client/mutt
```

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.


Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).

