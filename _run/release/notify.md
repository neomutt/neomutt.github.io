---
title: Notifications
description: Let everyone know about the new release
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

After the Release has been made on GitHub, it's time to let everyone know:

- Developers' Mailing List
- Users' Mailing List
- Downstream Packagers
- IRC
- Website
- Twitter
- New Users

## Mailing Lists

These notification emails should be sent using the new version of NeoMutt.
(Ideally, with `$user_agent` set)

Our two mailing lists get sent slightly different version of the release announcement.
First, tidy some of the Markdown.
- Replace `**` with `*` (that's enough emphasis for email)
- Strip out `\` (escaping backslashes)

Mail the Developers: `Neomutt Developers <neomutt-devel@neomutt.org>`

Next, strip out the sections mentioning Code, Build, Source, Upstream.

Mail the Users: `Neomutt Users <neomutt-users@neomutt.org>`

## Downstream Packagers

Directly notify the downstream packagers using their team discussion board:

- [https://github.com/orgs/neomutt/teams/downstream-packagers](https://github.com/orgs/neomutt/teams/downstream-packagers)

They can also be notified by **mentioning** them in Issues or PRs.

- `/cc @neomutt/downstream-packagers`

## IRC

Update IRC topic:

```
/msg chanserv op #neomutt flatcap
/topic Version: YYYY-MM-DD | "Teaching an Old Dog New Tricks" - https://neomutt.org | Twitter: https://twitter.com/NeoMutt_Org | Mailing lists: http://mailman.neomutt.org/mailman/listinfo | Code of Conduct: https://neomutt.org/conduct
/msg chanserv deop #neomutt flatcap
```

## Website

Cut'n'paste the GitHub announcement into the [neomutt.github.io](https://github.com/neomutt/neomutt.github.io) repo.

The file should be named `_post/YYYY-MM-DD-release.md`
Give it a YAML header:

```yaml
---    
author: flatcap
title: Release YYYY-MM-DD   
---
```

Also, add a line to the Releases webpage: `_dev/releases.md`

- [https://neomutt.org/dev/releases](https://neomutt.org/dev/releases)

Commit and push the change to GitHub.

```
git add _post
git commit --all --message "NeoMutt YYYY-MM-DD"
git push origin
```

## Twitter ([@NeoMutt_org](https://twitter.com/NeoMutt_Org))

Strip down the release message to the bare essentials and link to the current release:

- [https://github.com/neomutt/neomutt/releases/latest](https://github.com/neomutt/neomutt/releases/latest)

## New Users

After the release, send each of the new contributors a 'Thank You' message
containing a link to the GitHub Release Notes.

- [newbies.txt](https://github.com/neomutt/management/blob/main/release-templates/newbies.txt)

