#!/bin/bash

gcal_add () {
	title=${1}
	desc=${2}
	when=${3}
	duration=60
	gcalcli add --title $title  --when $when --duration $duration --reminder 0
}

gcal_add_now () {
	gcal_add ${1} ${2} now 
}
