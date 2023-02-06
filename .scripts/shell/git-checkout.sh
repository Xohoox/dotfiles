#!/bin/sh

# for bare repos
#[ "$1" -a "$2" ] || { echo "missing argument!" && exit 128; }
# non bare repos
[ "$1" ] || { echo "missing argument!" && exit 128; }

[ "$1" = "main" ] && cmd="main|master" 
[ "$1" = "dev" ] && cmd="dev|develop" 

# needs branches as input and outputs corresponding branch (for bare repos)
#$2 | sed 's/^\*//;s/\s*//' | xargs -n 1 | grep -Eow "$cmd"

# doesnt need input and checkouts branch (doesnt work with bare repos)
git branch | sed 's/^\*//;s/\s*//' | xargs -n 1 | grep -Eow "$cmd" | xargs git checkout
