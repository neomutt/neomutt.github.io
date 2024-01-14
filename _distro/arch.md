---
distro: Arch Linux
icon: arch.png
homepage: https://www.archlinux.org/packages/extra/x86_64/neomutt/
title: NeoMutt for Arch
maintainer: inglor, freswa
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

Both the latest release and the `neomutt` branch in the repo are supported.
Other feature branches may work, but there is no guarantee.

## Installation <a id="install"></a>

NeoMutt is available in the `[extra]` official repository as
[`neomutt`](https://www.archlinux.org/packages/extra/x86_64/neomutt/) and
can be installed with pacman.

```
pacman -S neomutt
```

If you want to customize the options or use unmerged features, retrieve the
`PKGBUILD` via [`git`](https://gitlab.archlinux.org/archlinux) and edit it.

```
git clone git@gitlab.archlinux.org:archlinux/packaging/packages/neomutt.git
cd neomutt
```

The sections of interest are:

- `build`: you can change the compile options after `./configure`. In particular,
  this is where you have to add the cache backend you want to use if you want
  something else than the default.
- `source`: you can change the `#branch=neomutt` and replace `neomutt` with the
  branch you want to use. This is only for the
  [`neomutt-git`](https://aur.archlinux.org/packages/neomutt-git) package in the
  [AUR](https://wiki.archlinux.org/index.php/Arch_User_Repository).

## Update <a id="update"></a>

Neomutt can be updated together with other packages in the repositories.

```
pacman -Syu
```

If the package in the Arch Linux repositories is outdated, first ensure your
[mirrors](https://wiki.archlinux.org/title/Mirrors) are up-to-date:

```
pacman -S reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
```

If this did not help, check the version on the
[packages website](https://www.archlinux.org/packages/extra/x86_64/neomutt/)
and flag the package [out-of-date](https://www.archlinux.org/packages/flaghelp/)
if required. Note that a package should only be flagged if a newer *stable*
release is available.

## Removal <a id="remove"></a>

To remove NeoMutt along with any dependencies that will be orphaned use the
following command:

```
pacman -Rsc neomutt
```

## Debugging <a id="debug"></a>

Arch Linux does not have separate `-dbg` packages. In order to debug `neomutt`,
you must first compile with debug symbols. Edit the `PKGBUILD` adding the
following:

```
options=(debug !strip)
```

Build and install the new package which contains
[debug symbols](https://wiki.archlinux.org/index.php/Debug_-_Getting_Traces).

```
makepkg -si
```

Now you can follow the [guide for debugging NeoMutt](/dev/build/debug).
