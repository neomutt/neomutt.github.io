---
title:       Coveralls
description: Code coverage tests
source:      https://github.com/neomutt/neomutt/blob/main/.github/workflows/coveralls.yml
badge:       https://github.com/neomutt/neomutt/actions/workflows/coveralls.yml/badge.svg
logs:        https://github.com/neomutt/neomutt/actions/workflows/coveralls.yml
author:      flatcap
---

<div style="float: right;">
<a href="{{page.logs}}"><img src="{{page.badge}}" /></a>
<a href="https://coveralls.io/github/neomutt/neomutt"><img src="https://img.shields.io/coveralls/github/neomutt/neomutt" /></a>
<a href="https://coveralls.io/"><img src="/images/coveralls.png" /></a>
</div>

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include actions-links.html %}

## Description

This action performs coverage tests on the code and uploads the results to the
[Coveralls](https://coveralls.io/) service which stores the results and
generates [pretty graphs](https://coveralls.io/github/neomutt/neomutt).

The coverage tests don't cover the entire codebase, just 13 libraries:
 - [address](https://code.neomutt.org/lib_address.html) - Email Address Handling                              
 - [color](https://code.neomutt.org/lib_color.html) - Colour handling code                                
 - [compress](https://code.neomutt.org/lib_compress.html) - Data compression                                    
 - [config](https://code.neomutt.org/lib_config.html) - User configurable variables                         
 - [core](https://code.neomutt.org/lib_core.html) - Backbone objects of NeoMutt                         
 - [editor](https://code.neomutt.org/lib_editor.html) - Select a Mailbox from a list                        
 - [email](https://code.neomutt.org/lib_email.html) - Structs that make up an email                       
 - [imap](https://code.neomutt.org/lib_imap.html) - IMAP network mailbox                                
 - [mutt](https://code.neomutt.org/lib_mutt.html) - Shared code for handling strings, files, dates, etc 
 - [notmuch](https://code.neomutt.org/lib_notmuch.html) - Notmuch virtual mailbox type                        
 - [parse](https://code.neomutt.org/lib_parse.html) - Text parsing functions	                            
 - [pattern](https://code.neomutt.org/lib_pattern.html) - Match patterns to emails                            
 - [store](https://code.neomutt.org/lib_store.html) - Key value store                                     

Learn how the [coverage tests are performed](../analysis/coverage.md)

See, [How to build NeoMutt](https://neomutt.org/dev/build)

**Steps**:
- Build NeoMutt
- Build Tests
- Make Coverage
- Upload results to Coveralls

### Action Details

| Key     | Description                                                            | Details                                                                                                                                  |
| :------ | :--------------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------------------------- |
| Trigger | Schedule                                                               | Mondays at 3am                                                                                                                           |
| Trigger | Workflow (manual)                                                      | [{{page.logs}}]({{page.logs}})                                                                                                           |
| Uses    | GitHub's checkout action                                               | [https://github.com/actions/checkout](https://github.com/actions/checkout)                                                               |
| Uses    | [Hendrik Muhs](https://github.com/hendrikmuhs)' ccache-action          | [https://github.com/hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)                                             |
| Uses    | [Simen Bekkhus](https://github.com/SimenB)' cpu-cores action           | [https://github.com/SimenB/github-actions-cpu-cores](https://github.com/SimenB/github-actions-cpu-cores)                                 |
| Uses    | [Coverall](https://coveralls.io/)'s github-action                      | [https://github.com/coverallsapp/github-action](https://github.com/coverallsapp/github-action)                                           |
| Runs-on | ubuntu-latest                                                          | [neomutt/ubuntu](https://ghcr.io/neomutt/ubuntu)                                                                                         |

### See Also

| Description | Location                                                                                       |
| :---------- | :--------------------------------------------------------------------------------------------- |
| Action      | [{{page.source}}]({{page.source}})                                                             |
| Action Logs | [{{page.logs}}]({{page.logs}})                                                                 |
| Source Code | [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)                       |
| Test Files  | [https://github.com/neomutt/neomutt-test-files](https://github.com/neomutt/neomutt-test-files) |
| Results     | [Code Coverage](https://coveralls.io/github/neomutt/neomutt)                                   |

