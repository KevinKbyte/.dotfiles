# If you come from bash you might have to change your $PATH.  export
# PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/kevin/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="zui"
ZSH_THEME="kev"
export VIRTUAL_ENV_DISABLE_PROMPT=1
# export VIRTUAL_ENV_DISABLE_PROMPT=0


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias cdl = 'cd -args && ls'
alias intellij="/home/kevin/Downloads/idea-ic-171.4249.39/bin/idea.sh"
alias matlab="/usr/local/matlab/r2017a/bin/matlab"
alias code="/usr/share/code/code"
alias apython="/home/kevin/anaconda3/bin/python"
alias jupyter="/home/kevin/anaconda3/bin/jupyter"
alias subl="/home/kevin/Desktop/programs/sublime_text_3/sublime_text"
alias sqlite="/home/kevin/Desktop/cs/bu_notes/cs105/sqlite-tools-linux-x86-3200100/sqlite3"
alias pycharm="/home/kevin/Desktop/codes/pycharm-community-2017.1/bin/pycharm.sh"
alias astudio="/home/kevin/programs/android-studio/bin/studio.sh" 
# alias bandit="ssh bandit"
alias b="ssh bandit"
alias vbox="virtualbox"

export hw="/home/kevin/Desktop/cs/bu_notes"
export jp="/home/kevin/Desktop/language/japanese/lj111"

alias hw="cd /home/kevin/Desktop/cs/bu_notes"
alias jp="cd /home/kevin/Desktop/language/japanese/lj111"
alias libro="libreoffice"

alias "c=xclip -selection clipboard"
# in order to not override files unintentionally 
alias "cp=cp -i"
alias "v=vim"
alias dirs="dirs | sed 's/ /\n/g' | awk 'BEGIN{print \"-----\"}; {print NR-1 \": \" \$0}' | xargs -I{} echo \$fg[red]{}\$fg[default]"
function cd { builtin cd "$@" && ls -a && pwd && dirs; }
alias "1=cd -1"
alias "2=cd -2"
alias "3=cd -3"
alias "4=cd -4"
alias "5=cd -5"
alias "6=cd -6"
alias "7=cd -7"
alias "8=cd -8"
alias "9=cd -9"
alias "vi=vim"
alias "loc=locate"

# TMUX="~/.dotfiles/.tmux/.tmux.conf"
# VIMRC="~/.dotfiles/.vim/.vimrc"
# ZSHRC="~/.dotfiles/zsh/.zshrc"
# I3="~/.dotfiles/i3/config"
alias "trc=vim ~/.dotfiles/.tmux/.tmux.conf"
alias "saa=sudo apt autoremove"
alias "zrc=vim ~/.dotfiles/zsh/.zshrc && source ~/.dotfiles/zsh/.zshrc"
alias "i3c=vim ~/.dotfiles/i3/config"
alias "soi3c=source ~/.dotfiles/i3/config"
alias "sozrc=source ~/.dotfiles/zsh/.zshr"
alias "vrc=vim ~/.dotfiles/.vim/.vimrc"
alias "mux=tmuxinator"
alias "tmks=tmux kill-server"
alias "tmsf=tmux source-file ~/.tmux.conf"

export ANDROID_HOME="/home/kevin/programs/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ANDROID_NDK="/home/kevin/programs/android-ndk-r10e"

export WORKON_HOME="/home/kevin/Desktop/projects/.virtualenvs"
export PROJECT_HOME="/home/kevin/Desktop/projects"

source "/etc/bash_completion.d/virtualenvwrapper"

function h { history | grep -i "$@"; }
function fpush { git add . && git commit -m "$@" && git push origin pa3; }
function tm { mv "$@" "/home/kevin/Desktop/trash/"; }
function emulator { cd "/home/kevin/programs/sdk/emulator" && ./emulator @Nexus_5X_API_27 && cd - }
function lastdir { [ -s ~/.lastdirectory ] && cat ~/.lastdirectory | cd; }
function chrome { /opt/google/chrome/chrome --headless --disable-gpu "$@"; }
# function google-chrome { "$@" | if [ "$@" -eq 0]; then nohup /opt/google/chrome/chrome & else nohup /opt/google/chrome/chrome $(pwd)'/'"$@" & fi }
function sai { sudo apt install "$@" -y; }
function so { source "$@"; }
function acs { apt-cache search "$@"; }
function ssstonm { sudo systemctl stop network-manager; }
function ssstanm { sudo systemctl start network-manager; }
function dpkgl { dpkg -l | grep "$@"; }
function note { touch $(date | sed 's/ /-/g' | sed 's/:/-/g' | tr '[:upper:]' '[:lower:]').txt; }
function txt2pdf { enscript -p $(echo "$1" | awk -F '\.' '{print $1}').ps "$1" && ps2pdf $(echo "$1" | awk -F '\.' '{print $1}').ps $(echo "$1" | awk -F '\.' '{print $1}').pdf && rm $(echo "$1" | awk -F '\.' '{print $1}').ps; }
function t { tcpdump -r /home/kevin/Desktop/cs/bu_notes/ec521/hw/traffic.dump "$@" }
function grin { grep -irn "$1" "$2"; }
function grinE { grep -irnE "$1" "$2"; }

export EDITOR=vim
#export VISUAL=vim
#export PATH="/home/kevin/node/node-v8.9.0-linux-x64/bin:$PATH"
#export TERM="xterm-256color"
export PYTHONPATH="/usr/local/lib/python3.5/dist-packages"

# zsh vi mode

export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode  # @todo - THIS DOES NOT WORK?
bindkey -M viins '^k' kill-line
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# show which vim mode we are in
precmd() {
  RPROMPT=""
}
zle-keymap-select() {
    RPROMPT=""
    [[ $KEYMAP = vicmd ]] && RPROMPT="(COMMAND MODE)"
    () { return $__prompt_status }
    zle reset-prompt
}
zle-line-init() {
    typeset -g __prompt_status="$?"
}
zle -N zle-keymap-select
zle -N zle-line-init

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for tmuxinator
source ~/.dotfiles/zsh/tmuxinator.zsh

export TMUXINATOR_CONFIG="/home/kevin/.dotfiles/tmuxinator"
# export XDG_CONFIG_HOME="/home/kevin/.dotfiles"

#Set JAVA_HOME
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME

