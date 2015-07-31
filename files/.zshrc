# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/matthewb/.zshrc'

autoload -Uz compinit
compinit


export PATH=$HOME/bin:/usr/local/bin:$PATH

export EDITOR=/usr/bin/vim
# source $ZSH/oh-my-zsh.sh
source ~/antigen.zsh

if [ -f "${HOME}/.bash_functions" ]; then
	source ~/.bash_aliases
	source "${HOME}/.bash_functions"
fi


# if [ -f "${HOME}/.java_envrc" ]; then
	source "${HOME}/.java7_envrc"
# fi
#
# source ~/.svcps1rc
#

PROMPT='%{$fg[blue]%}{ %c } \
%{$fg[green]%}$(git_prompt_info)$(hg_prompt_info)%{$reset_color%} \
%{$fg[red]%}%(!.#.»)%{$reset_color%} '
