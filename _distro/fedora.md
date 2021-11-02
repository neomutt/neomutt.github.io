---
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
| 32 or before | Unsupported, please upgrade |
| 33           | Supported                   |
| 34           | Supported                   |
| 35           | Supported                   |
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
Enabling a Copr repository. Please note that this repository is not part
of the main distribution, and quality may vary.

The Fedora Project does not exercise any power over the contents of
this repository beyond the rules outlined in the Copr FAQ at
<https://docs.pagure.org/copr.copr/user_documentation.html#what-i-can-build-in-copr>,
and packages are not held to any quality or security level.

Please do not file bug reports about these packages in Fedora
Bugzilla. In case of problems, contact the owner of this repository.

Do you really want to enable copr.fedorainfracloud.org/flatcap/neomutt? [y/N]: 
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
 From       : https://download.copr.fedorainfracloud.org/results/flatcap/neomutt/pubkey.gpg
Is this ok [y/N]: 
```

Well done! You've just installed NeoMutt.

- **Learn more about NeoMutt**: [browse our website](https://neomutt.org)
- **Latest news**: Subscribe to our
  [RSS feed](https://neomutt.org/feed.xml) or our mailing lists for
  [NeoMutt Users](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)
- **Talk to the developers**: Join our IRC channel: #neomutt on
  irc.libera.chat or the
  [NeoMutt Developers](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)
  mailing list

## Alternative install <a id="alternate"></a>

An alternative way to install NeoMutt is to download the rpm directly from the
server (and verify it using the
 [public key](https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/pubkey.gpg)).

[https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/](https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/)

```
gpg2 --show-keys pubkey.gpg
```

```reply
pub   rsa2048 2016-04-10 [SCEA] [expires: 2025-04-09]
      654D24A363159304787B8F9BFC430E26FACB00B1
uid                      flatcap_NeoMutt (None) <flatcap#NeoMutt@copr.fedorahosted.org>
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

## Building from source <a id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.

1. The best way to get the latest source code is to use `git`.
2. Minimum tools you need to build NeoMutt
3. Generate the documentation
4. Advanced features of NeoMutt
5. Local caching of emails

```
dnf installl cyrus-sasl-devel docbook-dtds docbook-style-xsl elinks gcc
dnf installl gdbm-devel gettext-devel git gnutls-devel gpgme-devel krb5-devel
dnf installl libdb-devel libidn-devel libtdb-devel libxslt libzstd-devel
dnf installl lmdb-devel lua lua-devel lynx lz4-devel ncurses-devel notmuch-devel
dnf installl qdbm-devel redhat-rpm-config slang-devel sqlite sqlite-devel tar tcl
dnf installl tokyocabinet-devel w3m
```

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
dnf install cgdb
dnf debuginfo-install bzip2-libs cyrus-sasl-lib glib2 gmime gmp gnutls gpgme
dnf debuginfo-install keyutils-libs krb5-libs libassuan libblkid
dnf debuginfo-install libcom_err libcrypt-nss libffi libgcc libgpg-error libidn
dnf debuginfo-install libidn2 libmount libselinux libstdc++ libtalloc libtasn1
dnf debuginfo-install libunistring libuuid lmdb-libs lzo ncurses-libs nettle
dnf debuginfo-install notmuch nss-softokn-freebl p11-kit pcre pcre2 tokyocabinet
dnf debuginfo-install xapian-core-libs xz-libs zlib
```

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

`cgdb` may suggest installing more debuginfo packages.

---

Instructions last checked: 2021-11-02 by @flatcap

*[COPR]: Cool Other Package Repo

