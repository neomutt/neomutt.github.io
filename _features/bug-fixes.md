---
layout: features
title: Bug Fixes
description: Bug fixes to Mutt
status: stable
---

## Bug Fixes

The bug-fix branch has a set of fixes for Mutt that aren't in the upstream
branch yet.

---

{% for b in site.bugs %}
## {{ b.title }}
**{{ b.date | date_to_string }}** [{{ b.author }}](mailto:{{ b.email }}) - Commit: [{{ b.commit }}](https://github.com/neomutt/neomutt/commit/{{ b.commit }})

{{ b.content }}

---

{% endfor %}

