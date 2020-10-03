---
title: Style Guide (Markdown)
description: Some style and format suggestions for Markdown files
author: Floyd Anderson
username: floand
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}

## Table of contents <a id="h2_toc"></a>

\[&nbsp;[Introducing](#h2_intro)
\|&nbsp;[Encoding](#h2_encoding)
\|&nbsp;[Headings](#h2_headings)
\|&nbsp;[Paragraphs](#h2_pars)
\|&nbsp;[Lists and tables](#h2_lsts-tbls)
\|&nbsp;[Linking](#h2_links)
\|&nbsp;[Hints](#h2_hints)
\]

## Introducing <a id="h2_intro"></a>

First things first, the main rule we have to format a [Markdown][mdn_std] file
for our website is -- we have *no rules*, *no policies* or anything like that.
Because useful but probably badly formatted content is always better than
helpful but unshared informations and experiences. Nevertheless there are some
minimal requirements that must be met to not confuse the underlying processor
([Liquid][lqd_git_wiki]), respectively Markdown parser ([kramdown][kdn_prs]).

Also note, we are not the grammar police, i.e. nobody will be blamed. The site
content will be irregularly reviewed and corrected but you can also help by
taking the following points to your heart. Those are only suggestions to
hopefully increase the source file consistency, its readability and making
reviewing less time consuming. So, ~~in the end~~ from the beginning, we get
content which is easier to handle and to maintain.

The kramdown parser is configured to support
[GitHub Flavoured Markdown][mdn_gfm] (GFM) which we prefer and
[slightly differs][kdn_prs_gfm] from [standard Markdown][mdn_std]. It's
absolutely not necessary but if your are interested in, the
[kramdown syntax page][kdn_syn] mention all differences where applicable but
the [quick reference][kdn_ref] is more than enough.

## Encoding <a id="h2_encoding"></a>

Which file encoding to use is up to you and depends on what kind of text to
write and if you have to use a [multibyte character set][wpd_mbcs] (MBCS) for
special symbols. Even it's not the most frugal encoding representation
(relating to storage space), Unicode -- more precisely, UTF-8 character
encoding -- is preferred due to its wide range of code points but *please*, use
it without a [byte order mark][wpd_bom] (BOM) signature! Otherwise parsers may
stumble.

Beside the file encoding you have to choose a file name and a common extension
but that's easy. Use `.md` (lower case) for the latter and build from alphanumeric,
hyphen and underscore characters a descriptive name.

## Headings <a id="h2_headings"></a>

A single (not too long) line between the title and the *first* section contains
some kind of description to introduce the page. The background, it looks nicer
when all *sub-*pages starts with the same structure and as a bonus, will reduce
vertical 'header jumping' while navigating through internal pages.

A short structure visualisation:

```reply
---
remark: This is a so called YAML front matter (will be processed by Jekyll).
status: wip
---

# A Capitalised Page Title

This description introduce the page and doesn't end with a full stop

## Normalised page heading

Level 2 headers (like titles) do not start numbered and end without a full stop
(like the description line). Unlike titles, only the first word is capitalised.
Proper names and nouns, e.g. our NeoMutt, are written as in paragraph context.

If it cannot be avoided, only well known acronyms and abbreviations should be
used in titles and headings.

...
```
As you can see, all elements are separated by *one* empty line. The header of
our Markdown pages are created by using the
*atx-* not *setext-*[style notation][mdn_syn_header] and *without* the optional
end mark (`#`). This style supports more header levels and is easier to match
with regular expressions (RegEx) in the case of future section restructuring.

| Style        | Level 1              | Level 2              | Level 3          | ... | Level 6                |
| :----------- | :------------------: | :------------------: | :--------------: | :-- | :--------------------: |
| atx-style    | `# Header #`         | `## Header ##`       | `### Header ###` | ... | `###### Header ######` |
| setext-style | `Header`<br>`======` | `Header`<br>`------` | &mdash;          | ... | &mdash;                |

\\
Every page has exactly *one* level 1 and one or more level 2 header. Any further
subsections follows the rule level n+1, i.e. no levels will be skipped and, e.g.
a level 3 section cannot contain a level 2 header.

## Paragraphs <a id="h2_pars"></a>

Although the usage of line wrapping and endings, multiple or trailing
whitespace(s) has no meaning for paragraphs in the rendered HTML page -- it
could for those whose looking at the source. Make it a pleasure to read or
review your work -- both, as rendered result just as in source file.

It's a common convention to:

* [wrap lines](#h3_linewrap) at column 80 without breaking words and link definitions
* use Unix-style line endings, a.k.a. line feed (LF)
* avoid multiple (not for lists/tables) and trailing [whitespace](#h3_whitespace)(s)
* introduce [acronyms and abbreviations](#h3_abbrevs) on their first usage
* be consistent when using [emphasis](#h3_emphasis)ed text passages
* strip all [comments](#h3_comments) once you are ready to publish

**Note**: In Markdown several characters are associated with a special meaning
to mark text as emphasised, header, list, etc. To repeal their *special
attribute* prepend a backslash to characters like ``#`*_.-+`` and `()[]{}`.

For instance, an escaped asterisk `\*` will be handled literally and not as
start for a list item or an emphasis. Because our output format is HTML, also
consider escaping of `<>&` to avoid they'll be treated as tag or HTML/XML entity.

### Line wrapping <a id="h3_linewrap"></a>

For line wrapping keep track of every line start to not produce unwanted
results. For instance:

```reply
The answer to "What is the meaning of life, the universe and everything?" is
42. Douglas Adams was...
```

become a numbered listing point:

```reply
The answer to “What is the meaning of life, the universe and everything?” is

    1. Douglas Adams was…           ... Solution: avoid line break or escape 42\.
```

If you want to be perfect, try to avoid [widows and orphans][wpd_wid-orph].
They are easy to overlook and could be eliminated by inserting an earlier line
break or a *no-break space* (`&nbsp;`). The latter adds some kind of distortion
but also makes clear what you've tried to achieve. Read also about
[its friends](#h3_typo-chars).

### Whitespace <a id="h3_whitespace"></a>

Whitespace usage depends on its context -- remember the goal is consistency and
readability. It's mandatory for nested lists to get a proper indentation
result, tables could be hard to read in source without it. Also, there might be
use cases to indent or align something horizontally (in source):

```reply
[irc]:␣␣␣␣␣␣</dev/newbie-tutorial#irc>
[issues]:␣␣␣<https://github.com/neomutt/neomutt/issues>
```

but use it sparely and with single spaces -- they are preferred to tab stops.

### Acronyms and abbreviations <a id="h3_abbrevs"></a>

Paragraphs that contains tons of acronyms or abbreviations interrupt the text
flow and thus, are mostly hard to read and may even worst to understand,
especially when they are unknown by the reader because they haven't been
introduced on its first usage.

Sometimes it's difficult to introduce half of a dozen acronyms, e.g. in a table
row or a short listing point. To get out of this let the parser automatically
convert it to HTML abbreviation tags (`<abbr title="Line Feed">LF</abbr>`) by
placing their definitions:

```reply
*[ANSI]: American National Standards Institute
*[ASCII]: American Standard Code for Information Interchange
*[UTF-8]: 8-Bit UCS Transformation Format
```

somewhere into the Markdown file -- the end of file (EOF) is a good location
for this. **Tip**: A certainly incomplete list of definitions can be found in
[our glossary](/dev/glossary).

One note about abbreviations and contractions, commonly, well known of those
(a.k.a., etc., vs, ...) doesn't and thus, shouldn't have to be introduced. Try
to use complete words, e.g. write 'configuration files', 'contribution',
'documents' instead of 'configs', 'contrib', 'docs' -- it looks more correct in
a treatise, doesn't mislead spell checks and won't trick regular expression
pattern, ...

### Emphasis <a id="h3_emphasis"></a>

Emphasised text passages are a nice way to direct readers attention to several
important notes. Use emphasis but also don't overdo it, be always consistent,
i.e. use the same specific style for the same kind of text passages.

For example (inline):

| Style   | Emphasis Sample              | Markdown Syntax                    | Example Use Case                     |
| ------: | :--------------------------- | :--------------------------------- | :----------------------------------- |
|   code: | `neomutt -F /dev/null -D -S` | `` `neomutt -F /dev/null -D -S` `` | command, file/path names, code, ...  |
|  light: | _NeoMutt_ or *Issue #42*     | `*NeoMutt*` or `_Issue #42_`       | names, pseudo header, issue, comment |
| strong: | __See also__: or **Note**:   | `**See also**:` or `__Note__:`     | hints, key in key/value pairs, ...   |

\\
Even it is possible, avoid usage of:
*   `````` ```three backticks delimiter``` `````` for inline code emphasis --
    it's redundant. Indeed, they are not reserved but should only be used for
    code blocks:

    ```
    # Convert mails from mbox to Maildir format using NeoMutt
    # Notice the prepended backslash to bypass a probably defined NeoMutt alias
    \neomutt -f /path/to/mbox-file -e 'set mbox_type=maildir; \
        set confirmcreate=no; set delete=no; \
        push "<tag-pattern>.*<enter>;<save-message>/path/to/Maildir-directory<enter><quit>"'
    ```
    For practical command examples be kindly and:
    -   test your commands and mention any real or expected result/issue.
    -   append a backslash when breaking up command line examples. This clearly
        marks it as long wrapped command and just as important, the user is
        able to copy&nbsp;'n paste it directly to the terminal. \\
        **Note**: You *Must Not* use any kind of
        [special characters](#h3_typo-chars) in a command example!
*   alternative tilde notation (`~~~`) for code blocks -- we use the triple backticks
*   more than one emphasis at a time, use _light_ or **strong** but
    **_not both_** -- typographical highly questionable, you won't increase
    attention (in a good sense) but produce probably a bold-faced "fake
    italic", due to the lack of the installed font-style.
*   visual complicated forms, e.g. `**\***` instead of a more readable `__\*__`.

### Comments <a id="h3_comments"></a>

While writing it may be useful to comment out different versions of a text
section or similar. But simply, you cannot because Markdown, as a plain text
formatting syntax, does not define comments.

If you cannot resist:
*   know the pitfalls by misuse a link definition and try these two-edged hacks:
    ```reply
    Note: empty line below is mandatory

    [•]: # comment line 1   ... square brackets should contain document wide unique text
    [•]: # comment line 2   ... this 'anchor definition' doesn't appear in HTML source

    <!--
        Multi line HTML comment which appears in HTML source
    -->
    ```
*   run a [Jekyll][jkl_home] instance and wrap arbitrary text passages with
    Liquid {% raw %}`{% comment %}` and `{% endcomment %}`{% endraw %}
    [tags][lqd_tag_comment]. These kind of comments will not be placed into the
    HTML source.

**Remark**: Don't forget to strip out those hacks, it's beyond the
specification or Liquid markup *not* Markdown!

## Lists and tables <a id="h2_lsts-tbls"></a>

Both styling elements supports a *lazy notation*:

```reply
·2·4·6·8·0·2·4·6·8  │  ·2·4·6·8·0·2·4·6·8·0·2·4·6·8·0·2·4·6·8·0· │
────────────────────┼────────────────────────────────────────────│
1. point 1          │  |left|center|right|                       │
1. point 2          │  |:-|:-:|-:|                               │
   1. point 2.1     │  |Teaching an|cell 1.2|cell 1.3|           │
   1. point 2.2     │  |cell 2.1|Old Dog|cell 2.3|               │
1. point 3          │  |cell 3.1|cell 3.2|New Tricks|            │
```

which is easily extendable but hard to read, so don't be lazy:

```reply
·2·4·6·8·0·2·4·6·8  │  ·2·4·6·8·0·2·4·6·8·0·2·4·6·8·0·2·4·6·8·0· │
────────────────────┼────────────────────────────────────────────│
1.  point 1         │  | left        |  center  |       right |  │
2.  point 2         │  | :---------- | :------: | ----------: |  │
    1.  point 2.1   │  | Teaching an | cell 1.2 |    cell 1.3 |  │
    2.  point 2.2   │  | cell 2.1    | Old Dog  |    cell 2.3 |  │
3.  point 3         │  | cell 3.1    | cell 3.2 |  New Tricks |  │
```

because our goal is readability and consistency in rendered results _and_
source files.

### Lists <a id="h3_lists"></a>

Markdown supports three different formats, named: *ordered* (a.k.a. numbered),
*unordered* (a.k.a. bullet) and *definition* (a.k.a. association) lists. They
all have their special use case but the most used type is the bullet list.

Lists are great to present several informations in a compact and easy to follow
form instead of writing (and reading) walls of text. Use it to describe
*simple* contexts and probably alternatively to tables with long text cells
which doesn't support line wrapping in source and thus, runs out of the screen.

**Common remarks**
*   avoid blank lines between list elements (doesn't harm, only looks bad)
*   indent nested list items by a multiple of four spaces
*   alternate list symbols (`*-+`) for list levels (helpful when indent gets lost)
*   do not use lazy numbering notation -- not even for long listings
*   list introducing fragments:
    -   ends with a colon
    -   their list items use lower case (see exceptions below)
*   format all items with the same grammatical form
*   ...

**Numbered list**
*   capitalise the elements -- use *sentence case*
*   use it where order is important, e.g. for step-by-step instructions
*   ...

**Bullet list**
*   with short elements -- use *lower case* without full stops
*   with some kind of definition -- use *sentence case*, e.g.:
    -   Listings -- Great help and easy to follow.
*   with complete sentences -- use *sentence case*
*   which finalise sentences -- use *sentence case*
*   ...

**Definition list**
*   elements mostly uses *sentence case*
*   nothing special here -- misuse it to indent text without bullets and numbers
*   ...

### Tables <a id="h3_tables"></a>

Like lists, tables are useful to give a quick overview and looks mostly neat
and clean as long as they are small. Also tables may have some drawbacks on
small screens and source readability or alternating could be a pain.

Fill up table cells with single spaces until all columns are exactly vertical
aligned. With a good editor it should be achievable -- if not, this wheel has
been already invented and several helpers exists, e.g. as
[table generator][tbl_gen], [Vim plugin][tbl_vtm] or [browser extension][tbl_bxt].

Whichever way you go, look at the results of those helpers (beside their
learning curve or usability). As shown above, we use a *single* space around
each inner table pipe character and after/before the outer ones. For the sake
of our own little laziness, table cells are mostly left aligned but for
different length numbers or similar it may be worth to take the work and right
align those in source files.

Neither table rows nor cells can be wrapped so it becomes visually easier to
perceive in source. To force a line break in the rendered table cell use the
HTML break tag (`<br>`). Note, the kramdown parser picks the right form
internally, so in _this context_ there is no difference to its XHTML variant
(`<br />`).

**Conclusion/Remarks**
*   do not use lazy notation
*   do not use long URLs in cells -- use an _implicit link to link reference_
*   vertical align all pipe characters
*   use a single space to:
    -   fill up table cells
    -   encapsulate inner pipe characters
    -   append/prepend outer pipe characters
*   capitalise header content
*   do not leave cells empty -- use replacements, e.g. '---' (`&mdash;`),
    'undefined', ...

## Linking <a id="h2_links"></a>

By linking _parts_ of text you'll valorise your work and have the chance to
substantiate or enhance your examples and statements. Links should be used for
_additional_ references, not as a replacement for information.

Markdown and GFM provides several link definitions:

| Link Type          | Definition (inline)                                                     | Result                                                      |
| -----------------: | :---------------------------------------------------------------------- | :---------------------------------------------------------- |
| *explicit*         | `[NeoMutt](https://neomutt.org "NeoMutt’s Home Page")`              | [NeoMutt][lnk_id] link with a balloon tip                   |
| *implicit*         | `[https://neomutt.org]` or `<https://neomutt.org>`              | <https://neomutt.org>                                   |
| **Reference**      | **Definition (somewhere)**                                              | **Usage (inline)**                                          |
| *link*<br />&nbsp; | `[lnk_id]: <https://neomutt.org> "NeoMutt’s Home Page"`<br />&nbsp; | *explicit*: `[NeoMutt][lnk_id]`<br />*implicit*: `[lnk_id]` |
| *image*            | `[img_id]: </images/mutt-48x48.png> "Mutt’s stroll"`                    | `[![img_id]][lnk_id]`                                       |
| *footnote*         | `[^fn_id]: "Teaching an Old Dog New Tricks"`                            | `NeoMutt&#x202F;[^fn_id]`                                   |

[lnk_id]: <https://neomutt.org> "NeoMutt’s Home Page"
[img_id]: </images/mutt-48x48.png> "Mutt’s stroll"
[^fn_id]: "Teaching an Old Dog New Tricks"
\\
An explicit link definition is basically preferred to an implicit one because
it is apparent as a declaration of intent.

A line length of 80&nbsp;characters, as suggested in
[Paragraphs section](#h2_pars) above, often doesn't provide enough room to hold
both, the link and a bunch of meaningful text. In those cases consider to put
the whole link definition on a separate line even it breaks the visual text
flow of that paragraph.

Alternatively define a link reference with a small, unique and meaningful ID at
the EOF, especially when you refer to the same URL more than once in the file.
Now you are able to *implicit link to a link reference* by using the shortest
possible link notation at all. This is very useful where space is rare, like in
table cells.

Instead of making a proposal which implicit URL link notation to prefer, try
it out or take a guess:

```reply
Link 1: <https://neomutt.org>
Link 2: [https://neomutt.org]

[https://neomutt.org]: <https://www.example.net> "View NeoMutt’s Home Page"
```

**Suggestions**
*   explicit linking is better than implicit (where applicable)
*   be aware of link reference IDs and URLs you use
*   create only lower case IDs for link references
*   capitalise an internal link like its target -- especially for section
    headings \\
    **Note**: Nevertheless consider the context. If it's expectable that the
    link containing paragraph may be copied, the link text becomes probably
    a typo. When in doubt use the grammatically context of the link text.
*   test your linking and use HTTPS scheme where available -- do not rely on
    a correct redirection to it. We are humans and often want to know which
    target a link points to, so also forgo redirections by
    [URL shortening][wpd_url-short].
*   remove unused reference definitions
*   do not link all occurrences of a specific text part. Linking is a nice
    stylistic feature but capable to leave your work.

## Hints <a id="h2_hints"></a>

Just write (maybe only pure text) but in team-like speaking, don't think about
styling, format or *output-*targets, so hopefully you won't get sidetracked and
no idea will be lost. Afterwards, while the review, is time for formatting,
fixing and testing. When you 'markdownify' your work resist to achieve
a certain appearance or behaviour, e.g. to align, colourise or indent
something. That's the domain of cascading style sheets (CSS) and when those are
changing or the user just zooming the page, your 'tuning' may look no longer as
originally intended.

**Remark**: Don't treat the source file for this page as a reference for
a proper Markdown -- it isn't. It uses uncommon and not portable notations to
realise some of the highlighted examples.

### Prefer pure Markdown to HTML <a id="h3_pure-md"></a>

Writing pure Markdown has a huge advantage over a pollution with a mix of HTML
and Liquid elements. It can be used as what it is -- a plain text formatting
syntax. One source for multiple targets (HTML, PDF, email, issue comments, ...)
without any kind of refitting for one specific scenario.

OK, that's often an unreachable ideal and with our website we also have
a clearly defined single target. Here are some applicable notes, use:
*   `\\` instead of `<br />` to force a line break (not possible in
    [tables](#h3_tables))
*       <code>&#x0060;&#x0060;&#x0060;</code> for code blocks rather than
    `<pre><code>...</code></pre>` or
    {% raw %}`{% highlight %}...{% endhighlight %}`{% endraw %}
*   `*[CC]: Carbon Copy` instead of `<abbr title="Carbon Copy">CC</abbr>`
*   Markdown [emphasis](#h3_emphasis) not their HTML counterparts
*   ...

**Note**: One exception currently exists -- internal anchor definitions.
Because our home page includes a fixed banner at its top, site links needs an
offset to display anchored text below the banner. To define a section targeting
anchor, write:
*   `## Section name <a id="sec_name"></a>`

and use it in source with `look at [Section name](#sec_name) to ...` as usually.

### Special and typographic characters <a id="h3_typo-chars"></a>

Even it's worth to strive for [pure Markdown](#h3_pure-md), sometimes we need
more control where line wrapping happens or must insert certain characters like
symbols and pictographs. The kramdown Markdown parser supports
[typographic symbol][kdn_syn_symbol] transformation for often used characters:

| Source  | Result  | Name      | HTML Entity | NCR hex.   | NCR dec.  |
| :-----: | :-----: | :-------- | :---------: | :--------- | :-------- |
| `--`    | --      | en dash   | `&ndash;`   | `&#x2013;` | `&#8211;` |
| `---`   | ---     | em dash   | `&mdash;`   | `&#x2014;` | `&#8212;` |
| `...`   | ...     | ellipsis  | `&hellip;`  | `&#x2026;` | `&#8230;` |
| `<<`    | <<      | guillemet | `&laquo;`   | `&#x00AB;` | `&#171;`  |
| `>>`    | >>      | guillemet | `&raquo;`   | `&#x00BB;` | `&#187;`  |
| `'`...' | &lsquo; | quote     | `&lsquo;`   | `&#x2018;` | `&#8216;` |
| '...`'` | &rsquo; | quote     | `&rsquo;`   | `&#x2019;` | `&#8217;` |
| `"`..." | &ldquo; | quote     | `&ldquo;`   | `&#x201C;` | `&#8220;` |
| "...`"` | &rdquo; | quote     | `&rdquo;`   | `&#x201D;` | `&#8221;` |

\\
Because these characters are easy to type, results in typographical correct
symbols, we use it always although some of them requires more space and the
dashes may a little bit unfamiliar. Abstain from inserting their Unicode or
HTML/XML counterparts directly -- it's not necessary.

**Note**: The guillemets, when used with leading/trailing spaces, becomes
'<<`&nbsp;`' and '`&nbsp;`>>'. This is [typographical wrong][wpd_spwv] for
`<< French quotation >>` marks. Consider to use
`<<&#x202F;French quotation&#x202F;>>` to be pedantic but get a correct
<<&#x202F;French&nbsp;quotation&#x202F;>> until CSS does this job.

It is difficult to frame a common rule for the other unlisted and printable
non-ASCII/non-ANSI characters because their visualisation within the site
and source file depends on support in browsers, editors and installed fonts.

Basically favour to insert those ones directly instead of using their entities.
When all goes well they mostly occupy only the width of a single character
(cell in terminal) and thus, won't impair reading fluency in source like an
unnatural and syntax highlighted HTML/XML entity will. When in doubt or have to
use high code points, e.g. for funny pictographs, take entities. Also have
a look at the several [character references][wkb_ucr] out there, notice
replacement characters like&nbsp;&#xFFFD;.

Notable control, hyphen and space characters:

| Name                           | Wrap | HTML Entity | NCR hex.   | NCR dec.  |
| :----------------------------- | :--- | :---------: | :--------: | :-------: |
| no-break space                 | no   | `&nbsp;`    | `&#x00A0;` | `&#160;`  |
| en space                       | yes  | `&ensp;`    | `&#x2002;` | `&#8194;` |
| em space                       | yes  | `&emsp;`    | `&#x2003;` | `&#8195;` |
| figure space&thinsp;**&sup1;** | no   | ---         | `&#x2007;` | `&#8199;` |
| thin space                     | yes  | `&thinsp;`  | `&#x2009;` | `&#8201;` |
| zero-width non-joiner          | yes  | `&zwnj;`    | `&#x200C;` | `&#8204;` |
| zero-width joiner              | yes  | `&zwj;`     | `&#x200D;` | `&#8205;` |
| non-breaking hyphen (&#x2011;) | no   | ---         | `&#x2011;` | `&#8209;` |
| narrow no-break space          | no   | ---         | `&#x202F;` | `&#8239;` |
| word joiner&thinsp;**&sup2;**  | no   | ---         | `&#x2060;` | `&#8288;` |

**1\.** occupy same width as a digit in the current font (en quad -- half of an em) \\
**2\.** replaces deprecated *zero-width no-break space* (`&#xFEFF;`/`&#65279;`), \\
a.k.a. [BOM code point](#h2_encoding) (when used at file start)

The non-printable characters and the *non-breaking hyphen* are useful, for,
e.g. line break control, character grouping and *micro-*typographical
correctness, to ensure well wrapped tokens/paragraphs and therefore, an ease of
reading in resulting page.

As probably still said, use it:
*   *Not* in command line examples (certainly impacts copy&nbsp;'n paste)
*   but know their intended purpose
*   sparely, only if necessary
*   as entity to easier recognise its usage
*   document wide with consistent notation
*   neither for alignment nor indentation (to prevent whitespace collapsing)
*   for example with:
    *   `2,219&thinsp;&times;&thinsp;656,749` in '2,219&thinsp;&times;&thinsp;656,749&nbsp;=&nbsp;"NeoMutt's Birthday as Unix time"'
    *   `mail&#x2011;client&#x2060;/&#x2060;neomutt` in 'try mail&#x2011;client&#x2060;/&#x2060;neomutt package'
    *   `f&zwnj;f&zwnj;i`/`f&zwnj;f&zwnj;l` in 'f&zwnj;f&zwnj;i/f&zwnj;f&zwnj;l' to avoid &#xFB03;/&#xFB04; ligatures
    *   ...

---

Go [back to top](#top) or file an [issue][nmo_git_issue].


*[ANSI]: American National Standards Institute
*[ASCII]: American Standard Code for Information Interchange
*[BOM]: Byte Order Mark
*[CSS]: Cascading Style Sheets
*[EOF]: End of File
*[GFM]: GitHub Flavoured Markdown
*[NCR]: Numeric Character Reference
*[UCS]: Universal Coded Character Set (Unicode, ISO/IEC)
*[URL]: Uniform Resource Locator
*[UTF-8]: 8-Bit UCS Transformation Format
*[setext]: structure-enhanced text

[jkl_home]: <https://jekyllrb.com/>
[kdn_prs]: <https://kramdown.gettalong.org/parser/kramdown.html>
[kdn_prs_gfm]: <https://kramdown.gettalong.org/parser/gfm.html>
[kdn_ref]: <https://kramdown.gettalong.org/quickref.html>
[kdn_syn]: <https://kramdown.gettalong.org/syntax.html>
[kdn_syn_symbol]: <https://kramdown.gettalong.org/syntax.html#typographic-symbols>
[lqd_git_wiki]: <https://github.com/Shopify/liquid/wiki>
[lqd_tag_comment]: <https://shopify.github.io/liquid/tags/comment/>
[mdn_gfm]: <https://help.github.com/articles/basic-writing-and-formatting-syntax/>
[mdn_std]: <https://daringfireball.net/projects/markdown/>
[mdn_syn_header]: <https://daringfireball.net/projects/markdown/syntax#header>
[nmo_git_issue]: <https://github.com/neomutt/neomutt.github.io/issues>
[tbl_bxt]: <https://github.com/adam-p/markdown-here/>
[tbl_gen]: <https://www.tablesgenerator.com/markdown_tables>
[tbl_vtm]: <https://github.com/dhruvasagar/vim-table-mode>
[wkb_ucr]: <https://en.wikibooks.org/wiki/Unicode/Character_reference>
[wpd_bom]: <https://en.wikipedia.org/wiki/Byte_order_mark>
[wpd_mbcs]: <https://en.wikipedia.org/wiki/Variable-width_encoding>
[wpd_spwv]: <https://en.wikipedia.org/wiki/Non-breaking_space#Width_variation>
[wpd_url-short]: <https://en.wikipedia.org/wiki/URL_shortening>
[wpd_wid-orph]: <https://en.wikipedia.org/wiki/Widows_and_orphans>

