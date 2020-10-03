---
title: Renamed (typedef'd) Structs
---

# {{ page.title }}

Many structs have been renamed by NeoMutt

## Overview

### Typedefs

Typedefs will only be used for opaque data types. These structs have also been
renamed for consistency.

| Old typedef             | New struct                 |
| :---------------------- | :------------------------- |
| `ACCOUNT`               | struct Account             |
| `ADDRESS`               | struct Address             |
| `ALIAS`                 | struct Alias               |
| `ansi_attr`             | struct AnsiAttr            |
| `ATTACHPTR`             | struct AttachPtr           |
| `ATTACH_MATCH`          | struct AttachMatch         |
| `BODY`                  | struct Body                |
| `body_cache_t`          | struct BodyCache           |
| `BUFFER`                | struct Buffer              |
| `BUFFY`                 | struct Buffy               |
| `CHILD_CTX`             | struct ChildCtx            |
| `ciss_url_t`            | struct CissUrl             |
| `compose_redraw_data_t` | struct ComposeRedrawData   |
| `COMPRESS_INFO`         | struct CompressInfo        |
| `CONNECTION`            | struct Connection          |
| `CONTENT`               | struct Content             |
| `CONTENT_STATE`         | struct ContentState        |
| `CONTEXT`               | struct Context             |
| `ENTER_STATE`           | struct EnterState          |
| `ENVELOPE`              | struct Envelope            |
| `event_t`               | struct Event               |
| `FETCH_CTX`             | struct FetchCtx            |
| `flowed_state_t`        | struct FlowedState         |
| `FOLDER`                | struct Folder              |
| `group_context_t`       | struct GroupContext        |
| `group_t`               | struct Group               |
| `HASH`                  | struct Hash                |
| `hcache_db_ctx_t`       | struct HcacheDbCtx         |
| `hcache_lmdb_ctx_t`     | struct HcacheLmdbCtx       |
| `HEADER`                | struct Header              |
| `HOOK`                  | struct Hook                |
| `imap_auth_t`           | struct ImapAuth            |
| `IMAP_CACHE`            | struct ImapCache           |
| `IMAP_COMMAND`          | struct ImapCommand         |
| `IMAP_DATA`             | struct ImapData            |
| `IMAP_HEADER`           | struct ImapHeader          |
| `IMAP_HEADER_DATA`      | struct ImapHeaderData      |
| `IMAP_LIST`             | struct ImapList            |
| `IMAP_MBOX`             | struct ImapMbox            |
| `IMAP_STATUS`           | struct ImapStatus          |
| `LIST`                  | struct List                |
| `mbchar_table`          | struct MbCharTable         |
| `MESSAGE`               | struct Message             |
| `MIXCHAIN`              | struct MixChain            |
| `MUTTMENU`              | struct Menu                |
| `mutt_window_t`         | struct MuttWindow          |
| `myvar_t`               | struct MyVar               |
| `NEWSRC_ENTRY`          | struct NewsrcEntry         |
| `NNTP_ACACHE`           | struct NntpAcache          |
| `NNTP_DATA`             | struct NntpData            |
| `NNTP_HEADER_DATA`      | struct NntpHeaderData      |
| `NNTP_SERVER`           | struct NntpServer          |
| `pager_redraw_data_t`   | struct PagerRedrawData     |
| `pager_t`               | struct Pager               |
| `PARAMETER`             | struct Parameter           |
| `pattern_cache_t`       | struct PatternCache        |
| `pattern_t`             | struct Pattern             |
| `pgp_entry_t`           | struct PgpEntry            |
| `pgp_key_t`             | struct PgpKeyInfo          |
| `pgp_sig_t`             | struct PgpSignature        |
| `pgp_uid_t`             | struct PgpUid              |
| `pop_auth_t`            | struct PopAuth             |
| `POP_CACHE`             | struct PopCache            |
| `POP_DATA`              | struct PopData             |
| `progress_t`            | struct Progress            |
| `QUERY`                 | struct Query               |
| `REGEXP`                | struct Regex               |
| `REMAILER`              | struct Remailer            |
| `REPLACE_LIST`          | struct ReplaceList         |
| `rfc1524_entry`         | struct Rfc1524MailcapEntry |
| `RX_LIST`               | struct RxList              |
| `SASL_DATA`             | struct SaslData            |
| `SBENTRY`               | struct SbEntry             |
| `SCORE`                 | struct Score               |
| `SHA1_CTX`              | struct Sha1Ctx             |
| `smime_key_t`           | struct SmimeKey            |
| `sslsockdata`           | struct SslSockData         |
| `STATE`                 | struct State               |
| `THREAD`                | struct MuttThread          |
| `TUNNEL_DATA`           | struct TunnelData          |

### Plain structs

These plain structs have been renamed for consistency.

| Old struct                      | New struct                  |
| :------------------------------ | :-------------------------- |
| `struct b64_context`            | struct B64Context           |
| `struct binding_t`              | struct Binding              |
| `struct browser_state`          | struct BrowserState         |
| `struct command_t`              | struct Command              |
| `struct compile_options`        | struct CompileOptions       |
| `struct coord`                  | struct Coord                |
| `struct crypt_cache`            | struct CryptCache           |
| `struct crypt_module_functions` | struct CryptModuleFunctions |
| `struct crypt_module_specs`     | struct CryptModuleSpecs     |
| `struct dn_array_s`             | struct DnArrayS             |
| `struct enriched_state`         | struct EnrichedState        |
| `struct extkey`                 | struct Extkey               |
| `struct fgetconv_not`           | struct FgetConvNot          |
| `struct fgetconv_s`             | struct FgetConvS            |
| `struct folder_file`            | struct FolderFile           |
| `struct hash_elem`              | struct HashElem             |
| `struct hash_walk_state`        | struct HashWalkState        |
| `struct hdr_format_info`        | struct HdrFormatInfo        |
| `struct header_cache`           | struct HeaderCache          |
| `struct history`                | struct History              |
| `struct keymap_t`               | struct Keymap               |
| `struct line_t`                 | struct Line                 |
| `struct maildir`                | struct Maildir              |
| `struct mapping_t`              | struct Mapping              |
| `struct md5_ctx`                | struct Md5Ctx               |
| `struct mh_data`                | struct MhData               |
| `struct mh_sequences`           | struct MhSequences          |
| `struct m_update_t`             | struct MUpdate              |
| `struct mx_ops`                 | struct MxOps                |
| `struct nm_ctxdata`             | struct NmCtxdata            |
| `struct nm_hdrdata`             | struct NmHdrdata            |
| `struct nm_hdrtag`              | struct NmHdrtag             |
| `struct option_t`               | struct Option               |
| `struct pattern_flags`          | struct PatternFlags         |
| `struct pgp_cache`              | struct PgpCache             |
| `struct pgp_command_context`    | struct PgpCommandContext    |
| `struct q_class_t`              | struct QClass               |
| `struct range_regexp`           | struct RangeRegex           |
| `struct resize`                 | struct Resize               |
| `struct rfc2231_parameter`      | struct Rfc2231Parameter     |
| `struct smime_command_context`  | struct SmimeCommandContext  |
| `struct syntax_t`               | struct Syntax               |
| `struct sysexits`               | struct Sysexits             |
| `struct _tlssockdata`           | struct TlsSockData          |
| `struct tz_t`                   | struct Tz                   |
| `struct uri_tag`                | struct UriTag               |

