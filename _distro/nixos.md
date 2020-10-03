---
distro: NixOS Linux
icon: nixos.png
homepage: https://github.com/NixOS/nixpkgs/blob/master/pkgs/applications/networking/mailreaders/neomutt/default.nix
title: NeoMutt for NixOS
maintainer: cstrahan
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

Packagers:

- [Charles Strahan](https://github.com/cstrahan)
- [Rahul Gopinath](https://github.com/vrthra)
- [Erik Rybakken](https://github.com/erikryb)

## Installation <a id="install"></a>

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
[nixOS manual](https://nixos.org/nixos/manual/index.html#sec-declarative-package-mgmt).

### imperative package management

You just have to run

```
nix-env -iA nixos.neomutt
```

Alternatively, you can also install a more modern version from NixOS unstable, even
when you're running NixOS stable.

```
nix-env -f https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz -iA neomutt
```

Due to the isolated nature of nix package management, you don't run into
trouble.


## Update <a id="update"></a>

### imperative

To update a particular package, run

```
nix-env -u neomutt
```

## Removal <a id="remove"></a>

### imperative

To remove a particular package, run

```
nix-env -e neomutt
```

## Building from source <a id="build"></a>

```
 nix-shell '<nixpkgs>' -A neomutt
```

That will install all build dependencies and put you into a shell where every
needed environment variable is already set. For further information, you may
want to consult the
[nix-shell manual](https://nixos.org/nix/manual/#sec-nix-shell).

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

Now you can follow the [guide for debugging NeoMutt](../dev/build/debug).

