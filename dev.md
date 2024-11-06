---
title: Development
---

# {{ page.title }}

Step in - here may be more than just consuming

## What's going on?

If you are interested in contributing, please have a look at our
[Newbie Tutorial](/dev/newbie-tutorial).

Any development on features is done in "devel/" feature branches in the
[NeoMutt repository](https://github.com/neomutt/neomutt). Once
development is complete, the work will be merged into the `main` branch.

Finally, some automatic checking is done on commits and pull requests for
NeoMutt. It benefits from two free services (free for Open Source). They
are triggered on every commit to GitHub.

- [GitHub Actions](https://github.com/neomutt/neomutt/actions) automatically build projects on every commit (Continuous Integration).
- [Coverity](https://scan.coverity.com/) performs static analysis on the code looking for potential problems.

[![code status](https://github.com/neomutt/neomutt/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/neomutt/neomutt/actions/workflows/build-and-test.yml)
[![coverity status](https://img.shields.io/coverity/scan/8495.svg)](https://scan.coverity.com/projects/neomutt-neomutt)
[![coverage status](https://img.shields.io/coveralls/github/neomutt/neomutt)](https://coveralls.io/github/neomutt/neomutt?branch=coveralls)

<img height="300" width="768" src="https://starchart.cc/neomutt/neomutt.svg" />

[StarCharts](https://github.com/caarlos0/starcharts)

## Development docs

| Title | Description |
|-------|-------------|
{% for f in site.dev %}{% assign parts = f.url | split: '/' %}{% if parts.size != 3 %}{% continue %}{% endif %}[{{f.title}}]({{f.url}}) | {{ f.description }}
{% endfor %}

## Blue sky

NeoMutt also has a couple of speculative ideas:

- Redesigning Mutt's [architecture](https://github.com/neomutt/arch#arch)
- Redesigning Mutt's [gui](https://github.com/neomutt/panel-manager#panel-manager)

**Note**: These are just toys (for now).
