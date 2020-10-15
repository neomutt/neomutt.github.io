---
title: Upstream
description: Merge Upstream Changes
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

Before making a release, it's important that we've merged all the latest fixes
from upstream Mutt.

**Repos needed**:
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/upstream-mutt](https://github.com/neomutt/upstream-mutt)

## Outstanding

Currently, there are 7 unmerged commits.
Not all of them will be relevant to NeoMutt.

- https://github.com/neomutt/upstream-mutt/commit/4c2f7c70 Fix inotify configure test
- https://github.com/neomutt/upstream-mutt/commit/af47e694 Properly revert on an autocrypt postpone failure
- https://github.com/neomutt/upstream-mutt/commit/4959e8d4 Re-enable and cleanup format-flowed space stuffing
- https://github.com/neomutt/upstream-mutt/commit/7949149a Remove manual note about space-stuffing only once
- https://github.com/neomutt/upstream-mutt/commit/aafe98ba Reuse the static space_stuff function for unstuffing
- https://github.com/neomutt/upstream-mutt/commit/c28cba77 Fix memory leak when attaching messages
- https://github.com/neomutt/upstream-mutt/commit/ad72ec6c Convert bcache to use buffer pools

Exporting them to patch form first makes it easier to merge them.
As patches, you can perform search/replace to NeoMutt-ify them.

- `git format-patch HASH^..HASH`
- Tidy commit subject
  - Remove references to their tracker
  - Remove trailing `.`
  - Shorten to 50 chars, if overly long
- Tidy the message body
- Tidy the patch
  - Search/replace Mutt structs with NeoMutt structs, etc
  - Add a credit for yourself -- this is time-consuming work
    `Co-authored-by: Richard Russon <rich@flatcap.org>`
- Apply patch: `git am PATCH`

After each patch applied, run `clang-format` on the code to tidy it up.
If the patch changes the docs, run `make validate-docs` to check them.

## Merge

Once all the changes are committed, check your work and test that NeoMutt still runs.
Finally, merge your changes:

```
git checkout master
git commit --no-ff upstream --message "upstream fixes" --message "Upstream commit: HASH"
```

The second message mentions the latest upstream commit hash that you've merged.
This helps the next person merging upstream commits.

