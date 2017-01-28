#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail


# runs on every commit pushed to github.
# => just need to check one commit at a time.

function fail(){
    local color_end=$'\033[0m'
    local red='\033[0;31m'

    echo -e "${red}Error:"
    echo -e "$color_end"
    echo "$1"

    exit 1
}

# fail the build if file in the guide/ folder has changed,
# => is generated, needs to be changed in neomutt repository.
if [[ ! $(git diff-tree --no-commit-id --name-only -r HEAD |
               grep --color=never -E '.*guide.*' ) > "" ]]
then
    variable=$(cat <<EOF
Every file in the guide/ directory is automatically generated from the manual
https://github.com/neomutt/neomutt/tree/neomutt/doc/manual.xml.head - So please,
do your changes there.
EOF
)
    fail "$variable"

fi
