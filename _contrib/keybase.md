---
layout: concertina
title: Keybase
description: Keybase Integration
author: Joshua Jordi
username: JakkinStewart
status: devel
dir: keybase
---

# KeybaseMutt

A work in progress. KeybaseMutt exists to let its users utilize Keybase within
NeoMutt. (Unfortunately, not natively (yet).)

## Quick start

Run the install script. It will set up the directory's and paths for you. Do
what it says or suffer the consequences!

Then just throw these into your .muttrc

`set editor = 'echo %s > ~/.neomutt/keybaseMutt/.tmp; vim %s'`

`macro compose K "<enter-command>unset wait_key<enter><shell-escape>python ~/.neomutt/keybaseMutt/keybase.py<enter><enter-command>set wait_key<enter>`

Done!

Check out the
[GitHub page](https://github.com/neomutt/neomutt/tree/master/contrib/keybase)
for the full documentation.

