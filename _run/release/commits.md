---
title: Commits
description: Make the Release commits branch
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

Once all the preparation work has been completed, it's time to make the actual Release.

- version YYYY-MM-DD
- update contributors
- changelog
- sync translations

## Bump Version Number

Using today's date and the Release Notes, update:

- `auto.def`
- `doxygen/doxygen.conf`
- `ChangeLog.md`

For this Release, we are changing the format of the version string, from `neomutt-YYYYMMDD` to `YYYY-MM-DD`.

## Last-Minute Updates

Create a branch, `[rel]` for any late changes:

- Check for any new contributors
- Run `clang-format`
- Check the build (using `[release]` branch)
- Sync translations (`make update-po`)
  (and update release date in `*.po`)

## Merge into Master

Merge the release changes into `[master]` and create a signed tag.
This tag marks the actual release of NeoMutt.

```sh
git checkout master
git merge --no-ff rel --message "NeoMutt $(date +%F)"
git tag -s $(date +%F) -m "NeoMutt release $(date +%F)"
git push --tags origin master
```

## GitHub Release

Create a new Release on GitHub using the new tag.
Use the Release Notes, prepared earlier.

- Download GitHub's `.tar.gz` and `.zip` source packages
- Create checksum for the source
- Create detached signatures for the source
- Add the check files to the Release as assets

