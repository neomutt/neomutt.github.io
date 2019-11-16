---
layout: concertina
title: Signing Code / Releases
description: Be Sure You're Getting the Real Thing
---

# {{ page.title }}

If you're planning to build your own version of NeoMutt, it's important to
check that the source hasn't been tampered with.

All **release commits** in Git are signed and all **GitHub downloads** come
with a SHA256 CHECKSUM file.

## Keys

The NeoMutt signing key is:

- `86C2397270DD7A561263CA4E5FAF0A6EE7371805`
- Richard Russon (NeoMutt) <rich@flatcap.org>

This key is available on keyservers:

```sh
gpg2 --search-keys neomutt
```

```reply
gpg: data source: http://c-73-164-0-249.hsd1.mn.comcast.net:11371
(1)     Richard Russon (NeoMutt) <rich@flatcap.org>
          4096 bit RSA key 5FAF0A6EE7371805, created: 2016-04-08, expires: 2019-04-13
Keys 1-1 of 1 for "neomutt".  Enter number(s), N)ext, or Q)uit >
```

## Git example

**Note**: On the
[GitHub releases page](https://github.com/neomutt/neomutt/releases), **all**
releases should display a "Verified" tag. This confirms that the release
matches the NeoMutt signing key.

```sh
git clone https://github.com/neomutt/neomutt
cd neomutt
git
git tag -v neomutt-20170428
```

```reply
object 26b1c69d262048e8a225063aad90f817e0b3dcd6
type commit
tag neomutt-20170428
tagger Richard Russon <rich@flatcap.org> 1493380827 +0100

NeoMutt release 20170428 (1.8.2)
gpg: Signature made Fri 28 Apr 2017 13:00:27 BST using RSA key ID 5FAF0A6EE7371805
gpg: Good signature from "Richard Russon (NeoMutt) <rich@flatcap.org>" [full]
```

```sh
git checkout -b neomutt-20170428
# build
```

## Source example <a id="source-example"></a>

Download a source package and the CHECKSUM file from the
[release page](https://github.com/neomutt/neomutt/releases/latest)

```sh
wget https://github.com/neomutt/neomutt/archive/neomutt-20170428.tar.gz
wget https://github.com/neomutt/neomutt/releases/download/neomutt-20170428/neomutt-20170428-CHECKSUM

gpg2 --verify neomutt-20170428-CHECKSUM
```

```reply
gpg: Signature made Sun 30 Apr 2017 23:39:42 BST using RSA key ID 5FAF0A6EE7371805
gpg: Good signature from "Richard Russon (NeoMutt) <rich@flatcap.org>" [full]
```

```sh
sha256sum -c neomutt-20170428-CHECKSUM
```

```reply
neomutt-20170428.tar.gz: OK
```

```sh
# extract source
# build
```

