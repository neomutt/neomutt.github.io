---
layout: concertina
distro: NixOS Linux
icon: nixos.png
homepage: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/mailreaders/neomutt/default.nix
title: NeoMutt for NixOS
maintainer: cstrahan
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

Packagers:

- [Charles Strahan](https://github.com/cstrahan)
- [Rahul Gopinath](https://github.com/vrthra)
- [Erik Rybakken](https://github.com/erikryb)

## Installation <a class="offset" id="install"></a>

There are currently two different ways to install software on NixOS. One is
declarative and the other more imperative.


### declarative package management

Add `pkgs.neomutt` into your `configuration.nix` like this:

```reply
environment.systemPackages = [ pkgs.neomutt ];
```

then run:

```
nixos-rebuild switch
```

For further reference, you might want to read the
[nixOS manual](http://nixos.org/nixos/manual/index.html#sec-declarative-package-mgmt).


### imperative package management

You just have to run

```
nix-env -iA nixos.neomutt
```


## Update <a class="offset" id="update"></a>

### imperative

To update a particular package, run

```
nix-env -u neomutt
```

## Removal <a class="offset" id="remove"></a>

### imperative

To remove a particular package, run

```
nix-env -e neomutt
```

## Building from Source <a class="offset" id="build"></a>

```
 nix-shell '<nixpkgs>' -A neomutt
```

That will install all build dependencies and put you into a shell where every
needed environment variable is already set. For further information, you may
want to consult the
[nix-shell manual](http://nixos.org/nix/manual/#description-13).

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.


Now you can follow the [guide for debugging NeoMutt](/dev/debug).
