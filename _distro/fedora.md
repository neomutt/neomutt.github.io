---
distro: Fedora
icon: fedora.png
homepage: https://bodhi.fedoraproject.org/updates/?packages=neomutt
title: NeoMutt for Fedora
maintainer: flatcap
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

| Fedora       | Support                     |
| :----------- | :-------------------------- |
| 37 or before | Unsupported, please upgrade |
| 38           | Supported                   |
| 39           | Supported                   |
| Rawhide      | Supported                   |

## Installation <a id="install"></a>

The instructions work for all versions of Fedora.
The commands should be run as root, or prefixed with `sudo`.

```
dnf install neomutt
```

You may be asked to install a GPG key for the extra packages.
Say **yes**.  This step only has to be done once -- for the first install.

```reply
Importing GPG key 0xEB10B464:
 Userid     : "Fedora (38) <fedora-38-primary@fedoraproject.org>"
 Fingerprint: 6A51 BBAB BA3D 5467 B617 1221 809A 8D7C EB10 B464
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-38-x86_64
Is this ok [y/N]:
```

Well done! You've just installed NeoMutt.

- **Learn more about NeoMutt**: [browse our website](https://neomutt.org)
- **Latest news**: Subscribe to our [RSS feed](https://neomutt.org/feed.xml)
  or our mailing lists for
  [NeoMutt Users](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)
- **Talk to the developers**: Join our IRC channel: #neomutt on
  irc.libera.chat or the
  [NeoMutt Developers](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)
  mailing list

## NeoMutt COPR Install

For years, this was the way to install NeoMutt.
Now that NeoMutt is available to Fedora directly, the COPR install has been deprecated.

If you previously installed NeoMutt from the COPR, you can disable it by running:

```
dnf copr remove flatcap/neomutt
```

## Update <a id="update"></a>

Once NeoMutt is installed, it will be updated automatically when you perform
system updates. You can make that happen sooner by running:

```
dnf update
```

## Removal <a id="remove"></a>

To completely remove NeoMutt from your system:

```
dnf remove neomutt
```

## Building from source <a id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.

1. The best way to get the latest source code is to use `git`.
2. Minimum tools you need to build NeoMutt
3. Generate the documentation
4. Advanced features of NeoMutt
5. Local caching of emails

```
dnf install cyrus-sasl-devel docbook-dtds docbook-style-xsl elinks gcc
dnf install gdbm-devel gettext-devel git gnutls-devel gpgme-devel krb5-devel
dnf install libdb-devel libidn2-devel libtdb-devel libxslt libzstd-devel
dnf install lmdb-devel lua lua-devel lynx lz4-devel ncurses-devel notmuch-devel
dnf install qdbm-devel redhat-rpm-config slang-devel sqlite sqlite-devel tar tcl
dnf install tokyocabinet-devel w3m
```

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
dnf install cgdb
dnf debuginfo-install bzip2-libs cyrus-sasl-lib glib2 gmime gmp gnutls gpgme
dnf debuginfo-install keyutils-libs krb5-libs libassuan libblkid
dnf debuginfo-install libcom_err libcrypt-nss libffi libgcc libgpg-error
dnf debuginfo-install libidn2 libmount libselinux libstdc++ libtalloc libtasn1
dnf debuginfo-install libunistring libuuid lmdb-libs lzo ncurses-libs nettle
dnf debuginfo-install notmuch nss-softokn-freebl p11-kit pcre pcre2 tokyocabinet
dnf debuginfo-install xapian-core-libs xz-libs zlib
```

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

`cgdb` may suggest installing more debuginfo packages.

---

Instructions last checked: 2023-04-19 by @flatcap
