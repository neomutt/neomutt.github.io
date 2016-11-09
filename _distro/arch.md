---
layout: concertina
distro: Arch User Repository
icon: arch.png
homepage: https://aur.archlinux.org/packages/neomutt/
title: NeoMutt for Arch
maintainer: shioyama
---

# ![logo](/images/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

## Installation <a class="offset" id="install"></a>

Neomutt is available in the Arch User Repository(AUR) as both `neomutt` and
`neomutt-git`. Use your favourite AUR helper to download and install it.
```
mkdir -p /tmp/makepkg && cd /tmp/makepkg
wget https://aur.archlinux.org/cgit/aur.git/snapshot/neomutt.tar.gz
tar xf neomutt.tar.gz
cd neomutt
makepkg -si
```

This will download the latest Neomutt release from GitHub, compile it and
install it.

## Update <a class="offset" id="update"></a>
You must manually run the installation commands again to update Neomutt. Or you
can use an AUR helper to automate it for you. Take a look at the ArchWiki page
for the [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository).

## Removal <a class="offset" id="remove"></a>
To remove Neomutt along with any dependencies that will be orphaned use the
following command:
```
# pacman -Rsc neomutt
```

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.


Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).

