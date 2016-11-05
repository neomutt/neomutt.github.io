---
layout: concertina
distro: NixOS Linux
icon: nixos.png
homepage: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/mailreaders/neomutt/default.nix
title: NeoMutt for NixOS
maintainer: hiberno
---

# ![logo](/images/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

Packagers:

- [Charles Strahan](https://github.com/cstrahan)
- [Rahul Gopinath](https://github.com/vrthra)
- [Erik Rybakken](https://github.com/erikryb)

## Installation <a class="offset" id="install"></a>

add `pkgs.neomutt` into `configuration.nix` like this:

```reply
environment.systemPackages = [ pkgs.neomutt ];
```

then run:

```
nixos-rebuild switch
```

## Update <a class="offset" id="update"></a>

## Removal <a class="offset" id="remove"></a>

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.


Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).

