---
layout: concertina
distro: Debian
icon: debian.png
homepage: https://packages.debian.org/testing/mail/mutt
title: NeoMutt for Debian
maintainer: paravoid
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

Debian, Ubuntu

Currently in Testing. Note, that there's currently no plain Mutt package
available in Debian testing, because it was substituted with NeoMutt.

## Installation <a class="offset" id="install"></a>

```reply
apt-get install mutt
```

## Update <a class="offset" id="update"></a>

```reply
apt-get update && apt-get upgrade
```
## Removal <a class="offset" id="remove"></a>

```reply
apt-get remove mutt
```

## Building from source <a class="offset" id="build"></a>

The commmand

```reply
apt-get build-dep mutt
```

will install all build dependencies of your NeoMutt package. Note that you may
have to install additional packages, if you're running Debian stable and want
to build the most current version of NeoMutt.

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

