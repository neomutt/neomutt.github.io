---
layout: concertina
title: Building NeoMutt
description: How to build NeoMutt from the Source Code
---

# {{ page.title }}

## Install Dependencies

see distro pages

## Obtain the Source

git, github zip, mutt tar + neo patch

### Git

Main branch: neomutt

see also: list of branches

```
git clone https://github.com/neomutt/neomutt
```

Other branch, e.g. devel/summary

```
git clone -b devel/summary https://github.com/neomutt/neomutt
```

### GitHub

latest release
https://github.com/neomutt/neomutt/releases/latest
select neomutt named file

latest git
https://github.com/neomutt/neomutt/archive/neomutt.zip

branch
https://github.com/neomutt/neomutt/archive/devel/summary.zip

### Mutt + NeoMutt Patch

ftp://ftp.mutt.org/pub/mutt/mutt-1.8.0.tar.gz
https://github.com/neomutt/neomutt/releases/latest
select neomutt patch

## Autoreconf

Generate the appropriate configuration and build scripts

```
autoreconf -i                     
configure.ac:17: installing './compile'
configure.ac:21: installing './config.guess'
configure.ac:21: installing './config.sub'
configure.ac:12: installing './install-sh'
configure.ac:12: installing './missing'
Makefile.am: installing './depcomp'
```

## Configure

./configure --help

### General options

  --prefix=/usr/local

### Curses vs Slang

  --with-slang[=DIR]      Use S-Lang instead of ncurses
  --with-curses=DIR       Where ncurses is installed

### Features

  --enable-notmuch        Enable NOTMUCH support
  --enable-gpgme          Enable GPGME support

### Caching Options

  --enable-hcache         Enable header caching
  --without-tokyocabinet  Don't use tokyocabinet even if it is available
  --without-kyotocabinet  Don't use kyotocabinet even if it is available
  --without-qdbm          Don't use qdbm even if it is available
  --without-gdbm          Don't use gdbm even if it is available
  --with-bdb[=DIR]        Use BerkeleyDB4 if gdbm is not available
  --with-lmdb[=DIR]       Use LMDB if gdbm is not available

### Security

  --with-gss[=PFX]        Compile in GSSAPI authentication for IMAP
  --with-ssl[=PFX]        Enable TLS support using OpenSSL
  --with-gnutls[=PFX]     enable TLS support using gnutls
  --with-sasl[=PFX]       Use SASL network security library

### Debug Options

  --enable-debug          Enable debugging support
	CFLAGS="-g -O0"

## Build

targets: mutt, docs, validate

```
make
```

## Install

```
make install
```

## Uninstall

```
make uninstall
```

