---
layout: concertina
title: Translating Code
description: How to make the code translatable
status: notes
---

# {{ page.title }}

_() vs N_() + gettext()

build steps

msgfmt

  setlocale (LC_ALL, "");

#ifdef ENABLE_NLS
  bindtextdomain (PACKAGE, MUTTLOCALEDIR);
  textdomain (PACKAGE);
#endif

ALL_LINGUAS="bg ca cs da de el en_GB eo es et eu fr ga gl hu id it ja ko lt nl pl pt_BR ru sk sv tr uk zh_CN zh_TW"
check po/XXX.po

m4/gettext.m4
  ALL_LINGUAS -> POFILES, GMOFILES

configure -> po/Makefile
  po/POTFILES.in
  list of files to search

search:

/usr/share/locale/en_GB.UTF-8/LC_MESSAGES/mutt.mo
/usr/share/locale/en_GB.utf8/LC_MESSAGES/mutt.mo
/usr/share/locale/en_GB/LC_MESSAGES/mutt.mo
/usr/share/locale/en.UTF-8/LC_MESSAGES/mutt.mo
/usr/share/locale/en.utf8/LC_MESSAGES/mutt.mo
/usr/share/locale/en/LC_MESSAGES/mutt.mo

