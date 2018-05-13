#!/bin/bash


jekyll build
http_status=({100..399});
printf -v all '%s,' ${http_status[@]};

#maybe https://unix.stackexchange.com/a/25378 is better?

htmlproofer --http-status-ignore $all --assume-extension ./_site

