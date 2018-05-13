#!/usr/bin/env bash

travis_fold start "displaying this file"
cat ./.test.sh
travis_fold end "displaying this file"


travis_fold start "generating HTML out of markdown using jekyll"
jekyll build
travis_fold end "generating HTML out of markdown using jekyll"

function run_link_checker() {
    travis_fold start "Link checking $1"

    htmlproofer \
        --checks-to-ignore "ScriptCheck,ImageCheck" \
        --external_only \
        --http-status-ignore $all 

    travis_fold end "Link checking $1"
}
export -f run_link_checker

# generates comma separated HTTP error codes
http_status_to_ignore=({100..399});
printf -v all '%s,' ${http_status_to_ignore[@]};

find ./_site -type f -iname '*.html' | xargs -n 5 run_link_checker {}



