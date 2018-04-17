---
layout: concertina
distro: Gentoo
icon: gentoo.png
homepage: https://packages.gentoo.org/packages/mail-client/neomutt
title: NeoMutt for Gentoo
maintainer: nicolasbock
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

Ebuilds for NeoMutt can be found in the main gentoo repo.  There used
to be an overlay, but it has been deprecated.  If you still have it in
your config, remove it from `/etc/portage/repos.conf`.

## Installation <a id="install"></a>

```
# emerge -av mail-client/neomutt
```

```reply
[ebuild   R    ] mail-client/neomutt-20171215-r2::gentoo  USE="doc gpg idn kerberos lmdb nls slang smime ssl -berkdb -crypt -gdbm -gnutls -gpgme -kyotocabinet -libressl -notmuch -pgp_classic -qdbm -sasl (-selinux) -smime_classic -tokyocabinet" 0 KiB

Total: 1 package (1 reinstall), Size of downloads: 0 KiB

Would you like to merge these packages? [Yes/No]
```

Have a good look at the USE-flags, such that you enable the features you need,
such as _gpgme_, _lmdb_, etc.

## Update <a id="update"></a>

```
emerge -auv mail-client/neomutt
```

## Removal <a id="remove"></a>

```
emerge -av --depclean mail-client/neomutt
```

## Building from Source <a id="build"></a>

In Gentoo, you will likely already have build NeoMutt from source.  If
you want the latest version from the Git repository, install the
`=mail-client/neomutt-9999` version.  Add `=mail-client/neomutt-9999
**` to your `/etc/portage/package.accept\_keywords` to enable it.

## Debugging <a id="debug"></a>

Follow the [instructions in the Gentoo
wiki](https://wiki.gentoo.org/wiki/Debugging) to build NeoMutt with
debug symbols.

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

