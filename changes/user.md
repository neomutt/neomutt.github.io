---
layout: concertina
title: NeoMutt -- A User's View
---

# {{ page.title }}

NeoMutt has many improvements over Mutt. Below is a list of all the
differences between Mutt and NeoMutt.

This guide is correct as of Mutt-1.8.3 and NeoMutt-20170609. It is written for
**users** of NeoMutt. If you're a developer, see the
[Developer's View](devel).

## Removed from NeoMutt

NeoMutt wants to remain compatible with Mutt, but it also wants to improve the
user's experience.  To achieve this, NeoMutt has added many features to Mutt and
removed very little.

NeoMutt is focusing on supporting [modern architectures / OSs](/dev/architectures).
These platforms are not supported:

- AIX
- SunOS
- Ultrix

### Features

**`mutt_dotlock`** The only feature that has been removed from NeoMutt is
`mutt_dotlock`.  It was a primitive file-locking program which was needed when
Mutt was young and network filesystems weren't as reliable as they are now.

**See also**: [List of NeoMutt features](/feature.html)

### Variables

Two obsolete variables have been removed from NeoMutt.

- `dotlock_program` -- Command is obsolete
- `smime_sign_opaque_command` -- Variable wasn't used

There are 24 synonyms (aliases) for variables in NeoMutt
These old names haven't been in the documentation for over ten years.

| Obsolete Name            | Correct Name                                                 |
| :----------------------- | :----------------------------------------------------------- |
| `edit_hdrs`              | [edit_headers](/guide/reference#edit-headers)                |
| `envelope_from`          | [use_envelope_from](/guide/reference#use-envelope-from)      |
| `forw_decode`            | [forward_decode](/guide/reference#mime-forward-decode)       |
| `forw_decrypt`           | [forward_decrypt](/guide/reference#mime-forward-decode)      |
| `forw_format`            | [forward_format](/guide/reference#mime-forward-decode)       |
| `forw_quote`             | [forward_quote](/guide/reference#forward-quote)              |
| `hdr_format`             | [index_format](/guide/reference#index-format)                |
| `indent_str`             | [indent_string](/guide/reference#sidebar-indent-string)      |
| `mime_fwd`               | [mime_forward](/guide/reference#mime-forward)                |
| `msg_format`             | [message_format](/guide/reference#mime-forward)              |
| `pgp_autoencrypt`        | [crypt_autoencrypt](/guide/reference#forward-quote)          |
| `pgp_autosign`           | [crypt_autosign](/guide/reference#crypt-autosign)            |
| `pgp_auto_traditional`   | [pgp_replyinline](/guide/reference#crypt-autosign)           |
| `pgp_create_traditional` | [pgp_autoinline](/guide/reference#pgp-autoinline)            |
| `pgp_replyencrypt`       | [crypt_replyencrypt](/guide/reference#crypt-replyencrypt)    |
| `pgp_replysign`          | [crypt_replysign](/guide/reference#crypt-replysign)          |
| `pgp_replysignencrypted` | [crypt_replysignencrypted](/guide/reference#crypt-replysign) |
| `pgp_verify_sig`         | [crypt_verify_sig](/guide/reference#crypt-verify-sig)        |
| `post_indent_str`        | [post_indent_string](/guide/reference#crypt-verify-sig)      |
| `print_cmd`              | [print_command](/guide/reference#print-command)              |
| `smime_sign_as`          | [smime_default_key](/guide/reference#smime-default-key)      |
| `xterm_icon`             | [ts_icon_format](/guide/reference#ts-icon-format)            |
| `xterm_set_titles`       | [ts_enabled](/guide/reference#ts-enabled)                    |
| `xterm_title`            | [ts_status_format](/guide/reference#ts-status-format)        |

These synonyms are still accepted by NeoMutt, but they will soon be deprecated.
First there will be an announcement; then warning messages in NeoMutt; then
finally they will be removed.

**Please update your config.**

### Functions

No functions have been removed from NeoMutt.

### Commands

No commands have been removed from NeoMutt.

### Colours

No colours have been removed from NeoMutt.

### Translations

No translations have been removed from NeoMutt, however one undocumented menu
option has been dropped from the crypto code.  This won't be noticed by the
users, but will simplify translations.

### Contrib

NeoMutt has removed `ca-bundle.crt` from the contrib section.
It's now expected that the host system provides it.

## Changed in NeoMutt

NeoMutt is moving forward and some things are getting changed.

### Features

These seven features have changed slightly -- they were adopted by upstream Mutt!

| Feature                                     | Description                                       | In NeoMutt | In Mutt            |
| :------------------------------------------ | :------------------------------------------------ | :--------- | :----------------- |
| [Compressed Folders](/feature/compress)     | Read from/write to compressed mailboxes           | 2016-05-30 | 2016-12-04 (1.7.2) |
| [Encrypt-to-Self](/feature/encrypt-to-self) | Save a self-encrypted copy of emails              | 2016-07-23 | 2017-05-30 (1.8.3) |
| [Kyoto Cabinet](/feature/kyoto-cabinet)     | Kyoto Cabinet backend for the header cache        | 2016-10-02 | 2017-04-12 (1.8.1) |
| [LMDB](/feature/lmdb)                       | LMDB backend for the header cache                 | 2016-07-23 | 2017-04-12 (1.8.1) |
| [Sidebar](/feature/sidebar)                 | Overview of mailboxes                             | 2016-03-07 | 2016-07-06 (1.6.2) |
| [TLS-SNI](/feature/tls-sni)                 | Negotiate with a server for a TLS/SSL certificate | 2016-03-07 | 2017-04-12 (1.8.1) |
| [Trash Folder](/feature/trash)              | Automatically move deleted emails to a trash bin  | 2016-03-07 | 2016-08-18 (1.7.0) |

Mutt now supports the same six header-cache backends, but there is one important
difference.  Mutt can only compile-in one backend: NeoMutt can have several
backends.  This allows distros to offer their users a choice.

### Variables

If you have upgraded from a very old version of NeoMutt, it might be necessary
to update some of your sidebar config.  The names were changed to better match
NeoMutt's other variables.

| Old Name               | New Name                                                        |
| :--------------------- | :-------------------------------------------------------------- |
| `sidebar_delim`        | [sidebar_divider_char](/guide/reference#sidebar-divider-char)   |
| `sidebar_folderindent` | [sidebar_folder_indent](/guide/reference#sidebar-folder-indent) |
| `sidebar_indentstr`    | [sidebar_indent_string](/guide/reference#sidebar-indent-string) |
| `sidebar_newmail_only` | [sidebar_new_mail_only](/guide/reference#sidebar-new-mail-only) |
| `sidebar_shortpath`    | [sidebar_short_path](/guide/reference#sidebar-short-path)       |
| `sidebar_sort`         | [sidebar_sort_method](/guide/reference#sidebar-sort-method)     |

### Functions

These very old sidebar functions were also renamed.

| Old Name              | New Name                                        |
| :-------------------- | :---------------------------------------------- |
| `sidebar-scroll-down` | [sidebar-page-down](/guide/reference#index-map) |
| `sidebar-scroll-up`   | [sidebar-page-up](/guide/reference#index-map)   |

### Commands

No commands have been changed in NeoMutt.

### Colours

No colours have been changed in NeoMutt.

### Translations

The translation files have all been unified:

- Converted to UTF-8
- Standard headers

NeoMutt has [updated translations](/translate) of:

- German
- Slovak
- Spanish

### Contrib

No user contributions have been changed in NeoMutt.

## Added to NeoMutt

Now the fun bit: all the things that NeoMutt has, that Mutt doesn't.

### Features

These are the major features of NeoMutt.

| Feature                                               | Description                                                       | Since      | Status   |
| :---------------------------------------------------- | :---------------------------------------------------------------- | :--------- | :------- |
| [Attach Headers Color](/feature/attach-headers-color) | Color attachment headers using regexp, just like mail bodies      | 2016-09-10 | stable   |
| [Compose to Sender](/feature/compose-to-sender)       | Send new mail to the sender of the current mail                   | 2016-10-02 | stable   |
| [Conditional Dates](/feature/cond-date)               | Use rules to choose date format                                   | 2016-03-07 | stable   |
| [Fmemopen](/feature/fmemopen)                         | Replace some temporary files with memory buffers                  | 2016-03-07 | disabled |
| [Forgotten Attachment](/feature/forgotten-attachment) | Alert user when they forget to attach a file to an outgoing email | 2016-09-10 | stable   |
| [Global Hooks](/feature/global-hooks)                 | Define actions to run globally within Mutt                        | 2016-08-08 | stable   |
| [Ifdef](/feature/ifdef)                               | Conditional config options                                        | 2016-03-07 | stable   |
| [Index Color](/feature/index-color)                   | Custom rules for theming the email index                          | 2016-03-07 | stable   |
| [Initials Expando](/feature/initials)                 | Expando for author's initials                                     | 2016-03-07 | stable   |
| Keywords                                              | Labels/Tagging for emails                                         | 2016-05-30 | stable   |
| [Limit Current Thread](/feature/limit-current-thread) | Focus on one Email Thread                                         | 2016-03-28 | stable   |
| [Multiple FCC](/feature/multiple-fcc)                 | Save multiple copies of outgoing mail                             | 2016-08-08 | stable   |
| [Nested If](/feature/nested-if)                       | Allow complex nested conditions in format strings                 | 2016-03-07 | stable   |
| [New Mail](/feature/new-mail)                         | Execute a command upon the receipt of new mail                    | 2016-07-23 | stable   |
| [NNTP](/feature/nntp)                                 | Talk to a Usenet news server                                      | 2016-05-30 | stable   |
| [Notmuch](/feature/notmuch)                           | Email search engine                                               | 2016-03-17 | stable   |
| [Progress Bar](/feature/progress)                     | Show a visual progress bar on slow operations                     | 2016-03-07 | stable   |
| [Quasi-Delete](/feature/quasi-delete)                 | Mark emails that should be hidden, but not deleted                | 2016-03-07 | stable   |
| [Reply With X-Original-To](/feature/reply-with-xorig) | Direct reply to email using X-Original-To header                  | 2016-09-10 | stable   |
| [Sensible Browser](/feature/sensible-browser)         | Make the file browser behave                                      | 2016-09-10 | stable   |
| [Skip Quoted](/feature/skip-quoted)                   | Leave some context visible                                        | 2016-03-28 | stable   |
| [Status Color](/feature/status-color)                 | Custom rules for theming the status bar                           | 2016-03-07 | stable   |

Here are some other/smaller features/changes:

| Feature                                                     | Desription                                     |
| :---------------------------------------------------------- | :--------------------------------------------- |
| Lua                                                         | Basic Lua Scripting                            |
| DNS                                                         | Faster DNS lookups (`getdnsdomainname()`)      |
| [Purge](/feature/trash)                                     | Command to bypass the trash folder             |
| Interrupt                                                   | Allow the user to interrupt slow IO operations |
| [Rename Attachment](/guide/reference#compose-map)           | Allow the user to rename attachments           |
| [Bind Warnings](/guide/configuration#bind-warnings)         | Create source warnings for binding aliases     |
| [Relative Ranges](/guide/advancedusage.html#message-ranges) | Extend the m pattern to allow relative ranges  |

### Hooks

NeoMutt has some extra hooks:

| Hook                              | Run...                            |
| :-------------------------------- | :-------------------------------- |
| [startup](/feature/global-hooks)  | before opening the first folder   |
| [shutdown](/feature/global-hooks) | just before exiting NeoMutt       |
| [timeout](/feature/global-hooks)  | at least every `$timeout` seconds |
| [new-mail](/feature/new-mail)     | when new mail arrives             |

### Command Line

NeoMutt has some extra command line options:

| Command Line Option | Used by                                                  | Description                        |
| :------------------ | :------------------------------------------------------- | :--------------------------------- |
| `-B`                | Lua                                                      | batch mode                         |
| `-g`                | [NNTP](/feature/nntp)                                    | server                             |
| `-G`                | [NNTP](/feature/nntp)                                    | group                              |
| `-DS` or `-D -S`    | [General](/guide/reference.html#tab-commandline-options) | conceal sensitive / secret options |

The output of `mutt -v` has been tidied and coloured to make it easier to read.
It also lists the header-cache backends available.

There are some changes that affect config files.
- NeoMutt now reads from [XDG config directories](/guide/configuration)
- The `source` [command is relative](/guide/configuration.html#source)

Finally, if NeoMutt is compiled with debug support, then the log file can be
enabled whilst within NeoMutt.

```
set debug_level = 2
set debug_file = ~/neomutt.log
```

### Variables

| Variable                           | Owner / Description                                                                |
| :--------------------------------- | :--------------------------------------------------------------------------------- |
| `collapse_all`                     | [Collapse threads when entering folder](/guide/reference#collapse-all)             |
| `debug_file`                       | [Dynamically set the log file](/guide/reference#debug-file)                        |
| `debug_level`                      | [Dynamically set the log level](/guide/reference#debug-level)                      |
| `empty_subject`                    | [Configure a subject replacement](/guide/reference#empty-subject)                  |
| `flag_chars`                       | [Configurable flag chars in index](/guide/reference#flag-chars)                    |
| `forward_references`               | [Set 'In-Reply-To:', 'References:'](/guide/reference#forward-references)           |
| `from_chars`                       | [Abbreviates for 'From' field in index](/guide/reference#from-chars)               |
| `header_cache_backend`             | [Which hcache backend should be used](/guide/reference#header-cache-backend)       |
| `show_multipart_alternative`       | [How are multi-part emails displayed](/guide/reference#show-multipart-alternative) |
| `abort_noattach`                   | [Forgotten Attachment](/feature/forgotten-attachment)                              |
| `attach_keyword`                   | [Forgotten Attachment](/feature/forgotten-attachment)                              |
| `keywords_legacy`                  | Keywords                                                                           |
| `keywords_standard`                | Keywords                                                                           |
| `xlabel_delimiter`                 | Keywords                                                                           |
| `new_mail_command`                 | [New Mail](/feature/new-mail)                                                      |
| `ask_follow_up`                    | [NNTP](/feature/nntp)                                                              |
| `ask_x_comment_to`                 | [NNTP](/feature/nntp)                                                              |
| `catchup_newsgroup`                | [NNTP](/feature/nntp)                                                              |
| `followup_to_poster`               | [NNTP](/feature/nntp)                                                              |
| `group_index_format`               | [NNTP](/feature/nntp)                                                              |
| `inews`                            | [NNTP](/feature/nntp)                                                              |
| `mime_subject`                     | [NNTP](/feature/nntp)                                                              |
| `news_cache_dir`                   | [NNTP](/feature/nntp)                                                              |
| `newsgroups_charset`               | [NNTP](/feature/nntp)                                                              |
| `newsrc`                           | [NNTP](/feature/nntp)                                                              |
| `news_server`                      | [NNTP](/feature/nntp)                                                              |
| `nntp_authenticators`              | [NNTP](/feature/nntp)                                                              |
| `nntp_context`                     | [NNTP](/feature/nntp)                                                              |
| `nntp_listgroup`                   | [NNTP](/feature/nntp)                                                              |
| `nntp_load_description`            | [NNTP](/feature/nntp)                                                              |
| `nntp_pass`                        | [NNTP](/feature/nntp)                                                              |
| `nntp_poll`                        | [NNTP](/feature/nntp)                                                              |
| `nntp_user`                        | [NNTP](/feature/nntp)                                                              |
| `post_moderated`                   | [NNTP](/feature/nntp)                                                              |
| `save_unsubscribed`                | [NNTP](/feature/nntp)                                                              |
| `show_new_news`                    | [NNTP](/feature/nntp)                                                              |
| `show_only_unread`                 | [NNTP](/feature/nntp)                                                              |
| `x_comment_to`                     | [NNTP](/feature/nntp)                                                              |
| `nm_db_limit`                      | [Notmuch](/feature/notmuch)                                                        |
| `nm_default_uri`                   | [Notmuch](/feature/notmuch)                                                        |
| `nm_exclude_tags`                  | [Notmuch](/feature/notmuch)                                                        |
| `nm_hidden_tags`                   | [Notmuch](/feature/notmuch)                                                        |
| `nm_open_timeout`                  | [Notmuch](/feature/notmuch)                                                        |
| `nm_query_type`                    | [Notmuch](/feature/notmuch)                                                        |
| `nm_query_window_current_position` | [Notmuch](/feature/notmuch)                                                        |
| `nm_query_window_current_search`   | [Notmuch](/feature/notmuch)                                                        |
| `nm_query_window_duration`         | [Notmuch](/feature/notmuch)                                                        |
| `nm_query_window_timebase`         | [Notmuch](/feature/notmuch)                                                        |
| `nm_record`                        | [Notmuch](/feature/notmuch)                                                        |
| `nm_record_tags`                   | [Notmuch](/feature/notmuch)                                                        |
| `nm_unread_tag`                    | [Notmuch](/feature/notmuch)                                                        |
| `vfolder_format`                   | [Notmuch](/feature/notmuch)                                                        |
| `virtual_spoolfile`                | [Notmuch](/feature/notmuch)                                                        |
| `reply_with_xorig`                 | [Reply With X-Original-To](/feature/reply-with-xorig)                              |
| `sidebar_on_right`                 | [Sidebar](/feature/sidebar)                                                        |
| `skip_quoted_offset`               | [Skip Quoted](/feature/skip-quoted)                                                |

### Functions

**Index Menu**

| Function                    | Feature                                               |
| :-------------------------- | :---------------------------------------------------- |
| `compose-to-sender`         | [Compose to Sender](/feature/compose-to-sender)       |
| `limit-current-thread`      | [Limit Current Thread](/feature/limit-current-thread) |
| `catchup`                   | [NNTP](/feature/nntp)                                 |
| `change-newsgroup`          | [NNTP](/feature/nntp)                                 |
| `change-newsgroup-readonly` | [NNTP](/feature/nntp)                                 |
| `followup-message`          | [NNTP](/feature/nntp)                                 |
| `forward-to-group`          | [NNTP](/feature/nntp)                                 |
| `get-children`              | [NNTP](/feature/nntp)                                 |
| `get-message`               | [NNTP](/feature/nntp)                                 |
| `get-parent`                | [NNTP](/feature/nntp)                                 |
| `post-message`              | [NNTP](/feature/nntp)                                 |
| `reconstruct-thread`        | [NNTP](/feature/nntp)                                 |
| `toggle-read`               | [NNTP](/feature/nntp)                                 |
| `change-vfolder`            | [Notmuch](/feature/notmuch)                           |
| `entire-thread`             | [Notmuch](/feature/notmuch)                           |
| `modify-labels`             | [Notmuch](/feature/notmuch)                           |
| `modify-labels-then-hide`   | [Notmuch](/feature/notmuch)                           |
| `sidebar-toggle-virtual`    | [Notmuch](/feature/notmuch)                           |
| `vfolder-from-query`        | [Notmuch](/feature/notmuch)                           |
| `vfolder-window-backward`   | [Notmuch](/feature/notmuch)                           |
| `vfolder-window-forward`    | [Notmuch](/feature/notmuch)                           |
| `quasi-delete`              | [Quasi-Delete](/feature/quasi-delete)                 |
| `purge-thread`              | [Trash](/feature/trash)                               |

**Pager Menu**

| Function                    | Feature                                         |
| :-------------------------- | :---------------------------------------------- |
| `compose-to-sender`         | [Compose to Sender](/feature/compose-to-sender) |
| `change-newsgroup`          | [NNTP](/feature/nntp)                           |
| `change-newsgroup-readonly` | [NNTP](/feature/nntp)                           |
| `followup-message`          | [NNTP](/feature/nntp)                           |
| `forward-to-group`          | [NNTP](/feature/nntp)                           |
| `post-message`              | [NNTP](/feature/nntp)                           |
| `reconstruct-thread`        | [NNTP](/feature/nntp)                           |
| `change-vfolder`            | [Notmuch](/feature/notmuch)                     |
| `entire-thread`             | [Notmuch](/feature/notmuch)                     |
| `modify-labels`             | [Notmuch](/feature/notmuch)                     |
| `modify-labels-then-hide`   | [Notmuch](/feature/notmuch)                     |
| `sidebar-toggle-virtual`    | [Notmuch](/feature/notmuch)                     |
| `vfolder-from-query`        | [Notmuch](/feature/notmuch)                     |
| `quasi-delete`              | [Quasi-Delete](/feature/quasi-delete)           |
| `purge-thread`              | [Trash](/feature/trash)                         |

**Attach Menu**

| Function           | Feature               |
| :----------------- | :-------------------- |
| `followup-message` | [NNTP](/feature/nntp) |
| `forward-to-group` | [NNTP](/feature/nntp) |

**Compose Menu**

| Function              | Feature               |
| :-------------------- | :-------------------- |
| `attach-news-message` | [NNTP](/feature/nntp) |
| `edit-followup-to`    | [NNTP](/feature/nntp) |
| `edit-newsgroups`     | [NNTP](/feature/nntp) |
| `edit-x-comment-to`   | [NNTP](/feature/nntp) |

**Browser Menu**

| Function                  | Feature                                       |
| :------------------------ | :-------------------------------------------- |
| `catchup`                 | [NNTP](/feature/nntp)                         |
| `goto-folder`             | [Sensible Browser](/feature/sensible-browser) |
| `reload-active`           | [NNTP](/feature/nntp)                         |
| `subscribe-pattern`       | [NNTP](/feature/nntp)                         |
| `uncatchup`               | [NNTP](/feature/nntp)                         |
| `unsubscribe-pattern`     | [NNTP](/feature/nntp)                         |

### Commands

| Command               | Feature                               |
| :-------------------- | :------------------------------------ |
| `shutdown-hook`       | [Global Hooks](/feature/global-hooks) |
| `startup-hook`        | [Global Hooks](/feature/global-hooks) |
| `timeout-hook`        | [Global Hooks](/feature/global-hooks) |
| `finish`              | [Ifdef](/feature/ifdef)               |
| `ifdef`               | [Ifdef](/feature/ifdef)               |
| `ifndef`              | [Ifdef](/feature/ifdef)               |
| `lua`                 | Lua Scripting                         |
| `lua-source`          | Lua Scripting                         |
| `tag-formats`         | [Notmuch](/feature/notmuch)           |
| `tag-transforms`      | [Notmuch](/feature/notmuch)           |
| `unvirtual-mailboxes` | [Notmuch](/feature/notmuch)           |
| `virtual-mailboxes`   | [Notmuch](/feature/notmuch)           |

### Format Strings

Some of NeoMutt's formatting strings have extra expandos.

**index_format**, forward_format, message_format, pager_format:

| Expando | Description                                                       |
| :------ | :---------------------------------------------------------------- |
| %G      | transformed notmuch tags                                          |
| %g      | message labels (e.g. notmuch tags)                                |
| %I      | initials of author                                                |
| %K      | the list to which the letter was sent (if any; otherwise: empty)  |
| %q      | newsgroup name (if compiled with NNTP support)                    |
| %W      | name of organization of author ("Organization:" field)            |
| %x      | "X-Comment-To:" field (if present and compiled with NNTP support) |
| %zs     | message status flags                                              |
| %zc     | message crypto flags                                              |
| %zt     | message tag flags                                                 |

The **group_index_format** is used to display lists of newsgroups:

| Expando | Description                                                      |
| :------ | :--------------------------------------------------------------- |
| %C      | current newsgroup number                                         |
| %d      | description of newsgroup (becomes from server)                   |
| %f      | newsgroup name                                                   |
| %M      | if newsgroup not allowed for direct post (moderated for example) |
| %N      | N if newsgroup is new, u if unsubscribed, blank otherwise        |
| %n      | number of new articles in newsgroup                              |
| %s      | number of unread articles in newsgroup                           |

The **vfolder_format** is used to display list of virtual mailboxes:

| Expando | Description                                                               |
| :------ | :------------------------------------------------------------------------ |
| %C      | current file number                                                       |
| %d      | date/time folder was last modified                                        |
| %D      | date/time folder was last modified using $date_format                     |
| %f      | filename ("/" is appended for dirs, "@" to symlinks and "*" to exe files) |
| %F      | file permissions                                                          |
| %g      | group name (or numeric gid, if missing)                                   |
| %l      | number of hard links                                                      |
| %m      | number of messages in the mailbox                                         |
| %n      | number of unread messages in the mailbox                                  |
| %N      | N if mailbox has new mail, blank otherwise                                |
| %s      | size in bytes                                                             |
| %t      | "*" if the file is tagged, blank otherwise                                |
| %u      | owner name (or numeric uid, if missing)                                   |

### Colours

| Colour             | Feature                                               |
| :----------------- | :---------------------------------------------------- |
| `attach_headers`   | [Attach Headers Color](/feature/attach-headers-color) |
| `index_author`     | [Index Color](/feature/index-color)                   |
| `index_collapsed`  | [Index Color](/feature/index-color)                   |
| `index_date`       | [Index Color](/feature/index-color)                   |
| `index_flags`      | [Index Color](/feature/index-color)                   |
| `index_label`      | [Index Color](/feature/index-color)                   |
| `index_number`     | [Index Color](/feature/index-color)                   |
| `index_size`       | [Index Color](/feature/index-color)                   |
| `index_subject`    | [Index Color](/feature/index-color)                   |
| `index_tag`        | [Index Color](/feature/index-color)                   |
| `index_tags`       | [Index Color](/feature/index-color)                   |
| `progress`         | [Progress Bar](/feature/progress)                     |
| `sidebar_ordinary` | [Sidebar](/feature/sidebar)                           |

### Translations

Lots of new code comments have been added to aid the work of the translator.

NeoMutt has a [new translation](/translate) of:

- English (British)

### Contrib

This is a list of user contributions to NeoMutt.

| Name                                            | Description                                   |
| :---------------------------------------------- | :-------------------------------------------- |
| [Header Cache Benchmark](/contrib/hcache-bench) | Script to test the speed of the header cache  |
| [Keybase](/contrib/keybase)                     | Keybase Integration                           |
| [Useful programs](/contrib/useful-programs)     | List of useful programs interacting with Mutt |
| [Vi Keys](/contrib/vim-keys)                    | Easy and clean Vi-keys for Mutt               |
| [Vim Syntax](/contrib/vim-syntax)               | Vim Syntax File                               |

