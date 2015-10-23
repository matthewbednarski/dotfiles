#!/bin/bash

SWITCH="\e["
NORMAL="${SWITCH}0m"
YELLOW="${SWITCH}33m"
RED="${SWITCH}31m"
GREEN="${SWITCH}32m"
BLUE="${SWITCH}34m"

dir=$(dirname "${BASH_SOURCE[0]}")

MY_PROMPT='$ '
while :
do
  echo -n "$MY_PROMPT"
  read line
  eval "$line"
  done

exit 0
