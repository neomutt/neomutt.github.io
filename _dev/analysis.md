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
| [compiler](#compiler)         | Enable warnings in gcc/clang |
| [coverage](#coverage)         | Code coverage testing        |
| [coverity](#coverity)         | Source code anaylser         |
| [cppcheck](#cppcheck)         | Source code anaylser         |
| [cproto](#cproto)             | Function prototype generator |
| [ctags](#ctags)               | Source tags generator        |
| [iwyu](#iwyu)                 | Header file checker          |
| [scan-build](#scan-build)     | Source code anaylser         |
| [travis](#travis)             | Continuous Integration       |
| [valgrind](#valgrind)         | Run time memory checker      |

## Clang-Format - Source code formatter <a id="clang-format"></a>

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

```reply
Language: Cpp

TabWidth:          8
UseTab:            Never
IndentWidth:       2
ColumnLimit:       80
BreakBeforeBraces: Allman
```

Clang has documentation for [all of the options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html).

Running it is as simple as:

```sh
clang-format -i source.c
```

- As part of the release process, clang-format is run on all the 'c' source.
- The header files are tidied by hand to preserve the whitespace layout.

## Coccinelle - Source code manipulation <a id="coccinelle"></a>

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
  char *x = NULL;

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
   char *x = NULL;
 
-  if (x == NULL)
+  if (!x)
     something();
 }
```

Here are more examples that have been used on NeoMutt:

- [https://github.com/neomutt/coccinelle](https://github.com/neomutt/coccinelle)

- **See also**: [clang-format](#clang-format)

## Compiler - Enable gcc/clang warnings <a id="compiler"></a>

- gcc [https://gcc.gnu.org/](https://gcc.gnu.org/)
- clang [https://clang.llvm.org/](https://clang.llvm.org/)
- ccache [https://ccache.samba.org/](https://ccache.samba.org/)
- [build scripts](https://github.com/neomutt/management/blob/master/build/README.md#developer-build-scripts)

One of the simplest ways to check your code is to turn on lots of compiler warnings.
You may not agree with some of them, but they highlight potential problems that can be easily avoided.

### Extra Flags

It's simple to add extra compiler/linker flags: set `EXTRA_CFLAGS` and/or `EXTRA_LDFLAGS`  
They will be appended to NeoMutt's settings, e.g.

```sh
./configure OPTIONS
# Enable debugging
make EXTRA_CFLAGS="-ggdb3 -O0 -DDEBUG"
```

### ccache

The Compiler Cache `ccache` is a must for any developer.  
Every time you compile a file, it keeps a hash of the preprocessed file and the object file that it created.
If you build that file again (and it hasn't changed), then the cached version will be used.

### Developer Build Scripts

NeoMutt has published [two build scripts for developers](https://github.com/neomutt/management/blob/master/build/README.md#developer-build-scripts).

Their style makes it very easy to enable/disable or add/remove compilation options.

## Coverage - Code coverage testing <a id="coverage"></a>

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
- Report: [https://coveralls.io/github/neomutt/neomutt](https://coveralls.io/github/neomutt/neomutt)

## Coverity - Source code anaylser <a id="coverity"></a>

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

- **See also**: [travis](#travis)
- **See also**: [scan-build](#scan-build)

## CppCheck - Source code analyser <a id="cppcheck"></a>

- [http://cppcheck.sourceforge.net](http://cppcheck.sourceforge.net)

Since NeoMutt's code base is relatively big, it is easier to execute CppCheck from the command line and let it save its analysis to an output file.

CppCheck is available on all major platforms, so it can probably be installed through the package manager of your system.
In case you are using Windows (but not Cygwin) it is possible to download the installer from the website.
We can use `cppcheck-gui` afterwards for filtering the warnings we want to analyze.

You can use following command for analyzing the source code

```sh
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

## Cproto - Function prototype generator <a id="cproto"></a>

- [https://invisible-island.net/cproto/cproto.html](https://invisible-island.net/cproto/cproto.html)

Given a source file, cproto, will generate prototypes for all the functions.
This is slightly useful on its own, but it can be used as the basis for:

- analysing functions and parameters
- generating doxygen comment blocks

```sh
cproto -D USE_SIDEBAR=1 -I .  -s source.c
```

- **See also**: [ctags](#ctags)

## Ctags - Source tags generator <a id="ctags"></a>

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

```sh
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

## Include-What-You-Use - Header file checker <a id="iwyu"></a>

- [https://include-what-you-use.org/](https://include-what-you-use.org/)

**iwyu** is a tool for deciding which `#include`s are needed, or not.
Including the right files, and no more, can speed up builds.
It also helps to show the dependencies of a file.

**iwyu** uses [clang](https://clang.llvm.org/) to create an
[AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree) for the code.

### Example

A sample call and its output.

```sh
iwyu -I. -Xiwyu --no_comments -Xiwyu --pch_in_code -Xiwyu --mapping_file=neomutt.imp thread.c
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

## Scan-Build - Source code anaylser<a id="scan-build"></a>

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

## Travis - Continuous Integration <a id="travis"></a>

- [https://travis-ci.org/](https://travis-ci.org/)

Travis provides a [continuous integration](https://en.wikipedia.org/wiki/Continuous_integration)
service which is connected to NeoMutt's git repos on GitHub.

Each repo has a `.travis.yml` file which tells Travis what to do.  After every
commit to GitHub and for every Pull-Request, Travis performs the instructions
in that file.

Here are some of they ways that NeoMutt uses this service.

### Building of the source

To test the source code, Travis performs a set of builds with different
configure options.
[`.travis.yml`](https://github.com/neomutt/neomutt/blob/master/.travis.yml)
installs all the dependencies that are needed, but the build is controlled by a
[separate script](https://github.com/neomutt/travis-build/blob/master/build).

The script has per-branch rules to determine how many builds to do and which
options to use.  [_read more..._](https://github.com/neomutt/travis-build#travis-configs)

- [master](https://github.com/neomutt/travis-build/blob/master/master.txt): 4
- [devel/\*](https://github.com/neomutt/travis-build/blob/master/devel.txt): 1
- [pull-request](https://github.com/neomutt/travis-build/blob/master/pull-request.txt): 2

### Checking of the website links

To test the website, Travis checks all of the HTML for errors.

[`.travis.yml`](https://github.com/neomutt/neomutt.github.io/blob/master/.travis.yml)
installs [Jekyll](https://jekyllrb.com/) and 
[html-proofer](https://github.com/gjtorikian/html-proofer#htmlproofer).

The testing is done by running the
[Rakefile](https://github.com/neomutt/neomutt.github.io/blob/master/Rakefile).

### Deployment of the translations

After a translator makes an update, Travis checks the results and updates the
[Translation Leaderboard](https://neomutt.org/translate)

The [translate](https://github.com/neomutt/neomutt/tree/translate)
branch has a custom
[`.travis.yml`](https://github.com/neomutt/neomutt/blob/translate/.travis.yml)
and [some scripts](https://github.com/neomutt/neomutt/tree/translate/.travis)
to generate a webpage.

On success, the website is automatically updated.  
For more details, read [Deployment using Travis](/dev/deploy).

### Travis Tool

Travis also supply a command line tool for managing their service.

```sh
gem install travis
```

NeoMutt used this to encrypt ssh keys for use in [automatic deployment](/dev/deploy).

## Valgrind - Run time memory checker <a id="valgrind"></a>

- [http://valgrind.org/](http://valgrind.org/)

Valgrind is a set of debugging tools.

**Note**: Running a program under will consume more memory and run much more slowly than normal.

### Memchecker

The default tool is a memory-checker, e.g.

```sh
valgrind -v --leak-check=full --track-origins=yes neomutt
```

The results can be saved to a file by adding `--log-file v.txt`

It reports:
- Leaked memory (and where it was allocated)
- Out of bounds memory accesses
- Conditionals that relied on uninitialised memory

```reply
LEAK SUMMARY:
   definitely lost: 1,368 bytes in 22 blocks
   indirectly lost: 179 bytes in 5 blocks
     possibly lost: 1,352 bytes in 18 blocks
   still reachable: 672,679 bytes in 640 blocks
```

### Memchecker Suppressions

Memchecker reports **every** problem it finds, including any shared libraries.
These false-positives can be ignored using a suppression file.
To generate one, run the program with an extra argument:

```sh
valgrind -v --leak-check=full --track-origins=yes --gen-suppressions=all neomutt
```

Valgrind's output will include suppression blocks like this:

```reply
{
   <insert_a_suppression_name_here>
   Memcheck:Leak
   match-leak-kinds: possible
   fun:calloc
   fun:g_malloc0
   fun:type_node_any_new_W
   fun:type_node_fundamental_new_W
   fun:g_type_register_fundamental
   fun:_g_object_type_init
   fun:gobject_init
   fun:gobject_init_ctor
   fun:call_init.part.0
   fun:call_init
   fun:_dl_init
   obj:/usr/lib64/ld-2.27.so
}
```

Cut out the ones you'd like to ignore, then put them in a file, `sup.txt`, then
re-run your program:

```sh
valgrind -v --leak-check=full --track-origins=yes --suppressions=sup.txt neomutt
```

### Callgrind

Callgrind is a profiler.  It records which functions are called, how often and
how long each one took, e.g.

```sh
valgrind --tool=callgrind neomutt
```

It creates a log file `callgrind.out.[PID]` which can be viewed in
[kcachegrind](https://kcachegrind.github.io/html/Home.html).

[![kcachegrind](/images/kcg-thumb.png)](/images/kcachegrind.png)

### Debugging with Valgrind

[Running NeoMutt under a debugger](debug) can be a good way to find bugs, but
sometimes it's hard to see the **exact** point when something goes wrong.
Using Valgrind and gdb in combination, it's possible to trap the instruction
that causes a buffer overrun, or reads an uninitialised piece of memory.

**Note**: Memory **leaks** can't be detected as they happen.

Window 1:
```sh
valgrind --vgdb=yes --vgdb-error=0 neomutt [ARGS]
```

Window 2:
```sh
gdb neomutt
# Inside gdb
target remote | vgdb
continue
```

Valgrind adds extra commands to gdb to examine the memory.
See [Valgrind's documentation](http://valgrind.org/docs/manual/manual-core-adv.html) for more details.

