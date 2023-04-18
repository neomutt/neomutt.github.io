---
distro: CentOS / RHEL
icon: centos.png
homepage: https://bodhi.fedoraproject.org/updates/?packages=neomutt
title: NeoMutt for CentOS
maintainer: flatcap
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

| CentOS / RHEL | Support                     |
| :------------ | :-------------------------- |
| 8 or before   | Unsupported, please upgrade |
| 9 (stream)    | Supported                   |

## Installation <a id="install"></a>

The instructions work for all versions of CentOS / RHEL.
The commands should be run as root, or prefixed with `sudo`.

First, enable the extra packages.
(This may already be installed)

```
dnf install epel-release
```

You will be asked to install a GPG key for the extra packages.
Say **yes**.  This step only has to be done once -- for the first install.

```reply
Importing GPG key 0x8483C65D:
 Userid     : "CentOS (CentOS Official Signing Key) <security@centos.org>"
 Fingerprint: 99DB 70FA E1D7 CE22 7FB6 4882 05B5 55B3 8483 C65D
 From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
Is this ok [y/N]:
```

Now, install neomutt:

```
dnf install neomutt
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
Now that NeoMutt is available to CentOS directly, the COPR install will soon be deprecated.

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

First enable the CRB (devel packages) repo:

```
dnf config-manager --set-enabled crb
```

Then install lots of devel packages:

```
dnf install cyrus-sasl-devel docbook-dtds docbook-style-xsl elinks gcc
dnf install gdbm-devel gettext-devel git gnutls-devel gpgme-devel krb5-devel
dnf install libdb-devel libidn2-devel libtdb-devel libxslt libzstd-devel
dnf install lmdb-devel lua-devel lz4-devel make ncurses-devel notmuch-devel
dnf install openssl-devel pcre2-devel slang-devel sqlite-devel tcl
dnf install tokyocabinet-devel w3m
```

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
dnf install gdb
debuginfo-install bzip2-libs cyrus-sasl-lib glibc gnutls gpgme keyutils-libs
debuginfo-install krb5-libs libcom_err libgcrypt libgpg-error libidn libselinux
debuginfo-install libtasn1 ncurses-libs nss-softokn-freebl tokyocabinet zlib
```

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

`gdb` may suggest installing more debuginfo packages.

---

Instructions last checked: 2023-04-19 by @flatcap
