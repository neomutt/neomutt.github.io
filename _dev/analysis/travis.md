---
layout: concertina
title: Travis
description: Continuous Integration
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- [https://travis-ci.org/](https://travis-ci.org/)

Travis provides a [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration)
service which is connected to NeoMutt's git repos on GitHub.

Each repo has a `.travis.yml` file which tells Travis what to do.  After every
commit to GitHub and for every Pull-Request, Travis performs the instructions
in that file.

Here are some of they ways that NeoMutt uses this service.

### Building of the source

To test the source code, Travis performs a set of builds with different
configure options.
[`.travis.yml`](https://github.com/neomutt/neomutt/blob/master/.travis.yml)
installs all the dependencies that are needed, but the build is controlled by a
[separate script](https://github.com/neomutt/travis-build/blob/master/build).

The script has per-branch rules to determine how many builds to do and which
options to use.  [_read more..._](https://github.com/neomutt/travis-build#travis-configs)

- [master](https://github.com/neomutt/travis-build/blob/master/master.txt): 4
- [devel/\*](https://github.com/neomutt/travis-build/blob/master/devel.txt): 1
- [pull-request](https://github.com/neomutt/travis-build/blob/master/pull-request.txt): 2

### Checking of the website links

To test the website, Travis checks all of the HTML for errors.

[`.travis.yml`](https://github.com/neomutt/neomutt.github.io/blob/master/.travis.yml)
installs [Jekyll](https://jekyllrb.com/) and
[html-proofer](https://github.com/gjtorikian/html-proofer#htmlproofer).

The testing is done by running the
[Rakefile](https://github.com/neomutt/neomutt.github.io/blob/master/Rakefile).

### Deployment of the translations

After a translator makes an update, Travis checks the results and updates the
[Translation Leaderboard](https://neomutt.org/translate)

The [translate](https://github.com/neomutt/neomutt/tree/translate)
branch has a custom
[`.travis.yml`](https://github.com/neomutt/neomutt/blob/translate/.travis.yml)
and [some scripts](https://github.com/neomutt/neomutt/tree/translate/.travis)
to generate a webpage.

On success, the website is automatically updated.  
For more details, read [Deployment using Travis](/dev/deploy).

### Travis Tool

Travis also supply a command line tool for managing their service.

```sh
gem install travis
```

NeoMutt used this to encrypt ssh keys for use in [automatic deployment](/dev/deploy).

