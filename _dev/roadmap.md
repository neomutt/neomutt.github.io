---
layout: concertina
title: Roadmap
description: The Future of NeoMutt
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

<table summary="roadmap pages">
  <thead>
    <tr>
      <th>Page</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    {% for page in site.dev %}
      {% assign parts = page.url | split: '/' %}
      {% if parts.size == 4 and parts[2] == 'roadmap' %}
      <tr>
        <td><a href="{{ page.url }}">{{ page.title }}</a></td>
        <td>{{page.description}}</td>
      </tr>
      {% endif %}
    {% endfor %}
  </tbody>
</table>

