---
layout: concertina
title: Header Cache Benchmark
description: Script to test the speed of the header cache
author: Pietro Cerutti
username: gahr
status: stable
dir: "&mdash;"
---

# {{ page.title }}

## Introduction

The [shell script](/contrib/hcache-bench.sh) and the
[configuration file](/contrib/hcache-bench.rc) can be used to benchmark the
NeoMutt hcache backends.

## Preparation

In order to run the benchmark, you must have a directory in maildir format at
hand. Mutt will load messages from there and populate the header cache with
them. Please note that you'll need a reasonable large number of messages --
\>50k -- to see anything interesting.

## Running the benchmark

The script accepts the following arguments

```reply
-e Path to the mutt executable
-m Path to the maildir directory
-t Number of times to repeat the test
-b List of backends to test
```

Example: \\
`./neomutt-hcache-bench.sh -e /usr/local/bin/mutt -m ../maildir -t 10 -b "lmdb qdbm bdb kyotocabinet"`

## Operation

The benchmark works by instructing Mutt to use the backends specified with `-b`
one by one and to load the messages from the maildir specified with `-m`. Mutt
is launched twice with the same configuration. The first time, no header cache
storage exists, so Mutt populates it. The second time, the previously populated
header cache storage is used to reload the headers. The times taken to execute
these two operations are kept track of independently.

At the end, a summary with the average times is provided.

## Sample output

```
$ sh neomutt-hcache-bench.sh -m ~/maildir -e mutt -t 10 -b "bdb gdbm qdbm lmdb kyotocabinet tokyocabinet"
```

```reply
Running in /tmp/tmp.TFHQ8iPy
 1 - populating - bdb
 1 - reloading  - bdb
 1 - populating - gdbm
 1 - reloading  - gdbm
 1 - populating - qdbm
 1 - reloading  - qdbm
 1 - populating - lmdb
 1 - reloading  - lmdb
 1 - populating - kyotocabinet
 1 - reloading  - kyotocabinet
 1 - populating - tokyocabinet
 1 - reloading  - tokyocabinet
 2 - populating - bdb
 2 - reloading  - bdb
 2 - populating - gdbm
 ....
10 - populating - kyotocabinet
10 - reloading  - kyotocabinet
10 - populating - tokyocabinet
10 - reloading  - tokyocabinet

*** populate
bdb            8.814 real 4.227 user 2.667 sys
gdbm           24.938 real 4.082 user 3.852 sys
qdbm           9.806 real 5.201 user 2.480 sys
lmdb           7.637 real 3.589 user 2.385 sys
kyotocabinet   11.493 real 6.456 user 2.537 sys
tokyocabinet   9.521 real 5.104 user 2.356 sys

*** reload
bdb            2.101 real 1.027 user .614 sys
gdbm           3.474 real .885 user .584 sys
qdbm           2.170 real 1.142 user .552 sys
lmdb           1.694 real .845 user .478 sys
kyotocabinet   2.729 real 1.541 user .591 sys
tokyocabinet   2.526 real 1.395 user .581 sys
```

## Notes

The benchmark uses a temporary directory for the log files and the header cache
storage files. These are left available for inspection. This also means that
*you* must take care of removing the temporary directory once you are done.

The path to the temporary directory is printed on standard output when the
benchmark starts, e.g., `Running in /tmp/tmp.WjSFtdPf`.

## Results of Run 1 - 10 iterations, 100,000 emails

### populate

| database     | real     | user     | sys      |
| :----------- | -------: | -------: | -------: |
| bdb          | 3.529000 | 1.820000 | 0.597000 |
| lmdb         | 3.564000 | 1.720000 | 0.642000 |
| qdbm         | 3.584000 | 2.886000 | 0.618000 |
| tokyocabinet | 3.679000 | 2.927000 | 0.731000 |
| gdbm         | 4.341000 | 2.091000 | 1.223000 |
| kyotocabinet | 5.160000 | 3.841000 | 1.291000 |

### reload

| database     | real     | user     | sys      |
| :----------- | -------: | -------: | -------: |
| lmdb         | 0.966000 | 0.766000 | 0.183000 |
| bdb          | 1.060000 | 0.858000 | 0.192000 |
| gdbm         | 1.179000 | 0.966000 | 0.188000 |
| tokyocabinet | 1.321000 | 1.128000 | 0.183000 |
| qdbm         | 1.331000 | 1.137000 | 0.184000 |
| kyotocabinet | 1.417000 | 1.203000 | 0.202000 |

## Results of Run 2 - 10 iterations, 100,000 emails

### populate

| database     | real     | user     | sys      |
|: ------------| -------: | -------: | -------: |
| bdb          | 3.454000 | 1.835000 | 0.595000 |
| qdbm         | 3.570000 | 2.857000 | 0.629000 |
| lmdb         | 3.597000 | 1.747000 | 0.636000 |
| tokyocabinet | 3.666000 | 2.923000 | 0.724000 |
| gdbm         | 4.365000 | 2.083000 | 1.234000 |
| kyotocabinet | 5.117000 | 3.819000 | 1.275000 |

### reload

| database     | real     | user     | sys      |
| :----------- | -------: | -------: | -------: |
| lmdb         | 0.926000 | 0.745000 | 0.173000 |
| bdb          | 1.049000 | 0.855000 | 0.188000 |
| gdbm         | 1.157000 | 0.954000 | 0.191000 |
| qdbm         | 1.313000 | 1.108000 | 0.197000 |
| tokyocabinet | 1.318000 | 1.116000 | 0.190000 |
| kyotocabinet | 1.386000 | 1.167000 | 0.209000 |

## Results of Run 3 - 10 iterations, 100,000 emails

### populate

| database     | real     | user     | sys      |
| :----------- | -------: | -------: | -------: |
| bdb          | 3.306000 | 1.609000 | 0.606000 |
| qdbm         | 3.344000 | 2.632000 | 0.622000 |
| tokyocabinet | 3.433000 | 2.690000 | 0.727000 |
| lmdb         | 3.646000 | 1.484000 | 0.623000 |
| gdbm         | 4.184000 | 1.814000 | 1.206000 |
| kyotocabinet | 4.754000 | 3.471000 | 1.261000 |

### reload

| database     | real     | user     | sys      |
| :----------- | -------: | -------: | -------: |
| lmdb         | 0.730000 | 0.544000 | 0.179000 |
| bdb          | 0.854000 | 0.655000 | 0.192000 |
| gdbm         | 0.936000 | 0.738000 | 0.190000 |
| qdbm         | 1.098000 | 0.899000 | 0.191000 |
| tokyocabinet | 1.105000 | 0.907000 | 0.187000 |
| kyotocabinet | 1.250000 | 1.036000 | 0.207000 |

