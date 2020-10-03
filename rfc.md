---
title: RFCs
---

# {{ page.title }}

Request for Comments (RFC) relevant to the NeoMutt project

## Incomplete assortment

| RFC | Description |
|-------|-------------|
{% for f in site.rfc %}[{{f.title}}]({{f.url}}) | {{ f.description }}
{% endfor %}

