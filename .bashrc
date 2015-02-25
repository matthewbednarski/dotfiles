
[[ "$-" != *i* ]] && return

MAIL=/var/spool/mail/matthew && export MAIL

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#

# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

for file in /etc/bash_completion.d/* ; do
	source "$file"
done

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
	source "${HOME}/.bash_aliases"
fi
# Functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Functions
#
# Some people use a different file for functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi

if [[ $PATH != ?(*:)$HOME/bin?(:*) ]]; then
	#echo Exporting PATH
	export PATH=~/bin:$PATH 
fi
if [[ $PATH != ?(*:)$HOME/.gem/ruby/*/bin?(:*) ]]; then
	# echo Exporting Ruby
	export PATH=~/.gem/ruby/2.2.0/bin:$PATH 
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "${HOME}/solinfo-dev/bin" ] ; then
	PATH="${HOME}/solinfo-dev/bin:${PATH}"
fi
if [ -f "${HOME}/.java7_envrc" ] ; then
	source "${HOME}/.java7_envrc"
fi
# DEFAULT="[37;40m"
# PINK="[35;40m"
# GREEN="[32;40m"
# ORANGE="[33;40m"
#
# hg_dirty() {
# 	is_dirty=$(hg status 2> /dev/null )
# 	if [[ $is_dirty != "" ]]; then
# 		echo "*"
# 	fi
# }
#
# hg_branch() {
# 	hg branch 2> /dev/null | awk '{ printf "["$1"]" }' 
# 	hg bookmarks 2> /dev/null | awk '/\*/ { printf "[@" $2 "]" }'
# 	hg_dirty
# }
# parse_git_dirty() {
# 	[[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
# }
# parse_git_branch() {
# 	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
# }
# export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$(hg_branch)$ ' 

source ~/.svcps1rc
export SUDO_EDITOR=/usr/bin/vim
