---
layout: concertina
title: Branch Names
description: List of Branches in the NeoMutt Repo
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include github-links.html %}

The [neomutt](https://github.com/neomutt/neomutt) repository has 6
(semi-)permanent [branches](https://github.com/neomutt/neomutt/branches).

| Branch    | Description                                                                                                                                                                          |
| :-------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| master    | Main branch -- The Official NeoMutt                                                                                                                                                  |
| travis    | Code sent to [TravisCI](https://travis-ci.org/neomutt/neomutt) for testing. Travis performs over twenty builds with different options.                                               |
| coverity  | Code sent to [Coverity](https://scan.coverity.com/projects/neomutt-neomutt) for testing. Coverity limits the weekly builds like Travis, so we have to do that in an external branch. |
| doxygen   | Extra files needed to generate the [Doxygen Code Docs](/code/)                                                                                                                       |
| translate | Work area for the translators.  This gets merged just before a release.                                                                                                              |
| upstream  | Staging area for upstream commits                                                                                                                                                    |

In addition, there may be some temporary branches.

| Branch         | Description                                                                                                                  |
| :------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| devel/{NAME}   | New features are created in `devel` branches. When complete, documented and tested they are merged into the `master` branch. |
| distro/{NAME}  | We keep reference copies of some of the downstream distros' NeoMutt code. **Note:** some of these repos are out-of-date.     |
| issue/{NUMBER} | When fixing a bug, sometimes we create an `issue` branch for the user to test.                                               |
