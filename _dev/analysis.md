---
layout: concertina
title: Analysis
description: Ways to Analyze NeoMutt's code
---

# {{ page.title }}

[Wikipedia](https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis#C,_C++)
has a nice list of static analyzers for C source code.  
Those can be used to find bugs without compiling, executing and debugging NeoMutt.

If you have any questions, please send them to the developers' mailing list: [neomutt-devel@neomutt.org](mailto:neomutt-devel@neomutt.org)

<table summary="analysis tools">
  <thead>
    <tr>
      <th>Tool</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    {% for page in site.dev %}
      {% assign parts = page.url | split: '/' %}
      {% if parts.size == 4 and parts[2] == 'analysis' %}
      <tr>
        <td><a href="{{ page.url }}">{{ page.title }}</a></td>
        <td>{{page.description}}</td>
      </tr>
      {% endif %}
    {% endfor %}
  </tbody>
</table>

