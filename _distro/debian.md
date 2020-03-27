---
layout: concertina
distro: Debian
icon: debian.png
homepage: https://packages.debian.org/testing/mail/neomutt
title: NeoMutt for Debian
maintainer: Antonio Radici, Faidon Liambotis
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

Maintainers: [Antonio Radici, Faidon Liambotis](email:pkg-mutt-maintainers@lists.alioth.debian.org)

## Support <a id="support"></a>

Debian, Ubuntu

## Installation <a id="install"></a>

```reply
apt-get install neomutt
```

## Update <a id="update"></a>

```reply
apt-get update && apt-get upgrade
```
## Removal <a id="remove"></a>

```reply
apt-get remove neomutt
```

## Building from source <a id="build"></a>

The command

```reply
apt-get build-dep neomutt
```

will install all build dependencies of your NeoMutt package. Note that you may
have to install additional packages, if you're running Debian stable and want
to build the most current version of NeoMutt.

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

