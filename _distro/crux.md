---
distro: CRUX
icon: crux.png
homepage: https://crux.nu/portdb/?a=search&q=neomutt
title: NeoMutt for CRUX
maintainer: Tim Biermann
---

# ![logo](/images/distros/{{page.icon}}) {{ page.title }}

## Support <a id="support"></a>

Please use an up to date CRUX install. In the time of this writing, CRUX 3.5 is the current release. Whenever 3.6 will be announced and made available as a stable release, most of the attention will go into maintaining those repositories. So if you are hanging behind, you most likely will not receive any updates anymore.
Else, this guide is supposed to work from version 3.5 onwards.

## Installation <a id="install"></a>

Installing NeoMutt in CRUX requires you to unlock the [contrib](https://crux.nu/Main/Handbook3-5#ntoc35) repository. Contrib is installed and deactivated by default. Find out more about why and how in the [manual](https://crux.nu/Main/Handbook3-5#ntoc42) that you totally should read if you want to run CRUX, but let me give you an tl;dr here:

from a rooted shell:
```
cp /etc/ports/contrib.rsync.inactive /etc/ports/contrib.rsync
ports -u
prt-get depinst neomutt
```

Step 1: will activate the rsync repository to be checked out with `ports`
Step 2: will update your local ports tree, now fetching contrib as well
Step 3: will install neomutt with all it's dependencies

You can find out some information about the port, some examples:

```
prt-get info neomutt
prt-get isinst neomutt
prt-get depends neomutt
prt-get deptree neomutt
```

Once compiling all the dependencies is done, you are done as well - you just installed NeoMutt on CRUX 👏🥳

## Update <a id="update"></a>

To update NeoMutt, it is necessary to update your local ports tree.
After that, we can use `prt-get` again to update NeoMutt.

```
ports -u
prt-get update neomutt
```

## Removal <a id="remove"></a>

To remove NeoMutt, use our trusty companion, `prt-get`.

```
prt-get remove neomutt
```

## The usual self maintenance

Every once in a while, other packages updates break another installed package. This can happen to NeoMutt as well.
If you find yourself in the gruesome situation of software not running, consider installing the [opt](https://crux.nu/portdb/?a=search&q=prt-utils) package from the opt repository. This repository is enabled by default on every CRUX installation, and that package has many great tools included. One is of special interest here though - `revdep`. It will report installed ports which links are broken, run it with `-vvv _PORTNAME_` argument to see what exactly fails to be found.

tl;dr:
```
prt-get update -fr $(revdep)
```
This will rebuild every port reported by `revdep`. Please do mind though that you mind need to run this more than just once.
