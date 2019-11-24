---
layout: concertina
title: Roadmap
description: The Future of NeoMutt
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include roadmap-links.html %}

This is a rough guide to some of the bigger goals for NeoMutt.  
Some of the ideas will take a long time to become real...

Unless you help :-)

**Table of Contents**

- [Config System](#config-system) -- Validation and notification
- [Accounts](#accounts) -- User-defined accounts and account-specific config
- [libconn](#libconn) -- Make network connection code independent of NeoMutt
- [libimap](#libimap) -- Make IMAP code independent of NeoMutt
- [Summary Pages](#summary-pages) -- Add lots of commands to display useful info
- [Help System](#help-system) -- Make it easier to find the help you need
- [Nested Windows](#nested-windows) -- Change GUI architecture
- [Mouse Support](#mouse-support) -- Make mouse clicks useful
- [Colours/Attrs](#coloursattrs) -- Better colour and attribute support
- [OAuth2 Support](#oauth2-support) -- Support OAuth2 Authentication
- [Browser Rewrite](#browser-rewrite) -- Rebuild the file/folder browser

## Config System

**Description**: Validation and notification  
**Status**: In progress

Refactor the handling of config items to define types, enable notifications
and perform validation.  
Most of these changes won't be visible to the user.

## Accounts

**Description**: User-defined accounts and account-specific config  
**Status**: Blocked by [Config System](#config-system)

Create an `account` object that has its own config.  This will simplify the
setup for multiple accounts and remove the need for many hooks.

## libconn

**Description**: Make network connection code independent of NeoMutt  
**Status**: Started

Making the code independent of NeoMutt will make it easier to maintain and
test.

## libimap

**Description**: Make IMAP code independent of NeoMutt  
**Status**: Blocked by [libconn](#libconn)

Making the code independent of NeoMutt will make it easier to maintain and
test.

## Summary Pages

**Description**: Add lots of commands to display useful info  
**Status**: Started  
**See also**: [https://github.com/neomutt/neomutt/issues/162](https://github.com/neomutt/neomutt/issues/162)

There are lots of possibilities:
- `:color` display all NeoMutt's colours
- `:set` display variables that have been set
- `:messages` display the recent messages / errors

## Help System

**Description**: Make it easier to find the help you need  
**Status**: Future

Everything's documented in NeoMutt, but too often users can't find what they
need to know.  Change the Guide to be more task-oriented.  Make it easier for
users to contribute to the Guide.

## Nested Windows

**Description**: Change GUI architecture  
**Status**: Future

Replace the five standard windows: Index, Message, Help, Sidebar, Status
with a nested set.  This would simplify the redrawing and the key binding
logic.  This would be the first step to an MVC architecture.

## Mouse Support

**Description**: Make mouse clicks useful  
**Status**: Blocked by [Nested Windows](#nested-windows)

NeoMutt already has some mouse support (try your mouse wheel in the index).  
It should be pretty simple to turn ncurses mouse events into functions like:
- Index: `<display-message>`
- Sidebar: `<sidebar-open>`
- Compose: `<edit-to>`

## Colours/Attrs

**Description**:  Better colour and attribute support  
**Status**: Future

Curses severely limits how NeoMutt can display colours and attributes.
Many other curses applications manage colour display themselves.  Using Vim
as a model, allow the user to pick and mix colours, attributes and
transparency.

## OAuth2 Support

**Description**: Support OAuth2 Authentication  
**Status**: Future

Supporting OAuth2 doesn't require many changes to NeoMutt.
Initially, NeoMutt would ask the server for a token and get the user to
visit the server's website.  This saved token can then be used to login to
the server for POP/IMAP/SMTP connections.

## Browser Rewrite

**Description**: Rebuild the file/folder browser  
**Status**: Future

NeoMutt's browser is complicated to use and has dependencies on all the
major mailbox types.  It needs to be made independent.

