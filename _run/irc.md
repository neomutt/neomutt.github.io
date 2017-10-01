---
layout: concertina
title: IRC
description: How to run an IRC channel
author: Richard Russon
---

# {{ page.title }}

NeoMutt has an IRC channel: **#neomutt** on
[irc://irc.freenode.net/neomutt](irc://irc.freenode.net/neomutt)

This is a list of useful commands to help run our IRC channel.

## Getting started

**Register Nick:**

Before you can become a channel operator, you need to register your nick. This
will prevent other people from impersonating you.

```
/msg nickserv register <password> <email>
```

Then validate your email address. Each time you connect to the server, you can
then identify yourself:

```
/msg nickserv identify <password>
```

**Register Channel:**

Registering a channel prevents others taking it over when you're not present.

```
/msg chanserv register #<channel>
```

## User privs

**Show User Privs:**

Print a list of users who can administer the channel:

```
/msg chanserv access #<channel> list
```

**Set User Privs:**

First, get a list of available flags:

```
/msg chanserv help flags
```

Then set flags on a user:

- "__+__" Add privs
- "__-__" Remove privs
- "__*__" All privs (except Founder)

```
/msg chanserv flags #<channel> <username> +*F
/msg chanserv flags #<channel> <username> -OV
```

## Channel privs

**Show Channel Privs:**

```
/msg chanserv info #<channel>
```

**Set Channel Privs:**

```
/msg chanserv set #<channel> url <url>
/msg chanserv set #<channel> email <email>
```

## Managing the channel

**Op User:** (take operator privs)

```
/msg chanserv op #<channel> <username>
```

**Deop User:** (drop operator privs)

```
/msg chanserv deop #<channel> <username>
```

**Change Topic:** (as an operator)

```
/topic
```

**Kick:** (as an operator)

```
/kick <username>
```

**Ban:** (as an operator)

```
/mode #<channel> +b <filter>
```

Where the filter is of the form: `nick!user@host` (with "\*" as a wildcard).

