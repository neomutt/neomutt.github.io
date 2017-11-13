---
layout: concertina
title: Building NeoMutt
description: How to build NeoMutt from the source code
status: wip
---

# {{ page.title }}

{{ page.description }}

## Install dependencies

See [Distro Pages](/distro.html).

## Obtain the source

The NeoMutt project is hosted on GitHub, so there are two main options to get
the sources -- either as Git repository or GitHub archive file. A repository,
not only for [GitHub users](/dev/newbie-tutorial#github), provides some
benefits over a single release or snapshot archive, e.g. will empower you to
work with the source code and contribute to the project more easily.

### Git <a class="offset" id="git"></a>

Cloning the [main branch](https://github.com/neomutt/neomutt/tree/master) but
also see our [list of branches](/dev/branches).

```
git clone https://github.com/neomutt/neomutt
```

Same as above but pointing to an other branch, e.g. `sample/summary`, for
checkout.

```
git clone -b sample/summary https://github.com/neomutt/neomutt
```

### GitHub

Latest release

: <https://github.com/neomutt/neomutt/releases/latest>

Select a source package (Tar or ZIP archive) and the checksum file for
download. **Important**, verify the tarball/ZIP archive file to ensure its
integrity, see [Signing Code / Releases](/dev/signing#source-example) for an
example.

Specific branch

: <https://github.com/neomutt/neomutt/archive/sample/summary.zip>

Note, archive file verification isn't possible here because this is not
a NeoMutt release archive and thus no checksum file is available. Consider to
use Git instead (as mentioned [above](#git)) to clone the repository and
checkout the specific branch afterwards.

## Configure

List supported options to adapt or fine tune NeoMutt's build.

```
./configure.autosetup --help
```

### Configure options

This is not a comprehensive list of configure options.
Check `configure.autosetup --help` for full help.
The options marked "Path" have either take a path, or have an extra option for specifying the library path.

e.g.  `./configure --notmuch --with-notmuch=/usr/local/lib/notmuch`

| Configure option        | Path | Notes                                        |
| :---------------------- | :--- | :------------------------------------------- |
| `--with-ui=CHOICE`      |      | Select 'ncurses' or 'slang'                  |
| `--with-ncurses=path`   |      | Location of ncurses                          |
| `--with-slang=path`     |      | Location of S-Lang                           |
|                         |      |                                              |
| `--gpgme`               | Path | GPG Made Easy                                |
| `--gnutls`              | Path | Gnu TLS (SSL)                                |
| `--gss`                 | Path | Generic Security Services                    |
| `--sasl`                | Path | Simple Authentication and Security Layer     |
| `--ssl`                 | Path | OpenSSL                                      |
|                         |      |                                              |
| `--fmemopen`            |      | Optional Feature (Dangerous)                 |
| `--lua`                 | Path | Optional Feature                             |
| `--notmuch`             | Path | Optional Feature                             |
| `--mixmaster`           |      | Optional Feature                             |
|                         |      |                                              |
| `--bdb`                 | Path | Header cache backend                         |
| `--gdbm`                | Path | Header cache backend                         |
| `--kyotocabinet`        | Path | Header cache backend                         |
| `--lmdb`                | Path | Header cache backend                         |
| `--qdbm`                | Path | Header cache backend                         |
| `--tokyocabinet`        | Path | Header cache backend                         |
|                         |      |                                              |
| `--disable-fcntl`       |      | fcntl(2) file locking                        |
| `--flock`               |      | flock(2) file locking                        |
| `--locales-fix`         |      | Workaround for broken locales                |
| `--disable-nls`         | Path | National Language Support (translations)     |
| `--disable-pgp`         | Path | Pretty Good Privacy                          |
| `--disable-smime`       | Path | Secure/Multipurpose Internet Mail Extensions |
| `--disable-idn`         | Path | Internationalised domain names               |
| `--logging`             |      | Enable debug logging                         |
|                         |      |                                              |
| `--with-domain=DOMAIN`  |      | Default email domain                         |
| `--with-mailpath`       | Path | Location of spooled mail                     |
| `--homespool`           | Path | Spooled mail is in user's home dir           |
|                         |      |                                              |
| `--prefix`              | Path | Target directory for build (default: `/usr`) |
| `--disable-doc`         |      | Don't build the docs                         |
| `--full-doc`            |      | Document disabled features                   |
| `--quiet`               |      | Only show the summary                        |

## Build

Targets: **neomutt**, **doc**, ...

The build can be adjusted by setting any of six environment variables:

- `CC` - set the compiler
- `CFLAGS` - replace **all** the compiler flags
- `EXTRA_CFLAGS` - append flags to the default compiler flags
- `LD` - set the linker
- `LDFLAGS` - replace **all** the linker flags
- `EXTRA_LDFLAGS` - append flags to the default linker flags

e.g. `make EXTRA_CFLAGS=-g`

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

*[GCC]: GNU Compiler Collection
*[GDBM]: GNU Data Base Manager
*[GPGME]: GnuPG Made Easy
*[GSSAPI]: Generic Security Services Application Program Interface
*[IMAP]: Internet Message Access Protocol
*[LMDB]: Lightning Memory-Mapped Database Manager
*[OBDB]: Oracle Berkeley Database
*[QDBM]: Quick Data Base Manager
*[SASL]: Simple Authentication and Security Layer
*[SSL]: Secure Sockets Layer
*[Tar]: Tape archiver
*[TLS]: Transport Layer Security
*[tarball]: Tar generated archive file
*[ZIP]: archive file format (meaning &ldquo;move at high speed&rdquo;)

[crss]:  <https://www.gnu.org/software/ncurses/ncurses.html>
[dgcc]:  <https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html>
[gdbm]:  <http://www.gnu.org.ua/software/gdbm/gdbm.html>
[gpgme]: <https://www.gnupg.org/related_software/gpgme/>
[gss2]:  <https://en.wikipedia.org/wiki/Generic_Security_Services_Application_Program_Interface>
[gtls]:  <https://www.gnutls.org/>
[kcab]:  <http://fallabs.com/kyotocabinet/>
[lmdb]:  <https://symas.com/lmdb/technical/>
[lua]:   <https://www.lua.org/>
[obdb]:  <http://www.oracle.com/technetwork/database/database-technologies/berkeleydb/overview/index.html>
[ossl]:  <https://www.openssl.org/>
[qdbm]:  <http://fallabs.com/qdbm/>
[sasl]:  <https://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer>
[slng]:  <http://www.jedsoft.org/slang/>
[tcab]:  <http://fallabs.com/tokyocabinet/>

