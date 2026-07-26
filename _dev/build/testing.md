---
title: Testing
description: Running NeoMutt's Unit Tests
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include build-links.html %}

NeoMutt ships with over 650 unit tests, run with [acutest](https://github.com/mity/acutest).
They cover the Address, Core, Email and Mutt libraries.

## Setup

The tests need a second repo, [neomutt-test-files](https://github.com/neomutt/neomutt-test-files),
checked out alongside NeoMutt's own source:

```sh
git clone https://github.com/neomutt/neomutt
git clone https://github.com/neomutt/neomutt-test-files

# NEOMUTT_TEST_DIR must be an absolute path or the tests will fail
export NEOMUTT_TEST_DIR="$PWD/neomutt-test-files"

(cd neomutt-test-files; ./setup.sh)
```

`setup.sh` sets deliberately distinct mtimes on some fixture files (used by tests that check
file-age comparisons) — without running it, a fresh checkout gives every fixture file the same
mtime, and those specific tests fail even though nothing is actually broken.

Build NeoMutt as normal (`./configure [YOUR-OPTIONS] && make`) — no special test-only configure
flag is needed.

## Running the tests

```sh
make test                                # Run the whole suite

test/neomutt-test -l                     # List every test name
test/neomutt-test test_mutt_str_strncmp  # Run one specific test
test/neomutt-test mutt_str               # Run every test whose name matches this string
test/neomutt-test -v test_url_free       # Run verbosely
```

## Why can't I run a test without the test files?

Even tests that don't directly touch a fixture file — a pure function test like
`expando_parse()`, for example — still can't run without `NEOMUTT_TEST_DIR` set. Every test shares
one centralised `test_init()`, which checks the environment, test files, and locale once for the
whole run rather than per-test. Making genuinely dependency-free tests runnable in isolation would
mean restructuring that shared setup across all ~650 tests, not just a docs fix — see
[issue #4894](https://github.com/neomutt/neomutt/issues/4894) for the discussion.
