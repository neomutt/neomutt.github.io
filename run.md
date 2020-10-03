---
title: Management
description: Guide to running the project
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

## Project workflows

| Title | Description |
|-------|-------------|
{% for f in site.run %}{% assign parts = f.url | split: '/' %}{% if parts.size != 3 %}{% continue %}{% endif %}[{{f.title}}]({{f.url}}) | {{ f.description }}
{% endfor %}

