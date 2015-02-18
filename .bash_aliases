
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...

# Default to human readable figures
alias df='df -h'
alias du='du -h'
# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -al'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

alias cmed='cd ~/projects/medication'
alias cmf='cd ~/projects/medication-frontend/'
alias cmfa='cmf && cd app/common/data-services'
alias cmr='cd ~/projects/medication-server-test/'
alias restify='cmr && npm start -- $@'
alias gulp-f='cmf && gulp && gulp watch'

alias gmail='mutt -F ~/.muttrc_gmail'
alias new-alias='vim ~/.bash_aliases'
