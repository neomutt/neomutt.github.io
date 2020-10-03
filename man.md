---
title: Manual Pages
---

# {{ page.title }}

Manual pages for the programs installed by NeoMutt

## Compendium

| Title | Description |
|-------|-------------|
{% for f in site.man %}[{{f.title}}]({{f.url}}) | {{ f.description }}
{% endfor %}

