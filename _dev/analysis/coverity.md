---
layout: concertina
title: Coverity
description: Source code analyser
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://scan.coverity.com](https://scan.coverity.com)

Coverity Scan is a free static-analysis cloud-based service for the open source
community.  As the free service is limited to a few scans per day, it isn't run
automatically.

- Resource leaks
- Potential NULL dereferences
- Logically dead code
- and much more

To run the check, create a branch of the NeoMutt repo and use the
[coverity `.travis.yml`](https://github.com/neomutt/management/blob/master/travis/coverity.yml)
file.  The rest of the process is automated.

The latest statistics on NeoMutt can be found here:

- [https://scan.coverity.com/projects/neomutt-neomutt](https://scan.coverity.com/projects/neomutt-neomutt)

For security, the details of the defects are not made public.  If you wish to
see the details, you must create an account (or login with GitHub) and click
"Add me to project".

- **See also**: [travis](travis.html)
- **See also**: [scan-build](scan-build.html)

