#!/bin/bash

dir=$(dirname "${BASH_SOURCE[0]}")

# requires pandoc and sed
# example usage
# ./pandoc2redmine.sh README.md output.Redmine.textile
#

in=$1
out=$2
pandoc -s -S $in -t textile -o $out
sed -i 's/bc\(\.\|(.*)\.\)/    /g' $out
sed -ri 's/\"([a-zA-Z0-9 _-]+)\":(\#[a-zA-Z0-9_-]+)/[[this_page\2|\1]]/g' $out

