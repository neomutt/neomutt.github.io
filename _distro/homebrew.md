---
distro: Homebrew
icon: homebrew.png
homepage: https://brew.sh/
title: NeoMutt for Homebrew
maintainer: alexpearce
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Overview <a id="overview"></a>

[Homebrew][homebrew] is a package manager for [macOS]. It allows you to easily
install and manage software that didn't come pre-installed on your system and
that isn't available on the App Store.

NeoMutt can be installed with Homebrew. The NeoMutt developers maintain the
[Homebrew package for NeoMutt][neomutt-homebrew].

The instructions for installing Homebrew are provided on the
[Homebrew homepage][homebrew]. Run the command that's given in a terminal, and
then follow the instructions it gives you. This page will show you how to
install, update, and uninstall NeoMutt with Homebrew, as well as how to install
a debug version of NeoMutt.

[homebrew]: {{ page.homepage }}
[macos]: https://www.apple.com/macos/
[neomutt-homebrew]: https://github.com/neomutt/homebrew-neomutt

## Support <a id="support"></a>

Homebrew supports macOS versions from 10.6 Snow Leopard. Any version of macOS
that supports Homebrew can be used to install NeoMutt with Homebrew.

Homebrew also allows you to install Mutt, but not NeoMutt and Mutt at the same
time.

## Installation <a id="install"></a>

The [NeoMutt Homebrew package][neomutt-homebrew] allows you to install the
latest tagged version of NeoMutt, as well as the `HEAD` version taken from the
[GitHub repository][neomutt-github].

Generally, the latest tagged version is suitable for most users. If you like to
keep up with the very latest developments, or you know there's a bug that's
been fixed since the last tagged release, you can install the `HEAD` version.

Once you have Homebrew installed, then getting NeoMutt is as simple as:

```shell
$ brew install neomutt
```

[neomutt-github]: https://github.com/neomutt/neomutt

## Update <a id="update"></a>

Homebrew automatically updates itself when you run a `brew` command. It never
updates a package, such as NeoMutt, unless you tell it to.

When Homebrew itself is updated, it checks to see if the NeoMutt package
definition has been updated, as would be the case shortly after a new version
of NeoMutt is released. You will only be able to install the latest release of
NeoMutt if Homebrew is up-to-date. You can check this by updating Homebrew
manually.

```shell
$ brew update
```

To upgrade NeoMutt to the latest version, run:

```shell
$ brew upgrade neomutt
```

## Removal <a id="remove"></a>

To remove NeoMutt from your system, run:

```shell
$ brew uninstall neomutt
```

This command will _not_ remove any files from your home directory, such as
NeoMutt configuration files.

To downgrade to Mutt:

```shell
$ brew uninstall neomutt
$ brew install mutt
```

## Building from source <a id="build"></a>

Homebrew will always build NeoMutt from source, and knows what dependencies
must be installed to do this, and how to install them.

The simplest way to get these dependencies is to install NeoMutt. Otherwise,
the following packages can be installed with Homebrew:

```shell
$ brew install autoconf automake openssl tokyo-cabinet gettext gpgme libidn
```

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

The debug build of NeoMutt can be installed by specifying the `--with-debug`
flag when installing:

```shell
$ brew install neomutt --with-debug
```

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

