---
layout: concertina
distro: Arch User Repository
icon: arch.png
homepage: https://aur.archlinux.org/packages/neomutt/
title: NeoMutt for Arch
maintainer: shioyama
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}


## Support <a class="offset" id="support"></a>

Both the latest release and the `neomutt` branch in the repo are supported.
Other feature branches may work, but there is no guarantee.


## Installation <a class="offset" id="install"></a>

Neomutt is available in the Arch User Repository (AUR) as both
[`neomutt`](https://aur.archlinux.org/packages/neomutt/) and
[`neomutt-git`](https://aur.archlinux.org/packages/neomutt-git/). Use your
favourite AUR helper to download and install it. Alternatively, you can install
it with the following commands:

```
mkdir -p /tmp/makepkg && cd /tmp/makepkg
wget https://aur.archlinux.org/cgit/aur.git/snapshot/neomutt.tar.gz
tar xf neomutt.tar.gz
cd neomutt
makepkg -si
```

This will download the latest Neomutt release from GitHub, compile it and
install it.

If you want to customize the options or use unmerged features, edit the
`PKGBUILD`. The sections of interest are:

- `build`: you can change the compile options after `./prepare`. In particular,
  this is where you have to add the cache backend you want to use if you want
  something else than the default.
- `source`: you can change the `#branch=neomutt` and replace `neomutt` with the
  branch you want to use. This is only for the
  [`neomutt-git`](https://aur.archlinux.org/packages/neomutt-git/) package.


## Update <a class="offset" id="update"></a>

You must manually run the installation commands again to update Neomutt. Or you
can use an AUR helper to automate it for you. Take a look at the ArchWiki page
for the [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository).


## Removal <a class="offset" id="remove"></a>

To remove Neomutt along with any dependencies that will be orphaned use the
following command:

```
pacman -Rsc neomutt
```

## Debugging <a class="offset" id="debug"></a>

Archlinux does not have separate `-dbg` packages. In order to debug `neomutt`,
you must first compile with debug symbols. Download the AUR package and edit the 
`PKGBUILD` adding the following:
```
options=(debug !strip)
```
Build and install the new package which contains debug symbols.

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

