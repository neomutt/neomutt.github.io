---
title: Newbie Tutorial
description: Things every Newbie Should Know
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

If you're new to [NeoMutt](/about.html), here's a list of things you need to
know.

## TOC

* [Contact](#contact)
    * [IRC](#irc)
    * [Mailing lists](#mailing-lists)
* [GitHub](#github)
    * [Usage Tips](#usage-tips)
    * [Labels](#labels)
    * [Branches](#branches)
* [Invitation](#invitation)
* [What you can do in NeoMutt](#what-you-can-do-in-neomutt)
    * [Coding](#coding)
        * [Required tools](#required-tools)
        * [Coding style](#coding-style)
        * [Warning of string comparisons](#warning-of-string-comparisons)
    * [Docs/Translation](#docstranslation)
    * [Web Design](#web-design)
    * [Social](#social)
    * [Testing](#testing)
    * [Ideas](#ideas)
    * [Packager](#packager)
    * [Mentoring](#mentoring)

## Contact <a id="contact"></a>

The NeoMutt developers are scattered all over the globe. To keep in touch they
use [GitHub](https://github.com/neomutt), [IRC](#irc) and
[mailing lists](#mailing-lists).

### IRC <a id="irc"></a>

Channel: **#neomutt** on **irc.libera.chat**

This is a good way to meet the developers if you want to say hello. Everyone's
welcome. There are usually about 190&nbsp;people / lurkers in the channel.

The channel is pretty informal and conversation ranges from deep technical
discussions to light-hearted nonsense (late at night).

If you don't have a IRC client, you can use Libera's
[web client](https://web.libera.chat/#neomutt).

### Mailing lists <a id="mailing-lists"></a>

NeoMutt has two moderated mailing lists: Users, Devel.

**NeoMutt Users** <small>(~200 people)</small>

- [Subscribe](http://mailman.neomutt.org/mailman/listinfo/neomutt-users-neomutt.org)
- [Archives](http://mailman.neomutt.org/pipermail/neomutt-users-neomutt.org/)
- [neomutt-users@neomutt.org](mailto:neomutt-users@neomutt.org)

This list is ideal for new users of NeoMutt and people wanting to learn more.

All non-technical NeoMutt discussions are welcome here.

- What's your favourite feature?
- Do you have a killer config file?
- Have you found a bug?
- Do you want some help?

When asking for help, remember that we're volunteers. (and please check Google
first :-)

**NeoMutt Developers** <small>(~100 people)</small>

- [Subscribe](http://mailman.neomutt.org/mailman/listinfo/neomutt-devel-neomutt.org)
- [Archives](http://mailman.neomutt.org/pipermail/neomutt-devel-neomutt.org/)
- [neomutt-devel@neomutt.org](mailto:neomutt-devel@neomutt.org)

This is a technical list, used for discussing the code, build and documentation
of NeoMutt.

Users of rolling releases, such as [Arch](/distro/arch),
[Gentoo](/distro/gentoo) and [Homebrew (OSX)](/distro/homebrew) are advised to
join, to get early warning of new bugs.

Discussions here are likely to be about:

Bugs, Features, Code, Distros, Enhancements, Git

**Mailing List Guidelines**

**Please:**

- Send emails in plain text, not HTML
- Use an informative subject line
- Keep attachments small, or better still: link to the files
- Remember that we're volunteers and we may take a while to reply

## GitHub <a id="github"></a>

If you're a GitHub user, there are lots of ways to keep informed about NeoMutt
development.

First, though, please [**star our project**](https://github.com/neomutt/neomutt)
to show your appreciation :-)

The project consists of about 20 Git repositories. They store the code that
makes up NeoMutt, the documentation, build scripts and experiments
([read more about them](github/repos)).

GitHub allows you to watch:

- **Repos**         -- Choose a repository and click the **Watch** button
- **Issues**        -- Open an issue and click **Subscribe** in the right-hand panel
- **Pull-Requests** -- Open a PR and click **Subscribe** in the right-hand panel
- **People**        -- Go to a person's home page and click **Follow** on the left

By watching things in GitHub, you will receive emails when events occur. See
your [notifications](https://github.com/settings/notifications) and
[emails](https://github.com/settings/emails) settings for more information.

### Usage tips <a id="usage-tips"></a>

* We use GitHub's "assignee" feature to communicate who's working on what.
  That way, we can easily identify who's working on what.
* Please read and understand
  [GitHub's documentation](https://help.github.com/articles/searching-issues/)
  for searching through issues and pull requests.

### Labels <a id="labels"></a>

We use GitHub labels to categorize pull requests and issues.
[Here's](github/issue-labels) a list of them with their meanings. Please make use
of them and ask if something is unclear.

### Branches <a id="branches"></a>

Some of [our Branches](github/branches) have a special meaning.

## Invitation <a id="invitation"></a>

This section is for people who have been invited to join the NeoMutt project.
Invites will be given to people who contribute: code, docs, translations and to
the people who maintain NeoMutt packages for distros (it's a very inclusive
club :-)

**Thank you for your contribution and Welcome to NeoMutt**.

Accepting an invitation does two things. It shows your support for the project
and it allows you to commit work directly to the project. Members can commit to
most branches of most repos. Everything is backed up, but please be careful :-)

When you join, please consider making your membership public. Being a public
member will add a NeoMutt icon to your home page and it will tag any comments
you make in the issues.

### Teams <a id="teams"></a>

All NeoMutt members are welcome to
[join our Teams](https://github.com/orgs/neomutt/teams). This allows you to
**@mention** people with similar interests.

- Arch Users
- Debian Users
- Gentoo Users
- Homebrew Users
- Notmuch Users
- Downstream Packagers

## What you can do in NeoMutt <a id="what-you-can-do-in-neomutt"></a>

### Coding <a id="coding"></a>

Do you want to fix Mutt? \\
Do you want to add new features to Mutt?

To get familiar with the NeoMutt code, you can start with some
[**_Easy Coding Tasks_**](/2016/10/07/news)

Whatever your level of skill, NeoMutt has got a task for you. There are lots
of simple jobs and lots of hard jobs to get you thinking.

Alternatively, you could add a new feature to Mutt. There are many great Mutt
patches that have been neglected. They need to be brought up-to-date and
merged into Mutt.

#### Required tools <a id="required-tools"></a>

Usually, the
[.travis.yml](https://github.com/neomutt/neomutt/blob/master/.travis.yml) files
are a good starting point here.

#### Coding style <a id="coding-style"></a>

Over its twenty year life, Mutt has gathered 84,000 lines of code and a lot of
cruft (messy code and bad habits). It's time to sort out the mess and make Mutt
robust. We have written up the consensus among the NeoMutt Developers in the
[coding style Section](/dev/code). You can make of course suggestions
to that -- but please follow the consensus. Otherwise it makes the work very
hard.

Of course, especially refactorings/cleanups of the source code are welcome. If
you are interested, please talk to us.

#### Warning of string comparisons <a id="warning-of-string-comparisons"></a>

A word of warning about string comparisons: Since Mutt may run in a huge
variety of locales, case-insensitive string comparisons and case conversions
may be dangerous. For instance, in ISO-8859-9, tolower('I') is DIFFERENT from
'i' -- it's indeed the Turkish dotless lowercase i.

For this reason, always use the ASCII\_\* functions defined in ascii.h and
implemented in ascii.c when comparing or handling strings which are defined as
US-ASCII. This concerns lots of text-based protocols, message header tags,
character set names, domain names, e-mail addresses, etc.

### Docs/Translation <a id="docstranslation"></a>

The [NeoMutt Guide](/guide) reads like an encyclopaedia. Everything you want to
know is in there somewhere, but generally you have to know what you're looking
for.

NeoMutt needs a simple introduction with pictures. The guide should explain how
to perform simple tasks (just the basics to get a user started). The simple
guide can list some more advanced features of NeoMutt, but leave a full
explanation to the main manual.

See also: [Docs Rebuild](/dev/docs-rebuild)

The NeoMutt program has been translated into 30&nbsp;languages, but
[some of the translations](/translate) are out-of-date.

### Web design <a id="web-design"></a>

This website was created by a programmer -- it shows. If you think you could do
a better job, prove it.

Please don't edit the `*.html` and `*.md` files in the following folders, as they
are semi-automatically generated:

* [\_man](https://github.com/neomutt/neomutt.github.io/tree/master/_man)
* [guide](https://github.com/neomutt/neomutt.github.io/tree/master/guide)

Of course, you can always send pull requests to update those folders.

The site contains information from quite a lot of sources. Most of it has been
pulled together by hand. These processes need to be automated to reduce effort.

### Social <a id="social"></a>

The NeoMutt project has a [GitHub organisation](https://github.com/neomutt) and
a website [{{site.url}}]({{site.url}}).

These are useful and practical, but in order to reach a wider audience we have
a [Twitter](https://twitter.com/NeoMutt_Org) and probably need a Facebook
presence.

### Testing <a id="testing"></a>

NeoMutt already contains lots of features that Mutt doesn't have. These
features were often only available as patches which meant that they didn't get
much testing.

Do you know to to use automatic testing tools? What tools exist to test
text-only programs like Mutt? How easy is it to set up tests? What are these
tools capable of?

If you find a bug in NeoMutt, please report it:
[NeoMutt issue](https://github.com/neomutt/neomutt/issues).

### Ideas <a id="ideas"></a>

Even if you don't have any technical skills, you can probably help here. As
a mail client, Mutt is missing many features common to modern programs. Help
compile a list of features that Mutt is missing; help guide development.

### Packager <a id="packager"></a>

NeoMutt is currently only available as source code / patches. NeoMutt is
a small project and creating and maintaining binary packages takes time.

We need someone to create binary packages of NeoMutt. A good way to do this
would be to set up a Debian PPA or Fedora COPR.

Automatic packaging, and release, would mean more users, more testing and
better quality.

### Mentoring <a id="mentoring"></a>

Mutt has very few developers. This won't change until the Mutt community
becomes more welcoming to new developers.

Do you know Mutt well? \\
Do you want to encourage others to help?

Richard Russon has compiled a list of simple coding tasks. Each task will
improve the state of the Mutt code and help to get new developers familiar with
Mutt.

The job of the mentor will be to:

  * Answer the new coder's questions about Mutt
  * Check the work
  * Help get the code accepted into Mutt


*[COPR]: Cool Other Package Repo
*[PPA]:  Personal Package Archive

