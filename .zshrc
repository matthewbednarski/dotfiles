
if [[ "$TERMINAL_EMULATOR" = "JetBrains-JediTerm" ]]; then

elif [[ "$TERM_PROGRAM" = "vscode" ]]; then

elif [[ "$TERM_PROGRAM" = "Lens" ]]; then
    alias kccc='kubectl config current-context'
    CONTEXT=$(kccc)
    tmux attach -t lens-$CONTEXT || tmux new -s lens-$CONTEXT
elif [[ "$TERM_PROGRAM" = "OpenLens" ]]; then
    alias kccc='kubectl config current-context'
    CONTEXT=$(kccc)
    tmux attach -t lens-$CONTEXT || tmux new -s lens-$CONTEXT
elif command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi
# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH:$HOME/bin

# Path to your oh-my-zsh installation.
export ZSH="/home/bednarski/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="candy"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  adb
  git
  gitfast
  docker
  kube-ps1
  kubectl 
  microk8s
  #tmux
  fzf
  tig
  torrent
  jfrog
  dotnet
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/opt/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.krew/bin:$PATH

export DISPLAY=:0
PROMPT='$(kube_ps1)'$PROMPT

openinwindows(){
    local FOLDER="$1"
    if [[ "" == "${FOLDER}" ]]; then FOLDER="$(pwd)" fi
    echo $FOLDER
    xdg-open $(wslpath -w $FOLDER)
}

alias open-in-windows='openinwindows'
[[ -s "/home/bednarski/.bash_aliases" ]] && source "/home/bednarski/.bash_aliases"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/bednarski/.sdkman"
[[ -s "/home/bednarski/.sdkman/bin/sdkman-init.sh" ]] && source "/home/bednarski/.sdkman/bin/sdkman-init.sh"

export HISTIGNORE="pwd:ls:cd:..:less:grep"

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:$HOME/.dotnet"

autoload -Uz compinit
compinit
source /home/bednarski/.jfrog/jfrog_zsh_completion

source <(flux completion zsh)
source <(kubectl dba completion zsh)
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="$HOME/.symfony/bin:$PATH"
export PATH="/opt/android-studio/bin:$PATH"
export CHROME_EXECUTABLE=/usr/bin/brave-browser
export _GOROOT=/opt/golang
export _GOPATH=$HOME/go
export PATH=$_GOROOT/bin:$_GOPATH/bin:$PATH
#export GOPROXY=direct
. <(flux completion zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export ANDROID_STUDIO_HOME="$HOME/Applications/android-studio"
export ANDROID_STUDIO_PATH="$ANDROID_STUDIO_HOME/bin:$ANDROID_STUDIO_HOME/jbr/bin"

export ANDROID_SDK_HOME="$HOME/Android/Sdk"
export ANDROID_SDK_PATH="$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$ANDROID_SDK_HOME/tools/bin"

export PATH="$ANDROID_SDK_PATH:$ANDROID_STUDIO_PATH:$PATH"


# Load Angular CLI autocompletion.
source <(ng completion script)


# Load Angular CLI autocompletion.
source <(ng completion script)

export DOTNET_ROOT=$(pwd)/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

export PATH="$PATH:/home/bednarski/.local/bin"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/bednarski/.lmstudio/bin"

export GOPATH="$HOME/gopath"
export PATH="$PATH:/home/bednarski/go/go1.24.2/bin:$GOPATH/bin"
