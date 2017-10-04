---
layout: concertina
title: Renamed Files
---

# {{ page.title }}

Many files have been renamed or moved by NeoMutt

## Overview

### Hyphens

These files have had their hyphens (dashes) replaced with an underscore.

| Old Name                  | New Name                  |
| :------------------------ | :------------------------ |
| crypt-gpgme.c             | crypt_gpgme.c             |
| crypt-gpgme.h             | crypt_gpgme.h             |
| crypt-mod-pgp-classic.c   | crypt_mod_pgp_classic.c   |
| crypt-mod-pgp-gpgme.c     | crypt_mod_pgp_gpgme.c     |
| crypt-mod-smime-classic.c | crypt_mod_smime_classic.c |
| crypt-mod-smime-gpgme.c   | crypt_mod_smime_gpgme.c   |
| crypt-mod.c               | crypt_mod.c               |
| crypt-mod.h               | crypt_mod.h               |
| doc/makedoc-defs.h        | doc/makedoc_defs.h        |
| hcache-backend.h          | hcache_backend.h          |
| hcache-bdb.c              | hcache_bdb.c              |
| hcache-gdbm.c             | hcache_gdbm.c             |
| hcache-kc.c               | hcache_kc.c               |
| hcache-lmdb.c             | hcache_lmdb.c             |
| hcache-qdbm.c             | hcache_qdbm.c             |
| hcache-tc.c               | hcache_tc.c               |

### Ncrypt

The source files dealing with encryption / signing have been moved to the ncrypt
directory.

| Old Name      | New Name             |
| :------------ | :------------------- |
| crypt.c       | ncrypt/crypt.c       |
| cryptglue.c   | ncrypt/cryptglue.c   |
| crypt_gpgme.c | ncrypt/crypt_gpgme.c |
| crypt_gpgme.h | ncrypt/crypt_gpgme.h |
| crypt_mod.c   | ncrypt/crypt_mod.c   |
| crypt_mod.h   | ncrypt/crypt_mod.h   |
| gnupgparse.c  | ncrypt/gnupgparse.c  |
| mutt_crypt.h  | ncrypt/ncrypt.h      |
| pgp.c         | ncrypt/pgp.c         |
| pgp.h         | ncrypt/pgpinvoke.h   |
| pgpinvoke.c   | ncrypt/pgpinvoke.c   |
| pgpkey.c      | ncrypt/pgpkey.c      |
| pgplib.c      | ncrypt/pgplib.c      |
| pgplib.h      | ncrypt/pgplib.h      |
| pgpmicalg.c   | ncrypt/pgpmicalg.c   |
| pgppacket.c   | ncrypt/pgppacket.c   |
| pgppacket.h   | ncrypt/pgppacket.h   |
| smime.c       | ncrypt/smime.c       |
| smime.h       | ncrypt/smime.h       |

### Hcache

The source files dealing with the header cache have been moved to the hcache
directory.

| Old Name         | New Name            |
| :--------------- | :------------------ |
| hcache.c         | hcache/hcache.c     |
| hcache.h         | hcache/hcache.h     |
| hcachever.sh.in  | hcache/hcachever.sh |
| hcache_backend.h | hcache/backend.h    |
| hcache_bdb.c     | hcache/bdb.c        |
| hcache_gdbm.c    | hcache/gdbm.c       |
| hcache_kc.c      | hcache/kc.c         |
| hcache_lmdb.c    | hcache/lmdb.c       |
| hcache_qdbm.c    | hcache/qdbm.c       |
| hcache_tc.c      | hcache/tc.c         |

