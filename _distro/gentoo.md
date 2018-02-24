---
layout: concertina
distro: Gentoo
icon: gentoo.png
homepage: https://packages.gentoo.org/packages/mail-client/neomutt
title: NeoMutt for Gentoo
maintainer: grobian
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

Ebuilds for NeoMutt can be found in the gentoo\_neomutt overlay. These ebuilds
are similar, but not equal to the mail&#x2011;client&#x2060;/&#x2060;mutt
ebuilds in Gentoo. You need to add the overlay to your repos.conf first.

## Checking out the overlay <a class="offset" id="checkout"></a>

You can check the overlay out in any place, you like, for this example, we use
/usr/local/portage/neomutt:

```
# mkdir -p /usr/local/portage/neomutt
# cd /usr/local/portage/neomutt
# git clone https://github.com/neomutt/gentoo-neomutt .
```

## Adding the NeoMutt overlay <a class="offset" id="overlay"></a>

See
[Gentoo Wiki on /etc/portage/repos.conf](https://wiki.gentoo.org/wiki//etc/portage/repos.conf)
to add the following to repos.conf:

```
[neomutt_gentoo]
location = /usr/local/portage/neomutt
masters = gentoo
auto-sync = no
```

## Installation <a class="offset" id="install"></a>

```
# emerge -av mail-client/neomutt
```

```reply
[ebuild   N    ] mail-client/neomutt-20161126::gentoo_neomutt  USE="berkdb crypt doc gpg imap mbox nls nntp sasl smime smtp ssl -debug -gdbm (-gnutls) -idn -kerberos -libressl -notmuch -pop -qdbm (-selinux) -sidebar -slang -tokyocabinet" 3.9 MiB

Total: 1 package (1 reinstall), Size of downloads: 3.9 MiB

Would you like to merge these packages? [Yes/No]
```

Have a good look at the USE-flags, such that you enable the features you need,
such as _imap_, _smtp_, etc.

## Update <a class="offset" id="update"></a>

```
emerge -auv mail-client/neomutt
```

## Removal <a class="offset" id="remove"></a>

```
emerge -av --depclean mail-client/neomutt
```

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code, or you can use the Gentoo live ebuild
(neomutt-99999999). Add `mail-client/neomutt-99999999 **` to your
/etc/portage/package.accept\_keywords to enable it.

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

