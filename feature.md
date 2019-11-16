---
layout: concertina
title: Features
---

# {{ page.title }}

Gathered and implemented patches

## Notes

NeoMutt has brought together lots of Mutt patches, many of which were useful,
but had been abandoned.

Before each patch is marked stable:

- The code is brought up-to-date with Mutt-1.8.0
- The code is tidied up, comments added, checks done
- Documentation is written
- A sample muttrc is created
- The feature is tested

To find out more, see the [Development Page](/dev.html).

## Status

<table summary="list of features">
  <thead>
    <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Since</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    {% for f in site.feature %}
      {% if f.status == 'ignore' %}
        {% continue %}
      {% endif %}
      <tr>
        <td><a href="{{ f.url }}">{{ f.title }}</a>
        {% if f.title == "Sidebar" %}
          <a href="/feature/sidebar-intro">(Intro)</a>
        {% endif %}
        </td>
        <td>{{ f.description }}</td>
        <td>{{ f.since }}</td>
        <td>
          {% case f.status %}
          {% when 'stable' %}
          {% assign span = true %}
            <span class="good">&#x2713;
          {% when 'devel' or 'disabled' %}
          {% assign span = true %}
            <span class="devel">&#x26A0;
          {% endcase %}
            {{ f.status }}
          {% if span == true %}
            </span>
          {% endif %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>

