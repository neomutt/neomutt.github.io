---
layout: concertina
distro: OpenBSD
icon: openbsd.png
homepage: https://www.openbsd.org/
title: NeoMutt for OpenBSD
maintainer: sthen
---

# ![logo](/images/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

NeoMutt is provided as a separate package in -current/snapshots.
The first release containing it will be 6.1.

## Installation <a class="offset" id="install"></a>

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

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.


Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).

