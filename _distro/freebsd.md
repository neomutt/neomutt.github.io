---
layout: concertina
distro: FreeBSD
icon: freebsd.png
homepage: https://www.freebsd.org/cgi/ports.cgi?query=neomutt
title: NeoMutt for FreeBSD
maintainer: bapt
---

# ![logo](/images/{{page.icon}}) {{ page.title }}

## Support <a class="offset" id="support"></a>

See [Supported FreeBSD releases](https://www.freebsd.org/security/#sup).

## Installation <a class="offset" id="install"></a>

To install a pre-built binary package:

```
pkg install neomutt
```

You will be asked to confirm with a 'Y'.

```reply
Updating FreeBSD repository catalogue...
FreeBSD repository is up-to-date.
All repositories are up-to-date.
Checking integrity... done (0 conflicting)
The following 1 package(s) will be affected (of 0 checked):

New packages to be INSTALLED:
        neomutt: 20161104_1

Number of packages to be installed: 1

The process will require 8 MiB more space.

Proceed with this action? [y/N]: y
[localhost] [1/1] Installing neomutt-20161104_1...
[localhost] [1/1] Extracting neomutt-20161104_1: 100%
```

## Update <a class="offset" id="update"></a>

To upgrade your installed packages to their latest versions, run ```pkg
upgrade```.

## Removal <a class="offset" id="remove"></a>

To remove neomutt, run ```pkg delete neomutt```. Again, you'll be asked to
confirm with a 'Y'.

```reply
Checking integrity... done (0 conflicting)
Deinstallation has been requested for the following 1 packages (of 0 packages
in the universe):

Installed packages to be REMOVED:
        neomutt-20161104_1

Number of packages to be removed: 1

The operation will free 8 MiB.

Proceed with deinstalling packages? [y/N]: y
[localhost] [1/1] Deinstalling neomutt-20161104_1...
[localhost] [1/1] Deleting files for neomutt-20161104_1: 100%
```

## Building from Source <a class="offset" id="build"></a>

These instructions will help you install all the dependencies you'll need to
build NeoMutt from the source code.

```pkg install automake git neomutt```

By installing neomutt, you'll automatically get all the dependencies you need
for building too.

Now you can follow the [guide for building NeoMutt](/dev/build).

## Debugging <a class="offset" id="debug"></a>

These instructions will help you install all the dependencies you'll need to
debug NeoMutt.

```
pkg install cgdb
```

Now you can follow the [guide for debugging NeoMutt](/dev/debug).

