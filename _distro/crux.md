---
layout: concertina
distro: CRUX
icon: crux.png
homepage: https://github.com/6c37/crux-ports/tree/3.3/neomutt
title: NeoMutt for CRUX
maintainer: 6c37 Team
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

## Installation <a class="offset" id="install"></a>

Read the [`wiki`](https://github.com/6c37/crux-ports/wiki/Installing-the-git-driver-and-adding-the-6c37-repo) and set up repo first.
then issue following commands:

```
ports -u 6c37 && prt-get depinst neomutt
```

## Update <a class="offset" id="update"></a>

```
ports -u 6c37 && prt-get update -fr neomutt
```

## Removal <a class="offset" id="remove"></a>

```
prt-get remove neomutt
```
