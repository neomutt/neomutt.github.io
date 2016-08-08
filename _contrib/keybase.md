---
layout: contrib
title: Keybase
description: Keybase Integration
author: Joshua Jordi
username: JakkinStewart
status: devel
branch: contrib/keybase
base: neomutt
---

# KeybaseMutt

A work in progress. KeybaseMutt exists to let its users utilize Keybase within mutt. (Unfortunately, not natively (yet).)

## Quick start

Run the install script. It will set up the directory's and paths for you. Do what it says or suffer the consequences!

Then just throw these into your .muttrc

`set editor = 'echo %s > ~/.mutt/keybaseMutt/.tmp; vim %s'`

`macro compose K "<enter-command>unset wait_key<enter><shell-escape>python ~/.mutt/keybaseMutt/keybase.py<enter><enter-command>set wait_key<enter>`

Done!

Check out the [Github page](https://github.com/neomutt/neomutt/tree/contrib/keybase) for the full documentation.
