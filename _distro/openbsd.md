---
layout: concertina
distro: OpenBSD
icon: openbsd.png
homepage: https://www.openbsd.org/
title: NeoMutt for OpenBSD
maintainer: sthen
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

NeoMutt is provided as a separate package in -current/snapshots. The first
release containing it will be 6.1.

## Installation <a class="offset" id="install"></a>

The Mutt and NeoMutt packages don't coexist, so remove Mutt first if installed:

```
# pkg_delete mutt
```

Then install NeoMutt, choosing from the list of pre-built packages:

```
# pkg_add neomutt
Ambiguous: choose package for neomutt
a	0: <None>
	1: neomutt-20161028
	2: neomutt-20161028-gpgme
	3: neomutt-20161028-gpgme-sasl
	4: neomutt-20161028-sasl
Your choice:
```

## Update <a class="offset" id="update"></a>

```
# pkg_add -u neomutt
```

## Removal <a class="offset" id="remove"></a>

```
# pkg_delete neomutt
```

## Building from Source <a class="offset" id="build"></a>

To install the main dependencies for building NeoMutt and documentation:

```
# pkg_add docbook-xsl lynx gettext
```

Now you can follow the [guide for building NeoMutt](/dev/build).

Alternatively, checkout/update the ports tree and build in the usual way
(NeoMutt is in /usr/ports/mail/neomutt).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

