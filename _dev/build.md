---
title: Build
description: Building NeoMutt
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

<table summary="build pages">
  <thead>
    <tr>
      <th>Page</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    {% for page in site.dev %}
      {% assign parts = page.url | split: '/' %}
      {% if parts.size == 4 and parts[2] == 'build' %}
      <tr>
        <td><a href="{{ page.url }}">{{ page.title }}</a></td>
        <td>{{page.description}}</td>
      </tr>
      {% endif %}
    {% endfor %}
  </tbody>
</table>

