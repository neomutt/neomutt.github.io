---
layout: concertina
title: Signing Code / Releases
description: Be Sure You're Getting the Real Thing
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

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
gpg --search-keys neomutt
```

```reply
gpg: data source: https://192.146.137.98:443
(1)     Richard Russon (NeoMutt) <rich@flatcap.org>
          4096 bit RSA key 5FAF0A6EE7371805, created: 2016-04-08, expires: 2021-04-09
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
git tag -v 20191111
```

```reply
object b39b9b4bf3181a653b1186af98fd724be31d7cb9
type commit
tag 20191111
tagger Richard Russon <rich@flatcap.org> 1573435069 +0000

NeoMutt release 2019-11-11
gpg: Signature made Mon 11 Nov 2019 01:17:49 GMT
gpg:                using RSA key 86C2397270DD7A561263CA4E5FAF0A6EE7371805
gpg:                issuer "rich@flatcap.org"
gpg: Good signature from "Richard Russon (NeoMutt) <rich@flatcap.org>" [ultimate]
```

```sh
git checkout -b 20191111
# build
```

## Source example <a id="source-example"></a>

Download a source package and the CHECKSUM file from the
[release page](https://github.com/neomutt/neomutt/releases/latest)

```sh
wget https://github.com/neomutt/neomutt/archive/20191111.tar.gz
wget https://github.com/neomutt/neomutt/releases/download/20191111/20191111-CHECKSUM

gpg --verify 20191111-CHECKSUM
```

```reply
gpg: Signature made Sun 30 Apr 2017 23:39:42 BST using RSA key ID 5FAF0A6EE7371805
gpg: Good signature from "Richard Russon (NeoMutt) <rich@flatcap.org>" [full]
```

```sh
sha256sum -c 20191111-CHECKSUM
```

```reply
20191111.tar.gz: OK
```

```sh
# extract source
# build
```

