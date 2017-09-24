---
layout: concertina
title: Building NeoMutt
description: How to build NeoMutt from the Source Code
status: wip
---

# {{ page.title }}

## Install Dependencies

See [Distro Pages](/distro.html).

## Obtain the Source

Git, GitHub ZIP, Mutt tarball + NeoMutt patch

### Git

Main branch: [neomutt](https://github.com/neomutt/neomutt/tree/master), **see also**:
[list of branches](/dev/branches)

```
git clone https://github.com/neomutt/neomutt
```

Same as above but pointing to an other branch, e.g. `devel/autosetup`, for checkout.

```
git clone -b devel/autosetup https://github.com/neomutt/neomutt
```

### GitHub

Latest release
: <https://github.com/neomutt/neomutt/releases/latest>

Select a source package (Tar or ZIP archive) and the checksum file for
download. **Important**, verify the tarball/ZIP archive file to ensure its
integrity, see [Signing Code / Releases](/dev/signing#source-example) for an
example.

Specific branch
: <https://github.com/neomutt/neomutt/archive/devel/autosetup.zip>

Note, archive file verification isn't possible here because this is not
a NeoMutt release archive and thus no checksum file is available. Consider
using Git (as mentioned [above](#git)) to clone a repository with the specific
branch instead.

### Mutt + NeoMutt Patch

This is deprecated because **NeoMutt 2017-03-06 (1.8.0)** is the last release
which offers separate patch/diff files for
[Mutt](https://dev.mutt.org/trac/browser/?rev=6948%3Ad897983752f9) (version
1.8.0 in this case).

Mutt tarball
: <ftp://ftp.mutt.org/pub/mutt/mutt-1.8.0.tar.gz>
: <ftp://ftp.mutt.org/pub/mutt/mutt-1.8.0.tar.gz.asc>

Grab, verify (assuming signing key is available) and extract the Mutt tarball.

```
curl -LR 'ftp://ftp.mutt.org/pub/mutt/mutt-1.8.0.tar.gz{,.asc}' --output 'mutt-1.8.0.tar.gz#1'
gpg2 --verify mutt-1.8.0.tar.gz{.asc,}
tar xzvf mutt-1.8.0.tar.gz
```

NeoMutt patch
: <https://github.com/neomutt/neomutt/releases/tag/neomutt-20170306>

Download the checksum and unified diff file and verify both. Afterwards
apply the patch set in the root directory of extracted Mutt tarball.

```
GITHUB_URI='https://github.com/neomutt/neomutt/releases/download/neomutt-20170306'
curl -LR ${GITHUB_URI}'/neomutt-20170306{.diff.gz,-CHECKSUM}' --output 'neomutt-20170306#1'
unset -v GITHUB_URI
gpg2 --verify neomutt-20170306-CHECKSUM
sha256sum --check --ignore-missing neomutt-20170306-CHECKSUM
gunzip --stdout neomutt-20170306.diff.gz | patch --unified --strip=1 --directory mutt-1.8.0/
cd mutt-1.8.0/
```

## Autoreconf

Generate the appropriate configuration and build scripts.

```
autoreconf -i
configure.ac:19: installing '.build-aux/compile'
configure.ac:23: installing '.build-aux/config.guess'
configure.ac:23: installing '.build-aux/config.sub'
configure.ac:10: installing '.build-aux/install-sh'
configure.ac:10: installing '.build-aux/missing'
Makefile.am: installing '.build-aux/depcomp'
```

## Configure

List supported options to adapt or fine tune NeoMutt's build.

```
./configure --help
```

### Varied configure options

| Category         | Option/Variable          | Description                                                   |
| :--------------- | :----------------------- | :------------------------------------------------------------ |
| General options  | `--prefix=PREFIX`        | Install architecture-independent files in PREFIX [/usr/local] |
| Curses vs S-Lang | `--with-slang[=DIR]`     | Use *S-Lang* instead of *ncurses*                             |
|                  | `--with-curses=DIR`      | Where *ncurses* is installed                                  |
| Features         | `--enable-notmuch`       | Enable *Notmuch* support                                      |
|                  | `--enable-gpgme`         | Enable *GPGME* support                                        |
| Caching options  | `--enable-hcache`        | Enable header caching                                         |
|                  | `--without-tokyocabinet` | Don't use *Tokyo Cabinet* even if it is available             |
|                  | `--without-kyotocabinet` | Don't use *Kyoto Cabinet* even if it is available             |
|                  | `--without-qdbm`         | Don't use *QDBM* even if it is available                      |
|                  | `--without-gdbm`         | Don't use *GDBM* even if it is available                      |
|                  | `--with-bdb[=DIR]`       | Use *Berkeley DB* for the header cache                        |
|                  | `--with-lmdb[=DIR]`      | Use *LMDB* for the header cache                               |
| Security         | `--with-gss[=PFX]`       | Compile in *GSSAPI* authentication for IMAP                   |
|                  | `--with-ssl[=PFX]`       | Enable TLS support using *OpenSSL*                            |
|                  | `--with-gnutls[=PFX]`    | Enable TLS support using *GnuTLS*                             |
|                  | `--with-sasl[=PFX]`      | Use *SASL* network security library                           |
| Debug options    | `--enable-debug`         | Enable debugging support                                      |
|                  | `CFLAGS="-g -O0"`        | Set C compiler flags, e.g. for [GCC](https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html)             |

## Build

Targets: neomutt, doc, ...

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

