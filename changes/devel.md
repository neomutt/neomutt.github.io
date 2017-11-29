---
layout: concertina
title: NeoMutt -- A Developer's View
---

# {{ page.title }}

NeoMutt has many improvements over Mutt.
Below is a list of all the differences between Mutt and NeoMutt.

This guide is correct as of Mutt-1.8.3 and NeoMutt-20170609.
This guide is written for **developers** of NeoMutt.
If you're a not a developer, see the [User's View](user).

## Infrastructure

Besides the changes to the code, NeoMutt uses several free services.

### GitHub

NeoMutt makes heavy use of all of GitHub's facilities.

- [Git hosting](https://github.com/neomutt/neomutt)
- [Issue Tracking](https://github.com/neomutt/neomutt/issues)
- [Pull Requests handling](https://github.com/neomutt/neomutt/pulls)
- [Web Hosting](https://www.neomutt.org/)

### Travis

Every commit that is pushed to GitHub is compiled automatically by
[TravisCI](https://github.com/neomutt/travis-build).  This is managed by the
[travis-build](https://github.com/neomutt/travis-build) repo.

A copy of NeoMutt's Travis scripts are
[kept here](https://github.com/neomutt/management/tree/master/travis)

### Coverity

Perodically, NeoMutt's source is pushed to
[Coverity](https://github.com/neomutt/management/tree/master/travis).  Coverity
provide a static analysis of the code.

Since splitting from Mutt, NeoMutt have fixed over 200 defects (e.g. resource
leaks, unset pointers) raised by Coverity.  NeoMutt's "defect density" is 0.70.

## Removed

NeoMutt wants to remain compatible with Mutt, but it also wants to improve the
user's experience.  To achieve this, NeoMutt has added many features to Mutt and
removed very little.

### Files

Many files have been removed from the repo:

- Mercurial-repo-specific files
- Documentation that's out of date or irrelevant
- Build scripts, that are now generated
- Compatibility source (e.g. strdup.c)
- Obsolete source (dotlock.c)

**See also**:

- List of [removed files](mutt/files-removed.txt)
- List of [added files](neo/files-added.txt)
- Complete list of [Mutt files](mutt/files.txt)
- Complete list of [NeoMutt files](neo/files.txt)

### Configure

These options have been removed from configure.

| Options                     | Reason for Removal  |
| :-------------------------- | :------------------ |
| `--disable-iconv`           | Use system version  |
| `--disable-warnings`        | Obsolete            |
| `--enable-exact-address`    | Obsolete            |
| `--enable-external-dotlock` | Obsolete            |
| `--enable-hcache`           | Use backend options |
| `--enable-nfs-fix`          | Obsolete            |
| `--with-exec-shell`         | Obsolete            |
| `--with-included-gettext`   | Use system version  |
| `--with-regex`              | Use system version  |

### Code

**Some** code has been removed from Mutt.

For compatibility on old systems, Mutt had local versions of code for:
- Regular Expressiones (regex)
- International domain-name handling (intl)
- Message translation (gettext)

These are now readily available and have become build requirements.

**General tidying**:

- Code rearranged to avoid the need for forward delclarations
- Removed commented out blocks of code
- Removed `#if 0` blocks of code
- Removed `#ifdef CONFIG_H` -- it's required

The "security-checking" script `check_sec.sh` has been removed along with the
comment markers it needed.  This job is better done by coverity:

- `__FOPEN_CHECKED__`
- `__FREE_CHECKED__`
- `__MEM_CHECKED__`
- `__SAFE_FREE_CHECKED__`
- `__SPRINTF_CHECKED__`
- `__STRCAT_CHECKED__`
- `__STRCPY_CHECKED__`
- `__STRNCAT_CHECKED__`

Finally, the code that parsed and listed the PATCHES has been dropped.
NeoMutt no longer distributes patches and will readily adopt any suggested
improvements.

### Docs

Some documentation has been removed from NeoMutt.

| Doc                                                                      | Reason for removal    |
| :----------------------------------------------------------------------- | :-------------------- |
| ABOUT-NLS                                                                | Auto-generated        |
| BEWARE                                                                   | Obsolete              |
| [ChangeLog](https://github.com/neomutt/neomutt/blob/master/ChangeLog.md) | Replaced by NeoMutt's |
| doc/TODO                                                                 | Obsolete              |
| imap/TODO                                                                | Obsolete              |
| NEWS                                                                     | Obsolete              |
| PATCHES                                                                  | Obsolete              |
| [README](https://github.com/neomutt/neomutt/blob/master/README.md)       | Replaced by NeoMutt's |
| README.SECURITY                                                          | Obsolete              |
| TODO                                                                     | Obsolete              |
| UPDATING                                                                 | Obsolete              |
| VERSION                                                                  | Obsolete              |

Also, NeoMutt no longer distributes PDF or LaTeX docs.

## Changed

### Files

Many files in the repo [have been renamed](files)
to group them, or to better match the other files.

**Renamed files**:

- Filenames containing a hyphen (dash)
- Files for the header cache (hcache)
- Files for encryption / signing (ncrypt)

### Configure

configure has been extensively refactored:

- Easier to maintain
- Faster running
- Fewer unnecessary checks
- Better at discovering libraries
- Dependency on the wide-char version of ncurses

NeoMutt declared that
[POSIX:2001](https://github.com/neomutt/management/tree/master/standard-functions#readme)
was the base requirement for building.
This meant that many checks could be removed from configure.

These options have been removed, but the features remain.
The features didn't have any build dependencies, so they are **always** built
in.

| Options               | State    |
| :-------------------- | :------- |
| `--enable-compressed` | Built in |
| `--enable-imap`       | Built in |
| `--enable-mailtool`   | Built in |
| `--enable-pop`        | Built in |
| `--enable-sidebar`    | Built in |
| `--enable-smtp`       | Built in |

### Code

The code has undergone extensive improvements.

**Notable changes**:

- Remove tabs and trailing whitespace
- Clang-format the entire source tree
- Refactor the header cache ([hcache](https://github.com/neomutt/neomutt/tree/master/hcache))
- Refactor encryption / signing ([ncrypt](https://github.com/neomutt/neomutt/tree/master/ncrypt))
- Refactor struct Buffer code ([buffer.c](https://github.com/neomutt/neomutt/blob/master/mutt/buffer.c))

**Code style changes**:

- Run IWYU ([Include What You Use](https://include-what-you-use.org/))
- Initialise pointers
- Boolify functions
- Boolify struct members
- strcmp-like functions == 0
- Remove () from return
- Fix `mutt_message` `_()` missing ()s
- Add argument name to function prototypes
- Reduce scope of for variables
- Limit scope of functions (static) and rename
- Unify #include guards
- Renamed shadow variables
- #ifdef, not #if for variables
- fn(); -\> fn(void);
- snake_case for function names
- Abbreviate pointers tests (x), (!x)
- Fix typos & grammar
- Don't case malloc return
- Use SEEK_SET SEEK_CUR SEEK_END
- sizeof X -\> sizeof(X)
- Fix calloc args (num, size)
- Remove Mutt-isms: FOREVER, etc.
- dprint -\> mutt_debug

### Docs

A lot of the documentation has been updated.
Most of the references to Mutt have been updated to NeoMutt.

The DocBook documentation file has:

- De-tabbed
- Re-formatted
- Re-indented

## Added

### Files

Many files have been [added to the repo](neo/files-added.txt).

**Files added**:
- Feature source code
- Git repo config
- EditorConfig file
- Clang Format config
- Build files
- Documentation
- User contributions

### Configure

These configure options have been added to NeoMutt.

| Options               | Description                              |
| :-------------------- | :--------------------------------------- |
| `--disable-po`        | Don't build the translations (.po files) |
| `--enable-everything` | Build everything possible                |
| `--enable-fmemopen`   | Unstable feature                         |
| `--enable-lua`        | Enable Lua Scripting                     |
| `--enable-notmuch`    | Enable Notmuch searching                 |

### Code

All the code that has been added to NeoMutt is already accounted for in the new
features and in the code refactoring.

### Docs

All NeoMutt features come with full documentation.

- Simple description
- Full list of config
- Sample config file
- Author credits

The new NeoMutt documentation:

| File                                                                                                        | Description                          |
| :---------------------------------------------------------------------------------------------------------- | :----------------------------------- |
| [README.md](https://github.com/neomutt/neomutt/blob/master/README.md)                                       | An Introduction to NeoMutt           |
| [CONTRIBUTING.md](https://github.com/neomutt/neomutt/blob/master/CONTRIBUTING.md)                           | How to start contributing to NeoMutt |
| [ISSUE_TEMPLATE.md](https://github.com/neomutt/neomutt/blob/master/.github/ISSUE_TEMPLATE.md)               | How to write a perfect bug report    |
| [PULL_REQUEST_TEMPLATE.md](https://github.com/neomutt/neomutt/blob/master/.github/PULL_REQUEST_TEMPLATE.md) | How to write a perfect pull request  |

