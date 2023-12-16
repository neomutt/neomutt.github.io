---
title: Actions
description: GitHub Actions
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

<table summary="github actions">
  <thead>
    <tr>
      <th>Action</th>
      <th>Description</th>
      <th>Source</th>
      <th>Status / Logs</th>
    </tr>
  </thead>
  <tbody>
    {% for page in site.dev %}
      {% assign parts = page.url | split: '/' %}
      {% if parts.size == 4 and parts[2] == 'actions' %}
      <tr>
        <td><a href="{{ page.url }}">{{ page.title }}</a></td>
        <td>{{page.description}}</td>
        <td><a href="{{page.source}}">{{ page.source | split: '/' | last }}</a></td>
        <td><a href="{{page.logs}}"><img src="{{page.badge}}" /></a></td>
      </tr>
      {% endif %}
    {% endfor %}
  </tbody>
</table>

## Description

[GitHub Actions](https://docs.github.com/en/actions) allow us automate lots of
common tasks, such as:

- Building the code
- Testing the code
  - Unit tests
  - Static tests
- Code Coverage
- Deployment
  - Updating docs
  - Updating web pages

An Action is a YAML config file which can conditionally run commands and scripts.<br>
It lives in the `.github/workflows` directory in a git repo.

Actions are triggered by GitHub events, e.g.

- **Pushing** a commit to a branch
- Creating or updating a **pull-request**
- **Scheduled**, e.g. "Mondays at 3am"

**See also**:
- [Events that trigger workflows](https://docs.github.com/en/actions/learn-github-actions/events-that-trigger-workflows)

## Common Behaviour

### 3<sup>rd</sup>-Party Actions

NeoMutt's Actions use several other published Actions.<br>
Our most frequently used are:

- GitHub's **checkout** action -- [https://github.com/actions/checkout](https://github.com/actions/checkout)<br>
  Checkout the source code

- [Hendrik Muhs](https://github.com/hendrikmuhs)' **ccache-action** -- [hendrikmuhs/ccache-action](https://github.com/hendrikmuhs/ccache-action)<br>
  Cache the build products to speed up future builds

- [Adam Dobrawy](https://github.com/ad-m)'s **github-push-action** -- [https://github.com/ad-m/github-push-action](https://github.com/ad-m/github-push-action)<br>
  Push commits to a repo

**See also**:
- [GitHub's Marketplace](https://github.com/marketplace?type=actions)

### Docker

Actions run in containers.  These containers are empty.<br>
If we want to build our code, then we need to install all the build tools.

We can do this, but it's slow and creates a lot of network traffic.

To speed things up, we've created a [Docker](docker.md) image that contains all
the tools we'll need.

**See also**:
- [docker repo](https://github.com/neomutt/docker)
- [https://www.docker.com/](https://www.docker.com/)

### Workflow Triggers

Some actions can be triggered by `workflow_dispatch`, meaning they're manual.

If the actions supports it...
- Go to the log page
- Select a branch using the "Run workflow" **dropdown**
- Hit the "Run workflow" **button**

![workflow button](/images/workflow.png)

### Deployment

Many of NeoMutt's Actions **deploy** their results.

- [Doxygen](doxygen.md) and [Translate](translate.md) commit their work to other git repos.
- [Coveralls](coveralls.md) and [Coverity](coverity.md) upload their results to websites.
- [Docker](docker.md) publishes a Docker image for our Actions to use.

### Secrets and Tokens

A basic Action, like [build](build.md), doesn't require any privileges.<br>
It uses publicly available resources: a couple of repos.

However, many of the Actions require a **token** in order to write to repos, or
upload to services such as [Coverity](coverity.md).

For security, these tokens are encrypted and stored by GitHub. They are only
decrypted when the Action needs them.

Using tokens means we don't have to set up and install ssh keys.

#### Creating a Secret Token

First, we create a **Personal access token**.
- Personal Settings / Developer Settings
- [https://github.com/settings/tokens](https://github.com/settings/tokens)

**Generate a new token** and set the permissions that the Action will require.<br>
For the [Translate](translate.md) Action, we've granted it:
- `[X]` repo -- Full control of repositories 

This will display a token like: `ghp_9BNi2SkEWkcXPHvOhR9Yqtzqs313Cekj56JP`

Next, create the **Secret**.<br>
We create a **Repository** secret -- it can only be accessed by the neomutt repo.
- Repository / Settings / Secrets
- [https://github.com/neomutt/neomutt/settings/secrets/actions](https://github.com/neomutt/neomutt/settings/secrets/actions)<br>
  (Only NeoMutt admins will be able to follow _this_ link)

**New repository secret**:
- Name: `TEST_DEPLOY_KEY`
- Secret: `ghp_9BNi2SkEWkcXPHvOhR9Yqtzqs313Cekj56JP`<br>
  (from the instructions above)

Now, the Actions in the NeoMutt repo will be able to use {% raw %} `${{ secrets.TEST_DEPLOY_KEY }}` {% endraw %}

**See also**:
- [Encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Automatic token authentication](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)

