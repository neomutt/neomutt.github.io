#!/bin/bash


jekyll build
http_status=({100..399});
printf -v all '%s,' ${http_status[@]};

#maybe https://unix.stackexchange.com/a/25378 is better?

find ./_site -type f -iname '*.html' -exec htmlproofer --checks-to-ignore "ScriptCheck,ImageCheck" --external_only --http-status-ignore $all {} \;

