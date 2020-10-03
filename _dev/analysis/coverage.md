---
title: Coverage
description: Code coverage testing
author: flatcap
---

# {{ page.title }}

{:.subtitle}
{{ page.description }}
{% include analysis-links.html %}

- Lcov [http://ltp.sourceforge.net/coverage/lcov.php](http://ltp.sourceforge.net/coverage/lcov.php)
- Coveralls [https://coveralls.io/](https://coveralls.io/)

When testing a program, it's often useful to know which parts of the code have
actually been used.  Coverage testing collects statistics about a running
program.

First the program needs to be compiled and linked with some extra options.
This will generate a `.gcno` coverage files for each object.

For NeoMutt, simply add an option to configure, then build as normal.
The results will be in `lcov/index.html`

```sh
./configure --coverage
make
make coverage
```

For other projects, add these to your Makefile:

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

NeoMutt has coverage of several libraries: address, compress, config, core, email, mutt, store.

- Source code: [https://github.com/neomutt/test-config](https://github.com/neomutt/test-config)
- Report: [https://coveralls.io/github/neomutt/neomutt](https://coveralls.io/github/neomutt/neomutt)

