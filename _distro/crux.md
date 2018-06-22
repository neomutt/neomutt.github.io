---
layout: concertina
distro: CRUX
icon: crux.png
homepage: https://github.com/6c37/crux-ports/tree/master/neomutt
title: NeoMutt for CRUX
maintainer: 6c37 Team
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

## Installation <a id="install"></a>

Read the [`wiki`](https://github.com/6c37/crux-ports/wiki/Installing-the-git-driver-and-adding-the-6c37-repo) and set up repo first.
then issue following commands:

```
ports -u 6c37 && prt-get depinst neomutt
```

## Update <a id="update"></a>

```
ports -u 6c37 && prt-get update -fr neomutt
```

## Removal <a id="remove"></a>

```
prt-get remove neomutt
```
