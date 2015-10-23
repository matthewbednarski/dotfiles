#!/bin/bash

search_with_version () {
	local srch="$1"
	local vrs="$2"
    output=$(wget -qO- https://api.cdnjs.com/libraries\?search\=$srch\&fields\=version,assets )
    item=$(echo "$output" | jq  --arg name "$srch" --arg vers "$vrs" '.results[] | select( .name == $name ) |   { (.name) : {  version: $vers, files :  .assets[] | select( .version == $vers ) | .files  } }')
    ret=$? 
    echo $item | jq '.'
    return $ret
}
###
# Select all results and put together an object composed of :
#   name       .name
#   version    .version
#   files      .assets[1].files   -> selects files of latest version
###
search_without_version () {
	local srch="$1"
    output=$(wget -qO- https://api.cdnjs.com/libraries\?search\=$srch\&fields\=version,assets )
	item=$(echo "$output" | jq  --arg name "$srch" '.results[] | select( .name == $name) | { name, version, files :  .assets[1].files  }')
    ret=$? 
    echo $item | jq '.'
    return $ret
}
param="$1"
search="${param%+*}"
version="${param#*+}"

unset HAS_VERS
if [[ "$param" != "$search" ]]; then
	HAS_VERS=1
fi
if (( HAS_VERS )); then
	search_with_version "$search" "$version"
	exit $?
else
	search_without_version "$search"
	exit $?
fi


###
# Select all results and put together an object composed of :
#   name       .name
#   version    .version
#   files      .assets[1].files   -> selects files of latest version
#
# works
# echo "$output" | jq '[ .results[] | { name, version, files : [ .assets[1].files ] } ]'
###
# echo "$output" | jq '[ .results[] | { name, version, files : [ .assets[1].files ] } ]'



# works
# echo "$output" | jq  --arg name "$search" '[ .results[] | select( .name == $name) | { name, version, files : [ .assets[1].files ] } ]'

