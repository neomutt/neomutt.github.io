#!/usr/bin/env bash

travis_fold start "generating HTML out of markdown using jekyll"
jekyll build
travis_fold end "generating HTML out of markdown using jekyll"


find ./_site -type f -iname '*.html' -exec bash -c '
    travis_fold start "Link checking" 
    echo "Files to check: $1"  # travis fold message is not visible completely

    # generates comma separated HTTP error codes
    http_status_to_ignore=({100..399}); 
    printf -v all '%s,' ${http_status_to_ignore[@]};

    htmlproofer \
        --checks-to-ignore "ScriptCheck,ImageCheck" \
        --external_only \
        --http-status-ignore $all {}

    travis_fold end "Link checking" ' +



