#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

EXIT_STATUS=0


# runs on every commit pushed to github.
# => just need to check one commit at a time.

# --------------------------------[ Functions ]----------------------------------
function fail(){
    local color_end=$'\033[0m'
    local red='\033[0;31m'

    echo -e "${red}Error:$color_end $1"
}

function success(){
    local color_end=$'\033[0m'
    local green='\033[0;32m'

    echo -e "${green}Notice:$color_end $1"
}

function notice(){
    local color_end=$'\033[0m'
    local purple='\033[0;35m'

    echo -e "${purple}Notice:$color_end $1"
}

function install_gem(){
    gem install "$@"
}


# ---------------------------------[ Checks ]------------------------------------

notice "Checking for changes in guide/ folder.."

# fail the build if file in the guide/ folder has changed,
# => is generated, needs to be changed in neomutt repository.
if [[ $(git diff-tree --no-commit-id --name-only -r HEAD |
            grep --color=never -E '.*guide.*'
      ) != "" ]]
then
    variable=$(cat <<EOF
Every file in the guide/ directory is automatically generated from the manual
https://github.com/neomutt/neomutt/tree/neomutt/doc/manual.xml.head - So please,
do your changes there.
EOF
)
    fail "$variable"
    EXIT_STATUS=1

else
    notice "no changes in guide/ folder detected."
fi

# -------------------------------------------------------------------------------


notice "checking for changes in _man/ folder."

# fail if manpages were edited.
# => is generated, needs to be changed in neomutt repository.
if [[ $(git diff-tree --no-commit-id --name-only -r HEAD |
               grep --color=never -E '.*_man.*' |
         grep --color=never -vE '_generate.sh'
         ) != "" ]]
then
    variable=$(cat <<EOF
Every file in the _man/ directory is automatically generated from the manpages
in https://github.com/neomutt/neomutt/tree/neomutt/doc/ - So please,
do your changes there.
EOF
)
    fail "$variable"
    EXIT_STATUS=1
else
    notice "no changes in _man/ folder detected."
fi

# -------------------------------------------------------------------------------

echo "done."
exit $EXIT_STATUS
