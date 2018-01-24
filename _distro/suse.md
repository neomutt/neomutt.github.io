---
layout: concertina
distro: OpenSUSE
package: rpm
icon: suse.png
homepage: https://software.opensuse.org/
title: NeoMutt for OpenSUSE
maintainer: kdave
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

| openSUSE     | Support                     |
| :----------- | :-------------------------- |
| Leap 42.x or before | unsupported          |
| Leap 15.x    | supported                   |
| Tumbleweed   | supported                   |

The `neomutt` package has been added to openSUSE Tumbleweed in 2018 and is not
present in any other released versions (like 13.x or Leap).

## Installation <a class="offset" id="install"></a>

The `neomutt` package can be installed in parallel with `mutt`. The
configuration files are not shared. There is some level of support of mutt
configs by neomutt, but this can change in the future and is intended only for
the transition period. Please read more about that in the
[configuration](https://www.neomutt.org/guide/configuration) docs.

```
zypper in neomutt
```

## Update <a class="offset" id="update"></a>

```
zypper up neomutt
```

## Removal <a class="offset" id="remove"></a>

```
zypper rm neomutt
```
