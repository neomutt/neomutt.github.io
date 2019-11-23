---
layout: concertina
title: Management
---

# Managing the NeoMutt Project

Guide to running the project

## Project workflows

| Title | Description |
|-------|-------------|
{% for f in site.run %}{% assign parts = f.url | split: '/' %}{% if parts.size != 3 %}{% continue %}{% endif %}[{{f.title}}]({{f.url}}) | {{ f.description }}
{% endfor %}

