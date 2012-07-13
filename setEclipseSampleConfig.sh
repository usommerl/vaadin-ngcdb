#!/bin/bash

RENAMECMD=perl-rename
hash $RENAMECMD 2>/dev/null

if [ $? != 0 ]; then
    echo "I require $RENAMECMD but it's not installed.  Aborting."
    exit 1
else
    while true; do
        echo
        echo "This script will override existing eclipse config files and reset the working directory of your repository. The purpose of this procedure is to set up a basic eclipse configuration for new repository clones. Do not execute it in a modified working copy, because it will revert all your local changes! Do you want to continue? [y/n]: "
        echo
        read answer
        echo

        if  [ "$answer" == "y" ]; then
            echo "Bro, you wanted it that way!"
            find -name "*.sample" | $RENAMECMD -vf 's/\.sample$//'
            git checkout .
            echo
            break
        elif [ "$answer" == "n" ]; then
            echo "Ah, I knew you would chicken out!"
            echo
            break
        fi
    done
    exit 0
fi



