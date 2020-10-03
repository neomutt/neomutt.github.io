---
title: Contrib
---

# User Contributions to NeoMutt

Further project data and information provided by NeoMutt users

## Participation

NeoMutt is a fantastic program. It's versatile, configurable, scriptable...

This is your chance to help other NeoMutt users...

- Have **you** got a config file that **everybody** should be using?
- Have **you** written a script that makes life easier?

If you are a GitHub user, you can propose your improvements as a pull request
at the [repository](https://github.com/neomutt/neomutt.github.io/) of this
site, or raise a [NeoMutt issue](https://github.com/neomutt/neomutt/issues) to tell us about your idea.

Or, you can contact the lead developer, Richard&nbsp;Russon&nbsp;[&lt;rich@flatcap.org&gt;](mailto:rich@flatcap.org)

## Status

<table summary="list of contrib">
  <thead>
    <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Author</th>
      <th>Readme</th>
      <th>Status</th>
    </tr>
  </thead>
  <tbody>
    {% for c in site.contrib %}
      {% if c.status == 'ignore' %}
        {% continue %}
      {% endif %}
      <tr>
        <td><a href="{{ c.url }}">{{ c.title }}</a></td>
        <td>{{ c.description }}</td>
        <td>
          <a href="https://github.com/{{ c.username }}">{{ c.author }}</a>
        </td>
        {% if c.dir %}
        <td><a href="https://github.com/neomutt/neomutt/tree/master/contrib/{{ c.dir }}#readme">{{ c.dir }}</a></td>
        {% else %}
        <td>&mdash;</td>
        {% endif %}
        <td>
          {% assign span = false %}
          {% case c.status %}
          {% when 'stable' %}
            {% assign span = true %}
            <span class="good">&#x2714;
          {% when 'devel' %}
            {% assign span = true %}
            <span class="devel">&#x26A0;
          {% endcase %}
            {{ c.status }}
          {% if span == true %}
            </span>
          {% endif %}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>

