---
title: Branch Names
description: List of Branches in the NeoMutt Repo
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include github-links.html %}

The [neomutt](https://github.com/neomutt/neomutt) repository has 9
(semi-)permanent [branches](https://github.com/neomutt/neomutt/branches).

| Branch    | Description                                                                                               |
| :-------- | :-------------------------------------------------------------------------------------------------------- |
| main      | Main branch -- The Official NeoMutt                                                                       |
| coveralls | Extra files needs to generate test coverage, see [Coveralls](https://coveralls.io/github/neomutt/neomutt) |
| coverity  | Code sent to [Coverity](https://scan.coverity.com/projects/neomutt-neomutt) for testing.                  |
| doxygen   | Extra files needed to generate the [Doxygen Code Docs](/code/)                                            |
| fuzzer    | Fuzzing -- automating testing                                                                             |
| release   | Lots of build tests, performed before a release                                                           |
| translate | Work area for the translators.  This gets merged just before a release.                                   |

In addition, there may be some temporary branches.

| Branch         | Description                                                                                                                  |
| :------------- | :--------------------------------------------------------------------------------------------------------------------------- |
| devel/{NAME}   | New features are created in `devel` branches. When complete, documented and tested they are merged into the `main` branch.   |
| distro/{NAME}  | We keep reference copies of some of the downstream distros' NeoMutt code. **Note:** some of these repos are out-of-date.     |
| flatcap/{NAME} | @flatcap's test branches -- not suitable for public use.                                                                     |
| issue/{NUMBER} | When fixing a bug, sometimes we create an `issue` branch for the user to test.                                               |

