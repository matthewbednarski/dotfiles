#!/bin/bash

now() {
	eval $(date +Y=%Y\;m=%m\;d=%d\;H=%H\;M=%M)
	mod=$(( $M % 15 ))
	M=$(((M/15)*15))
	(($M==0)) && M=00 # the math returns 0, so make it 00  
	if [ "$mod" -gt "7" ]
	then
		M=$(($M + 15 ))
		if [ $M -gt "59" ]
		then
			M=00
			H=$((10#$H + 1))
			# H=$((${H} + 1))
		fi
	fi
	echo $Y'-'$m'-'$d'T'$H:$M
}

gcal-add () {
	title=${1}
	when=${2}
	desc=${3}
	if [[ -z ${3} ]]
	then
		desc=${title}
		# echo "no description given..."
		# echo "using title value \( $title \)"
	fi
	duration=60
	# echo "gcalcli add --title \"$title\" --when \"$when\" --duration $duration --reminder 0"
	echo adding event \"$title\" starting at $when
	gcalcli add --title "$title" --when "$when" --duration "$duration" --reminder 0
}

gcal-add-now () {
	gcal-add "${1}" $(now) ${2}
}
gcal-agenda () {
	gcalcli agenda yesterday tomorrow
}
gcal-agenda-today () {
	gcalcli agenda
}
gcal-agenda-dates () {
	gcalcli agenda "${1}" "${2}"
}
gcal-edit () {
	echo "${@}"
	gcalcli edit "${@}"
}

winpath() {
    if [ ${#} -eq 0 ]; then
        : skip
    elif [ -f "$1" ]; then
        local dirname=$(dirname "$1")
        local basename=$(basename "$1")
        echo "$(cd "$dirname" && pwd -W)/$basename" \
        | sed \
          -e 's|/|\\|g';
    elif [ -d "$1" ]; then
        echo "$(cd "$1" && pwd -W)" \
        | sed \
          -e 's|/|\\|g';
    else
        echo "$1" \
        | sed \
          -e 's|^/\(.\)/|\1:\\|g' \
          -e 's|/|\\|g'
    fi
}

unixpath() {
    echo "$@" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

todo () {
	local d="$(pwd)"
	local f=
	while [[ "$d" != "/" ]];
	do
		f=$(find "$d" -maxdepth 1 -mindepth 1 -follow -name "todo.txt")
		if [ -z "$f" ]; then
			d="$d/.."
		else
			vim "$f"
			break
		fi
	done
}
