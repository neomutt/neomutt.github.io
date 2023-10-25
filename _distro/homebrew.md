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

NeoMutt can be installed with Homebrew.

The instructions for installing Homebrew are provided on the
[Homebrew homepage][homebrew].

[homebrew]: {{ page.homepage }}
[macos]: https://www.apple.com/macos/
[neomutt-homebrew]: https://github.com/neomutt/homebrew-neomutt

## Installation <a id="install"></a>

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
