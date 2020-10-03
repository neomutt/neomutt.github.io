---
title: Web Guide
description: Update the online NeoMutt Guide
author: Richard Russon
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include release-links.html %}

The NeoMutt Guide and Man Pages are transformed into html using a series of
scripts and hand-editing.  When the new Help System is finished, we can convert
all the docs to Markdown and updating will become trivial.

**Repos needed**:
- [https://github.com/neomutt/docbook](https://github.com/neomutt/docbook)
- [https://github.com/neomutt/management](https://github.com/neomutt/management)
- [https://github.com/neomutt/neomutt](https://github.com/neomutt/neomutt)
- [https://github.com/neomutt/neomutt.github.io](https://github.com/neomutt/neomutt.github.io)

## Checks

Before starting, check the docs:

- Check indent (visually)
- Check the spelling
  `codespell doc/manual.xml`
- Validate the docs
  - `./configure --full-doc`
  - `make validate-doc`

Now,

- Save the version number for later:
  `neomutt -v | head -n1`
- Copy the DocBook manual:
  `cp doc/manual.xml ../docbook`

## Generate HTML

The next part takes place in the `docbook` repo.
We start by processing the `manual.xml` file.

1. Process the 'Feature' section
   1. Find 'Features' section
      - Start:  `<sect1 id="attach-headers-color">`
      - End:    `<chapter id="security">`

   2. Promote all the sections ([vim-abolish](https://github.com/tpope/vim-abolish) helps):
      - `S/{sect1,sect2,sect3,sect4,sect5}/{chapter,sect1,sect2,sect3,sect4}/w`
      - Reduce indent by two spaces: `s/^  //`

   3. Move the extra `<chapter>`
      There's now an extra `<chapter>` tag at the end of the Features.
      Move it before the Features, to close the previous section.

2. Transform links to form nesting, e.g.  `s:"fmemopen":"feature/fmemopen":`
   1. Use `../management/docs-bin/transform-links.vim`
   2. Fix about 8 links (`git diff` will help find them)
      Some links are transformed that shouldn't have been.
      There are a few `feature/` links that don't refer to features, just config.
      There are some suffixes that shouldn't be there, e.g. `-hook`, `-patch`, `-folder`

3. Any remaining changes should be those expected by the changes to the docs.

4. Build the html
   1. `./build`
   2. `cp guide/*   ../neomutt.github.io/guide/`
   3. `cp feature/* ../neomutt.github.io/_feature/`

5. After checking the results (in the next section), commit with full NeoMutt version string:
   
   1. `git commit --all --message 'NeoMutt 20180716-2125-b37a78'`
   2. `git push origin master`

## Installing the HTML

This part takes place in the `neomutt.github.io` repo.
The html still needs some more processing.

1. Fix links:
   - `sed -i -f ../management/docs-bin/fix-links.sed guide/* _feature/*`

2. Fix 'Features' since:
   - `cd _features`
   - `../../management/docs-bin/fix-feature-since.sh`
   - Set fmemopen feature state to 'disabled'

3. Test html pages:
   1. `jekyll build`
      The docs will be build into the `_site` directory
   2. `jekyll serve`
      This will start a local webserver at [http://127.0.0.1:4000/](http://127.0.0.1:4000/)
   3. `rake`
      This runs html-proofer to check all the links (and it takes a while)

4. After checking the results, commit with full NeoMutt version string:
   1. `git commit --all --message 'guide: NeoMutt 20180716-2125-b37a78'`
   2. `git push origin master`

## Manual Pages

This part takes place in the `neomutt.github.io` repo.
Next, generate the man pages.

```sh
cd _man
_generate ../../neomutt
```

Now, commit the man pages:

```sh
git commit --all --message 'man: NeoMutt 20180716-2125-b37a78'
git push origin master
```

## Practice

To demonstrate the process, I've commited all the steps in a recent update.
You can check your results as you work.

Start in the `neomutt` repo at commit `b37a784d4`.

Each of the steps in the `docbook` repo is a separate commit in a side-branch.

```
*   8e06133 merge: NeoMutt 20180716-2125-b37a78
|\  
| * c5e3a97 fix some broken links
| * 897cb61 transform links
| * ea2c564 promote the features section
| * 41f1eea manual.xml, unchanged from source build
|/  
*
```

Each of the steps in the `neomutt.github.io` repo is a separate commit in a side-branch.

```
*   c0b013f merge: NeoMutt 20180716-2125-b37a78
|\  
| * 6ebc022 fix fmemopen
| * 0c65904 fix-features-since
| * 1117c51 fix links
| * ae4db49 html copied from docbook
|/  
*
```

