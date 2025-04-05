---
title: Downloads
---

# {{ page.title }}

Distributions that support NeoMutt

## Listing

The table below gives instructions about how to install or compile NeoMutt
for all supported distributions, and also gives the maintainer and home page of
the NeoMutt packaging for this distribution. If your distribution isn't listed
here, you can always build your own NeoMutt from the source code (see the first
table row).

<table summary="list of distros">
  <thead>
    <tr>
      <th></th>
      <th>Install Instructions</th>
      <th>Maintainer</th>
      <th>Home Page</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="/images/source.png"></td>
      <td><a href="/dev/build">Build from Source</a></td>
      <td>NeoMutt Project</td>
      <td><a href="https://github.com/neomutt/neomutt">https://github.com/neomutt/neomutt</a></td>
    </tr>
    {% for d in site.distro %}
      <tr>
        <td><img src="/images/distros/{{ d.icon }}"></td>
        <td><a href="{{ d.url }}">{{ d.distro }}</a></td>
        <td>
          {% assign p = site.data.people[d.maintainer] %}
          {% if p %}{{p.name}}{% else %}{{d.maintainer}}{% endif %}
        </td>
        <td>{% if d.homepage %}<a href="{{d.homepage}}">{{d.homepage}}</a>{% endif %}</td>
      </tr>
    {% endfor %}
  </tbody>
</table>

<a href="https://repology.org/project/neomutt/versions"><img src="https://repology.org/badge/vertical-allrepos/neomutt.svg?columns=3"></a>
