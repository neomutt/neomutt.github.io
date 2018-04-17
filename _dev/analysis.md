---
layout: concertina
title: Analyze NeoMutt
description: Ways to Analyze NeoMutt's code
---

# {{ page.title }}

[Wikipedia](https://en.wikipedia.org/wiki/List_of_tools_for_static_code_analysis#C,_C++)
has a nice list of static analyzers for C source code.  Those can be used to
find bugs without compiling, executing and debugging NeoMutt.

If you have any questions, please send them to the developers' mailing list: [neomutt-devel@neomutt.org](mailto:neomutt-devel@neomutt.org)

| Tool                          | Description                  |
| :---------------------------- | :--------------------------- |
| [clang-format](#clang-format) | Source code formatter        |
| [coccinelle](#coccinelle)     | Source code manipulator      |
| [coverage](#coverage)         | Code coverage testing        |
| [coverity](#coverity)         | Source code anaylser         |
| [cppcheck](#cppcheck)         | Source code anaylser         |
| [cproto](#cproto)             | Function prototype generator |
| [ctags](#ctags)               | Source tags generator        |
| [iwyu](#iwyu)                 | Header file checker          |
| [scan-build](#scan-build)     | Source code anaylser         |

## Clang-Format - Source code formatter <a class="offset" id="clang-format"></a>

- [https://clang.llvm.org/docs/ClangFormat.html](https://clang.llvm.org/docs/ClangFormat.html)

`clang-format` is a source code formatter -- it changes source files according to a config file.

In NeoMutt we use it to:
- Place `{}`s in the right place
- Adjust the whitespace: indent and around operators
- Sort the `#include`s (see the weighting strategy)
- Align a pointer `*` to the variable, not the type
- ... and much more

Unlike many similar tools, it really understands the code it's transforming.
It uses [clang](https://clang.llvm.org/) to create an
[AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the code.

[NeoMutt's config file](https://github.com/neomutt/neomutt/blob/master/.clang-format) ships with the code.

The config file looks like this:

```
Language: Cpp

TabWidth:          8
UseTab:            Never
IndentWidth:       2
ColumnLimit:       80
BreakBeforeBraces: Allman
```

Clang has documentation for [all of the options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html).

Running it is as simple as:

```
clang-format -i source.c
```

- As part of the release process, clang-format is run on all the 'c' source.
- The header files are tidied by hand to preserve the whitespace layout.

## Coccinelle - Source code manipulation <a class="offset" id="coccinelle"></a>

- [http://coccinelle.lip6.fr/](http://coccinelle.lip6.fr/)

Coccinelle is a tool for manipulating C source code.  Because it really
understands C, you can make complex changes, e.g.  If `x` is an integer,
replace `if (!x)` with `if (x == 0)`

This means that you could define some code style rules and automatically check
that they're being used.

Coccinelle uses a transformation language that it applies to C source.
The output is a diff that can be applied.

```c
/* Source file to be checked */
int main()
{
  char *x;

  if (x == NULL)
    something();
}
```

```diff
// Find pointers that are checked against NULL
@@
type T;
identifier I;
statement S1;
@@

T *I;

(
- if (I == NULL)
+ if (!I)
S1
)
```

```sh
# Generate the diff
spatch --sp-file null-check.cocci source.c
```

```diff
--- source.c
+++ source.c
@@ -4,6 +4,6 @@ int main()
 {
   char *x;
 
-  if (x == NULL)
+  if (!x)
     something();
 }
```

Here are more examples that have been used on NeoMutt:

- [https://github.com/neomutt/coccinelle](https://github.com/neomutt/coccinelle)

- **See also**: [clang-format](#clang-format)

## Coverage - Code coverage testing <a class="offset" id="coverage"></a>

- Lcov [http://ltp.sourceforge.net/coverage/lcov.php](http://ltp.sourceforge.net/coverage/lcov.php)
- Coveralls [https://coveralls.io/](https://coveralls.io/)

When testing a program, it's often useful to know which parts of the code have
actually been used.  Coverage testing collects statistics about a running
program.

First the program needs to be compiled and linked with some extra options.
This will generate a `.gcno` coverage files for each object.

```makefile
CFLAGS  += -fprofile-arcs -ftest-coverage
LDFLAGS += -fprofile-arcs -ftest-coverage
```

When the program is run, every function will write data to a `.gcda` file.
`lcov` can convert the saved data into an html table.

```sh
lcov -t "result" -o lcov.info -c -d config
genhtml -o lcov lcov.info
```

Coveralls performs the same function, but it has a much prettier website.

```sh
# Install the coveralls helper programm
pip install --user cpp-coveralls

export COVERALLS_REPO_TOKEN=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

# Update the stats, excluding (-e) certain files/dirs
coveralls -e mutt -e test -e dump -e main.c -e config/dump.c
```

Currently, the only part of NeoMutt that has a coverage report is the new
config code:

- Source code: [https://github.com/neomutt/test-config](https://github.com/neomutt/test-config)
- Report: [https://coveralls.io/github/flatcap/neomutt](https://coveralls.io/github/flatcap/neomutt)

## Coverity - Source code anaylser <a class="offset" id="coverity"></a>

- [https://scan.coverity.com](https://scan.coverity.com)

Coverity Scan is a free static-analysis cloud-based service for the open source
community.  As the free service is limited to a few scans per day, it isn't run
automatically.

- Resource leaks
- Potential NULL dereferences
- Logically dead code
- and much more

To run the check, create a branch of the NeoMutt repo and use the
[coverity `.travis.yml`](https://github.com/neomutt/management/blob/master/travis/coverity.yml)
file.  The rest of the process is automated.

The latest statistics on NeoMutt can be found here:

- [https://scan.coverity.com/projects/neomutt-neomutt](https://scan.coverity.com/projects/neomutt-neomutt)

For security, the details of the defects are not made public.  If you wish to
see the details, you must create an account (or login with GitHub) and click
"Add me to project".

- **See also**: [scan-build](#scan-build)

## CppCheck - Source code analyser <a class="offset" id="cppcheck"></a>

- [http://cppcheck.sourceforge.net](http://cppcheck.sourceforge.net)

Since NeoMutt's code base is relatively big, it is easier to execute CppCheck from the command line and let it save its analysis to an output file.

CppCheck is available on all major platforms, so it can probably be installed through the package manager of your system.
In case you are using Windows (but not Cygwin) it is possible to download the installer from the website.
We can use `cppcheck-gui` afterwards for filtering the warnings we want to analyze.

You can use following command for analyzing the source code

```
cppcheck --enable=all --language=c --std=c99 -i autosetup --platform=unspecified -D_POSIX_PATH_MAX=4096 -DPATH_MAX=2048 -I/usr/include -I/usr/include/mit-krb5 -I. --output-file=cppcheck.xml --xml --xml-version=2 <path to neomutt source code directory>
```

A complete description of all parameters can be found through `man cppcheck` or `cppcheck --help`.
Some considerations:

- `--enable-all --output-file=<filename> --xml --xml-version=2` collect as many warning as possible and save them to a file, in order to view them later with `cppcheck-gui`
- `--platform=unspecified` do not restrict the analysis to a 32 or 64 bit platform
- `--language=c --std=c99` NeoMutt follows this standard
- `-D_POSIX_PATH_MAX=4096 -DPATH_MAX=2048` can be left out, but CppCheck may warn that it does not know the values for those macros. Since most of the time the actual values are not relevant, you might just set them to two numeric values.
- `-i autosetup` for excluding the `autosetup` directory
- `-I<path>` where to find include files

If cppcheck takes too much time for analyzing the source code, it is always possible to analyze only specific files, tell it to test less macro combinations, or to not enable all warnings.

## Cproto - Function prototype generator <a class="offset" id="cproto"></a>

- [https://invisible-island.net/cproto/cproto.html](https://invisible-island.net/cproto/cproto.html)

Given a source file, cproto, will generate prototypes for all the functions.
This is slightly useful on its own, but it can be used as the basis for:

- analysing functions and parameters
- generating doxygen comment blocks

```sh
cproto -D USE_SIDEBAR=1 -I .  -s source.c
```

- **See also**: [ctags](#ctags)

## Ctags - Source tags generator <a class="offset" id="ctags"></a>

- [http://ctags.sourceforge.net/](http://ctags.sourceforge.net/)

`ctags` generates tags files that your editor can use to lookup symbols in the source:
all the functions, structs, global variables, etc.

It can be run:

```sh
# Recursively
ctags -R .

# On specific files
ctags source1.c source2.c
```

Unfortunately, that will include some source that isn't useful.
Using `find` can help exclude some files and directories:

```
find . -name '*.[ch]' ! -path './autosetup/*' ! -path './test/*' ! -path './doc/*' ! -path './pgp*.c' | cut -b3- | xargs ctags
```

`ctags` can also extract certain types of information.
This can be useful for analysis of the code.

```sh
ctags -R -x --c-kinds=f   . > functions.txt
ctags -R -x --c-kinds=gsu . > structs.txt
ctags -R -x --c-kinds=v   . > variables.txt
```

- **See also**: [cproto](#cproto)

## Include-What-You-Use - Header file checker <a class="offset" id="iwyu"></a>

- [https://include-what-you-use.org/](https://include-what-you-use.org/)

**iwyu** is a tool for deciding which `#include`s are needed, or not.
Including the right files, and no more, can speed up builds.
It also helps to show the dependencies of a file.

**iwyu** uses [clang](https://clang.llvm.org/) to create an
[AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the code.

### Example

A sample call and its output.

```
iwyu -I. -Xiwyu --no_comments -Xiwyu --pch_in_code -Xiwyu --mapping_file=/home/mutt/work/neomutt.imp thread.c
```

```reply
thread.c should remove these lines:
- #include "globals.h"

The full include-list for thread.c:
#include "config.h"
#include "thread.h"
#include <limits.h>
#include <stdlib.h>
#include <time.h>
#include "body.h"
#include "header.h"
#include "mutt/mutt.h"
#include "sort.h"
```

Common options used are:

| Option                       | Description                            | Notes           |
| :--------------------------- | :------------------------------------- | :-------------- |
| `-I.`                        | Add an include dir `.`                 | Passed to clang |
| `-DSYMBOL`                   | Define a SYMBOL                        | Passed to clang |
| `-Xiwyu --no_comments`       | Don't add notes to the output          | IWYU option     |
| `-Xiwyu --pch_in_code`       | The file has an important header first | IWYU option     |
| `-Xiwyu --mapping_file=FILE` | Use this lookup file                   | IWYU option     |

### Mapping File

It's hard for **iwyu** to work out which header files the developers think are
important.  For example, in NeoMutt, you can replace lots of library headers:

```c
#include "mutt/message.h"
#include "mutt/address.h"
#include "mutt/rfc2047.h"
#include "mutt/mapping.h"
#include "mutt/hash.h"
```

with one helper header

```c
#include "mutt/mutt.h"
```

The [mapping file](https://github.com/neomutt/management/blob/master/iwyu/neomutt.imp)
also provides fixes for some header files in glibc that cause confusion.
It looks like this:

```python
# Include one library header rather than the individual headers.
{ include: [ '@"mutt/.*"', private, '"mutt/mutt.h"', public ] },
{ include: [ '@"conn/.*"', private, '"conn/conn.h"', public ] },
```

## Scan-Build - Source code anaylser<a class="offset" id="scan-build"></a>

- [https://clang-analyzer.llvm.org/scan-build.html](https://clang-analyzer.llvm.org/scan-build.html)

scan-build is a static analyzer and part of the clang family of tools.
It can detect:
- Resource leaks
- Potential NULL dereferences
- Logically dead code
- and much more

It will create an HTML report for all the issues that it finds.
It's very simple to run:

```sh
# Configure NeoMutt as normal
./configure [OPTIONS]
# Run make under scan-build
scan-build make
```

- **See also**: [coverity](#coverity)

