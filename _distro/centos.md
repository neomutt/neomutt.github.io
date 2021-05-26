---
distro: CentOS / RHEL
icon: centos.png
homepage: https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/
title: NeoMutt for CentOS
maintainer: flatcap
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

| CentOS / RHEL | Support                     |
| :------------ | :-------------------------- |
| 5 or before   | Unsupported, please upgrade |
| 6             | Supported                   |
| 7             | Supported                   |
| 8             | Supported                   |

The NeoMutt RPMs are published in a YUM repo. This is a public repository run
by Richard Russon (@flatcap) <[rich@flatcap.org](mailto:rich@flatcap.org)>

They provide NeoMutt for both CentOS and RedHat Enterprise Linux.

## Installation <a id="install"></a>

The instructions work for all versions of CentOS / RHEL. The commands should
be run as root, or prefixed with `sudo`.

First download the repo file for your OS:

- CentOS / RHEL v6
  [flatcap-neomutt-epel-6.repo](https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/repo/epel-6/flatcap-neomutt-epel-6.repo)
- CentOS / RHEL v7
  [flatcap-neomutt-epel-7.repo](https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/repo/epel-7/flatcap-neomutt-epel-7.repo)
- CentOS / RHEL v8
  [flatcap-neomutt-epel-8.repo](https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/repo/epel-8/flatcap-neomutt-epel-8.repo)

Now, copy it into place and install:

```
cp flatcap-neomutt-epel-8.repo /etc/yum.repos.d/
yum install neomutt
```

You will see a warning, which you can say 'y' to.

```reply
Retrieving key from https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/pubkey.gpg
Importing GPG key 0xFACB00B1:
 Userid: "flatcap_NeoMutt (None) <flatcap#NeoMutt@copr.fedorahosted.org>"
 Fingerprint: 654d 24a3 6315 9304 787b 8f9b fc43 0e26 facb 00b1
 From  : https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/pubkey.gpg
Is this ok [y/N]: y
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

## Update <a id="update"></a>

Once NeoMutt is installed, it will be updated automatically when you perform
system updates. You can make that happen sooner by running:

```
yum update
```

## Removal <a id="remove"></a>

To completely remove NeoMutt from your system:

```
yum remove neomutt
rm -f /etc/yum.repos.d/flatcap-neomutt-epel-*.repo
```

If, instead, you would like to downgrade to Mutt:

```
yum remove neomutt
rm -f /etc/yum.repos.d/flatcap-neomutt-epel-*.repo
yum install mutt
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
yum install git
yum install gcc gettext-devel libidn-devel ncurses-devel slang-devel tcl
yum install docbook-dtds docbook-style-xsl libxslt lynx
yum install gnutls-devel cyrus-sasl-devel gpgme-devel krb5-devel
yum install tokyocabinet-devel
```

Unfortunately, these libraries aren't available in CentOS / RHEL:

- notmuch-devel
- kyotocabinet-devel
- lmdb-devel

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
yum install gdb yum-utils
debuginfo-install bzip2-libs cyrus-sasl-lib glibc gnutls gpgme keyutils-libs
debuginfo-install krb5-libs libcom_err libgcrypt libgpg-error libidn libselinux
debuginfo-install libtasn1 ncurses-libs nss-softokn-freebl tokyocabinet zlib
```

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

`gdb` may suggest installing more debuginfo packages.

---

Instructions last checked: 2017-12-01 by @flatcap

