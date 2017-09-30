---
layout: concertina
title: Make a Release
description: All the steps to make a NeoMutt release
author: Richard Russon
status: wip
---

# {{ page.title }}

This will eventually be a complete guide to making a release of NeoMutt.

## Schedule

NeoMutt's current development plan is to follow each feature release with
a stabilising bug-fix release.

* 3 weeks of feature development
* 1 week of bug-fixing / stabilisation

## Anticipation

- 1 week heads up to dev mailing list
- Coming soon - list of features to users mailing list
- Merge mutt upstream
- Merge translations
- Waffle - clear "Ready" column

## Preparation

Check these repos for contributors to thank:

- neomutt
- neomutt.github.io
- gentoo-neomutt
- aur-build
- homebrew-neomutt
- travis-build

Check translators for credits

Commit/issue list

- git log
- new-commit.sh
- list of milestone issues

Credits

- Update README.neomutt
- Invite new members
- Update my alias list with all contributors
- Update .mailmap for all contributors
  (even if it's just a personal list)

Website

- Update guide
- Update man pages
- Update credits.md
- Update "since" date on new features

Templates:

- template-changelog.txt
- template-dev-ml.txt
- template-github.txt
- template-rpm.txt
- template-user-ml.txt
- template-website.txt

Code:

- Update references to version numbers
  - configure.ac YYYYDDMM, 1.8.0
- ChangeLog.neomutt
- configure.ac (fix date)
- Update neomuttrc.vim with new variables, etc
- Update po files

## Testing

Tests:

- git fetch github
- ./check_sec.sh
- Build (work cleanly)
  - make
  - make dist
  - make distcheck
  - make install
  - make unintall
  - make -C doc validate
  - make -C po
- neomutt-test-configs.sh
- push to travis
  - check travis
- push to coverity
  - review coverity results
  - fix coverity defects
- need to be done before the day

## Build

Add a signed tag
build (don't use my script)

## Packaging

Assets

- make dist -\> tar
- diff against mutt-1.8.0
  - test patch apply
  - test build
- filter diff
- create checksum

GitHub

- Generate release
- Upload assets

## Downstreams

Fedora COPR

- Update spec
  - version number
  - changelog
- build
- test install

MacOS - Homebrew

- update Formula
- push
- check travis

Gentoo

- Update Manifest
- push

Arch (AUR)

- Update
- push to BOTH neomutt and AUR

## Announcements

GitHub Release

- /cc @neomutt/downstream-packagers

Website News

Install new version of NeoMutt, then send emails using it.
"User Agent:" should show the new version:
Email

- neomutt-users mailing list
- neomutt-devel mailing list
- New users with a link to their name in the credits
- Translators - send them new po files

Update IRC topic
Twitter

## Post-Release

- Waffle: Archive the "Done" column
- Update milestones
  - next-release -\> release-YYYY-MM-DD
  - delayed      -\> next-release
  - create "delayed"
- GitHub: delete old branches
- Merge delayed issues

## Leftover Notes

change naming from YYYYMMDD to YYYY-MM-DD?

update release credits
    n commits by m users (p new users)
    list of new
    list of returnees

automate github release
    tag, push, create release, push, assets, checksum

reference neomutt repo and neomutt tagline in README

committer date = author date

fix annotated tag at 09:00
    GIT_AUTHOR_DATE
    GIT_COMMITTER_DATE

release repo for notes and scripts

check of HCACHEVER has changed, notify if it has

Check notes, emails, etc for promises

release link new feature to web page

release branch to queue up changes for the release commit
  no .travis.yml (no building)

