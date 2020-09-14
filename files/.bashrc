
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
shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

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

# Aliases
if [ -f "${HOME}/.bash_aliases" ]; then
	source "${HOME}/.bash_aliases"
fi
# Functions
if [ -f "${HOME}/.bash_functions" ]; then
	source "${HOME}/.bash_functions"
fi

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
# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077


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
if [ -f "${HOME}/.java_envrc" ] ; then
	source "${HOME}/.java_envrc"
fi

source ~/.svcps1rc
export SUDO_EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export EDITOR=$VISUAL
