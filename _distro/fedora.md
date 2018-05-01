---
layout: concertina
distro: Fedora
icon: fedora.png
homepage: https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/
title: NeoMutt for Fedora
maintainer: flatcap
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

| Fedora       | Support                     |
| :----------- | :-------------------------- |
| 25 or before | Unsupported, please upgrade |
| 26           | Supported                   |
| 27           | Supported                   |
| 28           | Supported                   |
| Rawhide      | Supported                   |

The NeoMutt RPMs are published in a COPR. This is a public repository run by
Richard Russon ([FlatCap](https://github.com/flatcap)) <[rich@flatcap.org](mailto:rich@flatcap.org)>

## Installation <a id="install"></a>

The instructions work for all versions of Fedora. The commands should be run
as root, or prefixed with `sudo`.

"dnf-plugins-core" will probably already be installed.

```
dnf install dnf-plugins-core
```

```reply
Package dnf-plugins-core.noarch is already installed, skipping.
Dependencies resolved.
Nothing to do.
Complete!
```

Next, enable the NeoMutt COPR:

```
dnf copr enable flatcap/neomutt
```

You will be shown a warning, which you need to say **yes** to:

```reply
You are about to enable a Copr repository. Please note that this
repository is not part of the main Fedora distribution, and quality
may vary.

The Fedora Project does not exercise any power over the contents of
this repository beyond the rules outlined in the Copr FAQ at
<https://fedorahosted.org/copr/wiki/UserDocs#WhatIcanbuildinCopr>, and
packages are not held to any quality or security level.

Please do not file bug reports about these packages in Fedora
Bugzilla. In case of problems, contact the owner of this repository.

Do you want to continue? [y/N]:
```

Finally, install the NeoMutt package:

```
dnf install neomutt
```

During the installation, dnf will ask you to verify the public key of the
package. Check that fingerprint **exactly** matches the one shown below, then
say **yes**. This step only has to be done once -- for the first install.

```reply
Importing GPG key 0xFACB00B1:
 Userid     : "flatcap_NeoMutt (None) <flatcap#NeoMutt@copr.fedorahosted.org>"
 Fingerprint: 654D 24A3 6315 9304 787B 8F9B FC43 0E26 FACB 00B1
 From       : https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/pubkey.gpg
Is this ok [y/N]:
```

Well done! You've just installed NeoMutt.

- **Learn more about NeoMutt**: [browse our website](https://neomutt.org)
- **Latest news**: Subscribe to our
  [RSS feed](https://neomutt.org/feed.xml) or our mailing lists for
  [NeoMutt Users](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)
- **Talk to the developers**: Join our IRC channel: #neomutt on
  irc.freenode.net or the
  [NeoMutt Developers](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)
  mailing list

## Alternative install <a id="alternate"></a>

An alternative way to install NeoMutt is to download the rpm directly from the
server (and verify it using the
 [public key](https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/pubkey.gpg)).

[https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/](https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/)

```
gpg2 --with-fingerprint pubkey.gpg
```

```reply
pub   rsa2048 2016-04-10 [SCEA] [expires: 2021-04-09]
      654D 24A3 6315 9304 787B  8F9B FC43 0E26 FACB 00B1
uid           flatcap_NeoMutt (None) <flatcap#NeoMutt@copr.fedorahosted.org>
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
dnf copr remove flatcap/neomutt
```

```reply
Repository successfully removed.
```

If, instead, you would like to downgrade to Mutt:

```
dnf install --allowerasing mutt
```

```reply
========================================================================
 Package      Arch     Version                 Repository          Size
========================================================================
Installing:
 mutt         x86_64   5:1.8.0-1.fc25          updates            1.4 M
Removing:
 neomutt      x86_64   5:1.8.0-20170225.fc25   @flatcap-neomutt   7.6 M
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
dnf install git
dnf install gcc libidn-devel ncurses-devel slang-devel gettext-devel tcl tar
dnf install docbook-dtds docbook-style-xsl libxslt lynx
dnf install cyrus-sasl-devel gnutls-devel gpgme-devel krb5-devel notmuch-devel
dnf install tokyocabinet-devel kyotocabinet-devel lmdb-devel
```

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
dnf install cgdb
dnf debuginfo-install bzip2-libs cyrus-sasl-lib glib2 gmime gmp gnutls gpgme
dnf debuginfo-install keyutils-libs krb5-libs kyotocabinet-libs libassuan libblkid
dnf debuginfo-install libcom_err libcrypt-nss libffi libgcc libgpg-error libidn
dnf debuginfo-install libidn2 libmount libselinux libstdc++ libtalloc libtasn1
dnf debuginfo-install libunistring libuuid lmdb-libs lzo ncurses-libs nettle
dnf debuginfo-install notmuch nss-softokn-freebl p11-kit pcre pcre2 tokyocabinet
dnf debuginfo-install xapian-core-libs xz-libs zlib
```

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

`cgdb` may suggest installing more debuginfo packages.

---

Instructions last checked: 2017-12-01 by @flatcap

*[COPR]: Cool Other Package Repo

