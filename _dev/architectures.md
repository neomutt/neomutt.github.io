---
layout: concertina
title: Architectures
description: List of supported architectures / operating systems
---

# {{ page.title }}

**Note**: This is still work in progress and not at all fixed! For the
discussion, see [#346](https://github.com/neomutt/neomutt/issues/436).

## Motivation

@flatcap said he's being reluctant to change the
build system, because he doesn't know which operating system or architecture
that would break.

## Architectures

### confirmed

We think it makes sense to orientate ourselves at
[NetBSD](https://netbsd.org/releases/formal-7/NetBSD-7.0.2.html#system-families),
because it probably supports every platform Debian, FreeBSD, OpenBSD, etc.
support and beyond.

> acorn26 acorn32 algor alpha amd64 amiga amigappc arc atari bebox cats cesfic
> cobalt dreamcast emips epoc32 evbarm evbmips evbppc evbsh3 ews4800mi hp300
> hppa hpcarm hpcmips hpcsh i386 ibmnws iyonix landisk luna68k mac68k macppc
> mipsco mmeye mvme68k mvmeppc netwinder news68k newsmips next68k ofppc pmax
> prep rs6000 sandpoint sbmips sgimips shark sparc sparc64 sun2 sun3 vax x68k
> xen

Our NetBSD maintainer
[@0-wiz-0](https://github.com/neomutt/neomutt/issues/436#issuecomment-282689847)
said, although NeoMutt doesn't build on every of those architectures (due to
the lack of build machines) all those architectures share mostly the same code.
Therefore, he doesn't expect many troubles.

Of course, our argument in the section
[Operating Systems // not desirable to support](#not-desirable-to-support) also
can be applies here: It's difficult to provide support for all the above
architectures, because many of us probably have only a AMD64 machine.

## Operating Systems

([Source](https://github.com/neomutt/neomutt/blob/135b1bfa9bd10336b93a25bdaf6112dc4c77df46/INSTALL#L7-L27))

### confirmed

For the following, we expect not many troubles to build NeoMutt. Many of those
have a dedicated maintainer and a great amount of users.

* FreeBSD
* Linux
* Mac OS X
* NetBSD
* OpenBSD

### confirmation missing

* SCO Unix -- latest release: 2015, recent versions are based on FreeBSD
* Solaris

### not desirable to support

For the following OS's, we reluctant to call NeoMutt to support them. All of
those are in our opinion a bit hard to get, not very popular or discontinued
(release dates are from Wikipedia):

* BSDI -- seems to be legacy
* Digital Unix (OSF/1) -- discontinued, proprietary
* QNX -- proprietary, latest release: 2014
* IRIX -- discontinued
* HP-UX -- proprietary
* DYNIX/ptx -- legacy system
* AIX -- proprietary, latest release: October 5, 2015
* Data General Unix (DG/UX) -- discontinued in 2001
* UnixWare -- proprietary, latest release: June 10, 2013
* Convex -- [old Supercomputer](https://en.wikipedia.org/wiki/Convex_Computer)
* Ultrix -- proprietary, latest release: 1995
* Atari MiNT -- open source, latest release: 18 March 2013
* MkLinux -- latest release: August 5, 2002
* SunOS -- proprietary, latest release: November 1994

