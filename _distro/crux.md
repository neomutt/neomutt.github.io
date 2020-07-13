---
layout: concertina
distro: CRUX
icon: crux.png
homepage: https://crux.nu/portdb/?a=search&q=neomutt
title: NeoMutt for CRUX
maintainer: Tim Biermann
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

## Installation <a id="install"></a>

neomutt is in [contrib](https://crux.nu/Main/Handbook3-5#ntoc35), enable and activate it according to the [manual](https://crux.nu/Main/Handbook3-5#ntoc42)

Then you can simply run `prt-get depinst neomutt` to install neomutt including all its dependencies.

## Update <a id="update"></a>

```
ports -u && prt-get update neomutt
```

## Removal <a id="remove"></a>

```
prt-get remove neomutt
```
