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

there are currently two different ways to install software on NixOS. One is declarative and the other more imperative.


### declarative package management

add `pkgs.neomutt` into `configuration.nix` like this:

```reply
environment.systemPackages = [ pkgs.neomutt ];
```

then run:

```
nixos-rebuild switch
```

For further reference, you might want to read the [nixOS manual](http://nixos.org/nixos/manual/index.html#sec-declarative-package-mgmt).


### imperative package management

You just have to run

```
nix-env -i nixos.neomutt
```


## Update <a class="offset" id="update"></a>

### imperative

To update a particular package, run

```
nix-env -u nixos.neomutt
```

## Removal <a class="offset" id="remove"></a>

### imperative

To remove a particular package, run

```
nix-env -e nixos.neomutt
```

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.

```
nix-build -A neomutt
```

This will build the neomutt and print the directory where it was built.

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).

