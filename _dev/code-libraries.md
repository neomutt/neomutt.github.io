---
layout: concertina
title: Code Libraries
description: Sharing to untangle NeoMutt's code
---

# {{ page.title }}

Each library helps to untangle the code by grouping similar functions and reducing dependencies.

The goal is that each library is:
- Self-contained (it may rely on other libraries)
- Independently testable (i.e. without using NeoMutt)
- Fully documented
- Robust

## libmutt - Library of shared functions

**Description:** Shared code for handling strings, files, dates, etc
**Dependencies:** None
**Documentation:** Full

**To Do:**
- Make functions more robust
- Create tests

## libhcache - Header cache API

**Description:** Six database backends for storing email headers
**Dependencies:** Some
- Global variables
- Some NeoMutt functions
**Documentation:** Full

**To Do:**
- Make the Header Cache independent of NeoMutt 

## libimap - IMAP Network Mailbox

**Description:** Handle connection and data transfer for an IMAP server
**Dependencies:** Some
- Global variables
- Many NeoMutt functions
**Documentation:** Full

**To Do:**
- Reduce its dependencies to libmutt and libconn

## libconn - Connection Library

**Description:** Network connections and their encryption
**Dependencies:** Lots
- Global variables
- Some NeoMutt functions
**Documentation:** Full

**To Do:**
- Remove its dependencies on NeoMutt functions

## libncrypt - API for encryption/signing of emails

**Description:** Encrypt/decrypt/sign/verify emails
**Dependencies:** Lots
- Global variables
- Many NeoMutt functions
**Documentation:** Partial

**To Do:**
- Reduce complexity
- Separate PGP and SMIME APIs
- Document
