---
layout: concertina
title: Doxygen
description: Update the Code Docs
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

[Doxygen](http://www.doxygen.nl/) turns specially-formatted code comments into documentation.

**Repos needed**:
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/management](https://github.com/neomutt/management)

## Test the Code

First, check the code for any problems in the Doxygen comments, such as undocumented parameters or functions.

- Check for any undocumented functions
  `../management/doxygen/calc.sh`

- Generate basic code docs
  `doxygen doxygen/doxygen.conf`

## Web Docs

To generate the full docs, first create a `[doxygen]` branch in the `neomutt` repo.

```sh
../management/travis/doxygen-install.sh
```

Next, fully build the code-docs.
This will require graphviz to be installed.
It will take quite a while to complete.

Run:

```sh
doxygen/generate.sh
```

Check some of the pages to make sure things went well:

- `html/index.html`
  Note: You may see `/> /> />`, this can be ignored

- `html/pages.html`
  All the pages should be in libraries

- `html/config_vars.html`
  All the config variables should be documented

## Install

Once the documentation has been built and checked, it can be pushed to the website.
Push the branch to GitHub and the rest will be handled by Travis.

```
git push --set-upstream origin doxygen
```

Check the results of the build:
- [https://github.com/neomutt/neomutt/branches](https://github.com/neomutt/neomutt/branches)
- [https://travis-ci.org/neomutt/neomutt/branches](https://travis-ci.org/neomutt/neomutt/branches)

For more info read: [Deployment using Travis](https://neomutt.org/dev/deploy)

## Check the Results

The number of files in the code docs means that it takes GitHub quite a while to update the website (maybe 20-30 minutes).

Check the version number in the header bar of the [Code Docs](https://neomutt.org/code/)

Check some of the pages to make sure things went well:

- [https://neomutt.org/code/index.html](https://neomutt.org/code/index.html)

- [https://neomutt.org/code/pages.html](https://neomutt.org/code/pages.html)
  All the pages should be in libraries

- [https://neomutt.org/code/config_vars.html](https://neomutt.org/code/config_vars.html)
  All the config variables should be documented

