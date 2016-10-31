---
layout: distro
distro: Fedora
icon: fedora.png
homepage: https://copr.fedorainfracloud.org/coprs/flatcap/neomutt/
title: NeoMutt RPMs for Fedora
maintainer: flatcap
---

# {{ page.title }}

## Status

Maintained
Packager: [Richard Russon (FlatCap)](https://github.com/flatcap) <rich@flatcap.org>

## Support

The RPMs are published in a COPR.
23, 24, 25, rawhide

Releases of Fedora	Avail		Status
	22 & older	Mutt & Neo	x Obsolete
	23		Mutt & Neo	✓ Maintained
	24		Mutt & Neo	✓ Maintained
	25		--
	rawhide		Mutt & Neo	✓ Maintained

## Installation

dnf install dnf-plugins-core
dnf copr enable flatcap/neomutt
dnf install neomutt

Alternatively, you can download the RPMs directly from the server.
https://copr-be.cloud.fedoraproject.org/results/flatcap/neomutt/

Installation instructions
	include verify step
	dnf copr
	dnf installl
	including uninstall of mutt if nec

include extras, e.g. notmuch

## Update

```
dnf update
```

## Removal

Uninstall instructions
	restore to mutt

```
dnf remove neomutt
```

```
dnf install --allowerasing mutt
```

## Building from Source

Dependencies

## Debugging

Dependencies

