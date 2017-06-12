---
layout: concertina
title: NeoMutt - A User's View
---
# NeoMutt - A User's View

NeoMutt has many improvements over Mutt.
Below is a list of all the differences between Mutt and NeoMutt.

This guide is correct as of Mutt-1.8.3 and NeoMutt-20170609.
It is written for **users** of NeoMutt.
If you're a developer, see the [Developer's View](devel).

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

| Obsolete Name            | Correct Name               |
| :----------------------- | :------------------------- |
| `edit_hdrs`              | `edit_headers`             |
| `envelope_from`          | `use_envelope_from`        |
| `forw_decode`            | `forward_decode`           |
| `forw_decrypt`           | `forward_decrypt`          |
| `forw_format`            | `forward_format`           |
| `forw_quote`             | `forward_quote`            |
| `hdr_format`             | `index_format`             |
| `indent_str`             | `indent_string`            |
| `mime_fwd`               | `mime_forward`             |
| `msg_format`             | `message_format`           |
| `pgp_autoencrypt`        | `crypt_autoencrypt`        |
| `pgp_autosign`           | `crypt_autosign`           |
| `pgp_auto_traditional`   | `pgp_replyinline`          |
| `pgp_create_traditional` | `pgp_autoinline`           |
| `pgp_replyencrypt`       | `crypt_replyencrypt`       |
| `pgp_replysign`          | `crypt_replysign`          |
| `pgp_replysignencrypted` | `crypt_replysignencrypted` |
| `pgp_verify_sig`         | `crypt_verify_sig`         |
| `post_indent_str`        | `post_indent_string`       |
| `print_cmd`              | `print_command`            |
| `smime_sign_as`          | `smime_default_key`        |
| `xterm_icon`             | `ts_icon_format`           |
| `xterm_set_titles`       | `ts_enabled`               |
| `xterm_title`            | `ts_status_format`         |

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

| Feature            | Description                                       | In NeoMutt | In Mutt            |
| :----------------- | :------------------------------------------------ | :--------- | :----------------- |
| Compressed Folders | Read from/write to compressed mailboxes           | 2016-05-30 | 2016-12-04 (1.7.2) |
| Encrypt-to-Self    | Save a self-encrypted copy of emails              | 2016-07-23 | 2017-05-30 (1.8.3) |
| Kyoto Cabinet      | Kyoto Cabinet backend for the header cache        | 2016-10-02 | 2017-04-12 (1.8.1) |
| LMDB               | LMDB backend for the header cache                 | 2016-07-23 | 2017-04-12 (1.8.1) |
| Sidebar            | Overview of mailboxes                             | 2016-03-07 | 2016-07-06 (1.6.2) |
| TLS-SNI            | Negotiate with a server for a TLS/SSL certificate | 2016-03-07 | 2017-04-12 (1.8.1) |
| Trash Folder       | Automatically move deleted emails to a trash bin  | 2016-03-07 | 2016-08-18 (1.7.0) |

Mutt now supports the same six header-cache backends, but there is one important
difference.  Mutt can only compile-in one backend: NeoMutt can have several
backends.  This allows distros to offer their users a choice.

### Variables

If you have upgraded from a very old version of NeoMutt, it might be necessary
to update some of your sidebar config.  The names were changed to better match
NeoMutt's other variables.

| Old Name               | New Name                |
| :--------------------- | :---------------------- |
| `sidebar_delim`        | `sidebar_divider_char`  |
| `sidebar_folderindent` | `sidebar_folder_indent` |
| `sidebar_indentstr`    | `sidebar_indent_string` |
| `sidebar_newmail_only` | `sidebar_new_mail_only` |
| `sidebar_shortpath`    | `sidebar_short_path`    |
| `sidebar_sort`         | `sidebar_sort_method`   |

### Functions

These very old sidebar functions were also renamed.

| Old Name              | New Name            |
| :-------------------- | :------------------ |
| `sidebar-scroll-down` | `sidebar-page-down` |
| `sidebar-scroll-up`   | `sidebar-page-up`   |

### Commands

No commands have been changed in NeoMutt.

### Colours

No colours have been changed in NeoMutt.

### Translations

The translation files have all been unified:

- Converted to UTF-8
- Standard headers

NeoMutt has updated translations of:

- German
- Slovak
- Spanish

### Contrib

No user contributions have been changed in NeoMutt.

## Added to NeoMutt

Now the fun bit: all the things that NeoMutt has, that Mutt doesn't.

### Features

These are the major features of NeoMutt.

| Feature                  | Description                                                       | Since      | Status   |
| :----------------------- | :---------------------------------------------------------------- | :--------- | :------- |
| Attach Headers Color     | Color attachment headers using regexp, just like mail bodies      | 2016-09-10 | stable   |
| Compose to Sender        | Send new mail to the sender of the current mail                   | 2016-10-02 | stable   |
| Conditional Dates        | Use rules to choose date format                                   | 2016-03-07 | stable   |
| Fmemopen                 | Replace some temporary files with memory buffers                  | 2016-03-07 | disabled |
| Forgotten Attachment     | Alert user when they forget to attach a file to an outgoing email | 2016-09-10 | stable   |
| Global Hooks             | Define actions to run globally within Mutt                        | 2016-08-08 | stable   |
| Ifdef                    | Conditional config options                                        | 2016-03-07 | stable   |
| Index Color              | Custom rules for theming the email index                          | 2016-03-07 | stable   |
| Initials Expando         | Expando for author's initials                                     | 2016-03-07 | stable   |
| Keywords                 | Labels/Tagging for emails                                         | 2016-05-30 | stable   |
| Limit Current Thread     | Focus on one Email Thread                                         | 2016-03-28 | stable   |
| Multiple FCC             | Save multiple copies of outgoing mail                             | 2016-08-08 | stable   |
| Nested If                | Allow complex nested conditions in format strings                 | 2016-03-07 | stable   |
| New Mail                 | Execute a command upon the receipt of new mail                    | 2016-07-23 | stable   |
| NNTP                     | Talk to a Usenet news server                                      | 2016-05-30 | stable   |
| Notmuch                  | Email search engine                                               | 2016-03-17 | stable   |
| Progress Bar             | Show a visual progress bar on slow operations                     | 2016-03-07 | stable   |
| Quasi-Delete             | Mark emails that should be hidden, but not deleted                | 2016-03-07 | stable   |
| Reply With X-Original-To | Direct reply to email using X-Original-To header                  | 2016-09-10 | stable   |
| Sensible Browser         | Make the file browser behave                                      | 2016-09-10 | stable   |
| Skip Quoted              | Leave some context visible                                        | 2016-03-28 | stable   |
| Status Color             | Custom rules for theming the status bar                           | 2016-03-07 | stable   |

Here are some other/smaller features/changes:

| Feature           | Desription                                     |
| :---------------- | :--------------------------------------------- |
| Lua               | Basic Lua Scripting                            |
| DNS               | Faster DNS lookups (`getdnsdomainname()`)      |
| Purge             | Command to bypass the trash folder             |
| Interrupt         | Allow the user to interrupt slow IO operations |
| Rename Attachment | Allow the user to rename attachments           |
| Bind Warnings     | Create source warnings for binding aliases     |
| Relative Ranges   | Extend the m pattern to allow relative ranges  |

### Hooks

NeoMutt has some extra hooks:

| Hook     | Run...                            |
| :------- | -------------                     |
| startup  | before opening the first folder   |
| shutdown | just before exiting NeoMutt       |
| timeout  | at least every `$timeout` seconds |
| new-mail | when new mail arrives             |

### Command Line

NeoMutt has some extra command line options:

| Command Line Option | Used by | Description                        |
| :------------------ | :------ | :--------------------------------- |
| `-B`                | Lua     | batch mode                         |
| `-g`                | NNTP    | server                             |
| `-G`                | NNTP    | group                              |
| `-DS` or `-D -S`    | General | conceal sensitive / secret options |

The output of `mutt -v` has been tidied and coloured to make it easier to read.
It also lists the header-cache backends available.

There are some changes that affect config files.
- NeoMutt now reads from XDG config directories
- The `source` command is relative

Finally, if NeoMutt is compiled with debug support, then the log file can be
enabled whilst within NeoMutt.

- `set debug_level = 2`
- `set debug_file = ~/neomutt.log`

### Variables

| Variable                           | Owner / Description                   |
| :--------------------------------- | :-----------------------              |
| `collapse_all`                     | Collapse threads when entering folder |
| `debug_file`                       | Dynamically set the log file          |
| `debug_level`                      | Dynamically set the log level         |
| `empty_subject`                    | Configure a subject replacement       |
| `flag_chars`                       | Configurable flag chars in index      |
| `forward_references`               | Set 'In-Reply-To:', 'References:'     |
| `from_chars`                       | Abbreviates for 'From' field in index |
| `header_cache_backend`             | Which hcache backend should be used   |
| `show_multipart_alternative`       | How are multi-part emails displayed   |
| `abort_noattach`                   | Forgotten Attachment                  |
| `attach_keyword`                   | Forgotten Attachment                  |
| `keywords_legacy`                  | Keywords                              |
| `keywords_standard`                | Keywords                              |
| `xlabel_delimiter`                 | Keywords                              |
| `new_mail_command`                 | New Mail                              |
| `ask_follow_up`                    | NNTP                                  |
| `ask_x_comment_to`                 | NNTP                                  |
| `catchup_newsgroup`                | NNTP                                  |
| `followup_to_poster`               | NNTP                                  |
| `group_index_format`               | NNTP                                  |
| `inews`                            | NNTP                                  |
| `mime_subject`                     | NNTP                                  |
| `news_cache_dir`                   | NNTP                                  |
| `newsgroups_charset`               | NNTP                                  |
| `newsrc`                           | NNTP                                  |
| `news_server`                      | NNTP                                  |
| `nntp_authenticators`              | NNTP                                  |
| `nntp_context`                     | NNTP                                  |
| `nntp_listgroup`                   | NNTP                                  |
| `nntp_load_description`            | NNTP                                  |
| `nntp_pass`                        | NNTP                                  |
| `nntp_poll`                        | NNTP                                  |
| `nntp_user`                        | NNTP                                  |
| `post_moderated`                   | NNTP                                  |
| `save_unsubscribed`                | NNTP                                  |
| `show_new_news`                    | NNTP                                  |
| `show_only_unread`                 | NNTP                                  |
| `x_comment_to`                     | NNTP                                  |
| `nm_db_limit`                      | NotMuch                               |
| `nm_default_uri`                   | NotMuch                               |
| `nm_exclude_tags`                  | NotMuch                               |
| `nm_hidden_tags`                   | NotMuch                               |
| `nm_open_timeout`                  | NotMuch                               |
| `nm_query_type`                    | NotMuch                               |
| `nm_query_window_current_position` | NotMuch                               |
| `nm_query_window_current_search`   | NotMuch                               |
| `nm_query_window_duration`         | NotMuch                               |
| `nm_query_window_timebase`         | NotMuch                               |
| `nm_record`                        | NotMuch                               |
| `nm_record_tags`                   | NotMuch                               |
| `nm_unread_tag`                    | NotMuch                               |
| `vfolder_format`                   | NotMuch                               |
| `virtual_spoolfile`                | NotMuch                               |
| `reply_with_xorig`                 | Reply With X-Original-To              |
| `sidebar_on_right`                 | Sidebar                               |
| `skip_quoted_offset`               | Skip Quoted                           |

### Functions

**Index Menu**

| Function                    | Feature              |
| :-------------------------- | :------------------- |
| `compose-to-sender`         | Compose to Sender    |
| `limit-current-thread`      | Limit Current Thread |
| `catchup`                   | NNTP                 |
| `change-newsgroup`          | NNTP                 |
| `change-newsgroup-readonly` | NNTP                 |
| `followup-message`          | NNTP                 |
| `forward-to-group`          | NNTP                 |
| `get-children`              | NNTP                 |
| `get-message`               | NNTP                 |
| `get-parent`                | NNTP                 |
| `post-message`              | NNTP                 |
| `reconstruct-thread`        | NNTP                 |
| `toggle-read`               | NNTP                 |
| `change-vfolder`            | NotMuch              |
| `entire-thread`             | NotMuch              |
| `modify-labels`             | NotMuch              |
| `modify-labels-then-hide`   | NotMuch              |
| `sidebar-toggle-virtual`    | NotMuch              |
| `vfolder-from-query`        | NotMuch              |
| `vfolder-window-backward`   | NotMuch              |
| `vfolder-window-forward`    | NotMuch              |
| `quasi-delete`              | Quasi-Delete         |
| `purge-thread`              | Trash                |

**Pager Menu**

| Function                    | Feature              |
| :-------------------------- | :------------------- |
| `compose-to-sender`         | Compose to Sender    |
| `change-newsgroup`          | NNTP                 |
| `change-newsgroup-readonly` | NNTP                 |
| `followup-message`          | NNTP                 |
| `forward-to-group`          | NNTP                 |
| `post-message`              | NNTP                 |
| `reconstruct-thread`        | NNTP                 |
| `change-vfolder`            | NotMuch              |
| `entire-thread`             | NotMuch              |
| `modify-labels`             | NotMuch              |
| `modify-labels-then-hide`   | NotMuch              |
| `sidebar-toggle-virtual`    | NotMuch              |
| `vfolder-from-query`        | NotMuch              |
| `quasi-delete`              | Quasi-Delete         |
| `purge-thread`              | Trash                |

**Attach Menu**

| Function                  | Feature              |
| :------------------------ | :------------------- |
| `followup-message`        | NNTP                 |
| `forward-to-group`        | NNTP                 |

**Compose Menu**

| Function                  | Feature              |
| :------------------------ | :------------------- |
| `attach-news-message`     | NNTP                 |
| `edit-followup-to`        | NNTP                 |
| `edit-newsgroups`         | NNTP                 |
| `edit-x-comment-to`       | NNTP                 |

**Browser Menu**

| Function                  | Feature              |
| :------------------------ | :------------------- |
| `catchup`                 | NNTP                 |
| `goto-folder`             | Sensible Browser     |
| `reload-active`           | NNTP                 |
| `subscribe-pattern`       | NNTP                 |
| `uncatchup`               | NNTP                 |
| `unsubscribe-pattern`     | NNTP                 |

### Commands

| Command               | Feature       |
| :-------------------- | :------------ |
| `shutdown-hook`       | Global Hooks  |
| `startup-hook`        | Global Hooks  |
| `timeout-hook`        | Global Hooks  |
| `finish`              | Ifdef         |
| `ifdef`               | Ifdef         |
| `ifndef`              | Ifdef         |
| `lua`                 | Lua Scripting |
| `lua-source`          | Lua Scripting |
| `tag-formats`         | NotMuch       |
| `tag-transforms`      | NotMuch       |
| `unvirtual-mailboxes` | NotMuch       |
| `virtual-mailboxes`   | NotMuch       |

### Colours

| Colour             | Feature              |
| :----------------- | :------------------- |
| `attach_headers`   | Attach Headers Color |
| `index_author`     | Index Color          |
| `index_collapsed`  | Index Color          |
| `index_date`       | Index Color          |
| `index_flags`      | Index Color          |
| `index_label`      | Index Color          |
| `index_number`     | Index Color          |
| `index_size`       | Index Color          |
| `index_subject`    | Index Color          |
| `index_tag`        | Index Color          |
| `index_tags`       | Index Color          |
| `progress`         | Progress Bar         |
| `sidebar_ordinary` | Sidebar              |

### Translations

Lots of new code comments have been added to aid the work of the translator.

NeoMutt has a new translations of:

- English (British)

### Contrib

This is a list of user contributions to NeoMutt.

| Name                   | Description                                   |
| :--------------------- | :-------------------------------------------- |
| Header Cache Benchmark | Script to test the speed of the header cache  |
| Keybase                | Keybase Integration                           |
| Useful programs        | List of useful programs interacting with mutt |
| Vi Keys                | Easy and clean Vi-keys for Mutt               |
| Vim Syntax             | Vim Syntax File                               |

