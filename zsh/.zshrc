# If you come from bash you might have to change your $PATH.  export
# PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/kev/.oh-my-zsh

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

# bc https://github.com/junegunn/fzf/issues/846
# if load boath bashrc and zsh, will have weird behavior
# [ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# makes sure paths are unique
typeset -U path
export PATH="$PATH:/home/kev/.gem/ruby/2.5.0/bin"
export PATH="$PATH:/home/kev/local/bin"

# for node
export NODE_PATH="$NODE_PATH:/home/kev/node-latest-install/out/lib/node_modules"

# to allow tapping on touchpad as a click``
synclient TapButton1=1 TapButton2=3 TapButton3=2

# alias cdl = 'cd -args && ls'
alias intellij="/home/kev/Downloads/idea-ic-171.4249.39/bin/idea.sh"
alias matlab="/usr/local/matlab/r2017a/bin/matlab"
alias code="/usr/share/code/code"
alias apython="/home/kev/anaconda3/bin/python"
alias jupyter="/home/kev/anaconda3/bin/jupyter"
alias subl="/home/kev/Desktop/programs/sublime_text_3/sublime_text"
alias sqlite="/home/kev/Desktop/cs/bu_notes/cs105/sqlite-tools-linux-x86-3200100/sqlite3"
alias pycharm="/home/kev/Desktop/codes/pycharm-community-2017.1/bin/pycharm.sh"
alias astudio="/home/kev/programs/android-studio/bin/studio.sh" 
# alias bandit="ssh bandit"
# alias b="ssh bandit"
alias vbox="virtualbox"
alias ue4="/home/kev/Desktop/cs/UnrealEngine/Engine/Binaries/Linux/UE4Editor"
alias unitee="/home/kev/Unity-2018.1.0b8/Editor/Unity"

export hw="/home/kev/Desktop/cs/bu_notes"
export jp="/home/kev/Desktop/language/japanese/lj111"
export cs="/home/kev/Desktop/cs/cybersec"
# ftplugin aka file type plugin 
export fp="/home/kev/.dotfiles/.vim/after/ftplugin/"
export dl="/home/kev/Downloads"

alias hw="cd /home/kev/Desktop/cs/bu_notes"
alias jp="cd /home/kev/Desktop/language/japanese/lj111"
alias cs="cd /home/kev/Desktop/cs/cybersec"
alias fp="/home/kev/.dotfiles/.vim/after/ftplugin/"
alias dl="/home/kev/Downloads"

alias libro="libreoffice"
alias hls="history | tail -20"

alias "c=xclip -selection clipboard"
# in order to not override files unintentionally 
alias "cp=cp -i"
alias "v=vim"
alias "nv=nvim"
alias dirs="dirs | sed 's/ /\n/g' | awk 'BEGIN{print \"-----\"}; {print NR-1 \": \" \$0}' | xargs -I{} echo \$fg[red]{}\$fg[default]"
# alias d="dirs -v | head -10"
alias d="dirs | head -10"

function cd { builtin cd "$@" && ls -a; }
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
alias "zrc=vim ~/.dotfiles/zsh/.zshrc && source ~/.dotfiles/zsh/.zshrc"
alias "i3c=vim ~/.dotfiles/i3/config"
alias "soi3c=source ~/.dotfiles/i3/config"
alias "sozrc=source ~/.dotfiles/zsh/.zshr"
alias "vrc=vim ~/.dotfiles/.vim/.vimrc"
alias "mux=tmuxinator"
alias "tmks=tmux kill-server"
alias "tmsf=tmux source-file ~/.tmux.conf"
alias "dotf=cd ~/.dotfiles"
# UBUNTU
# alias "chrb=chromium-browser"
alias "chr=chromium"
alias "which-command=which"
alias "killibus=kill $(ps -efl | grep 'drx' | awk '{print $4}' | head -1)"
# git log rushi
alias glr='git log --graph --abbrev-commit --decorate --format=format:'\''%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'\'' --all'
alias gdtr='git diff-tree --no-commit-id --name-only -r'
alias gdt='git diff-tool'

# to see changed files
alias "glon=git log --oneline --decorate --name-status"
alias "grm=git rm" 
alias "tcpcopy=/usr/local/tcpcopy/sbin/tcpcopy"
alias "oc=/home/kev/Desktop/cs/bu_notes/cloud_computing/oc/openshift-origin-server-v3.9.0-191fece-linux-64bit/oc"

# Compress then Encrypt
alias "encr=/home/kev/.dotfiles/zsh/encrypt.sh"
# Decrypt then Decompress
alias "decr=/home/kev/.dotfiles/zsh/decrypt.sh"
alias "rclmnt=sudo fusermount -uz ~/mnt/gdrive; sudo rclone mount --allow-other --allow-non-empty wn_enc: ~/mnt/gdrive"

alias "p=ps aux | rg -i"
alias "a={ alias & cat ~/.zshrc | rg function; } | rg -i"
alias "t=tmux list-keys | rg -i"
alias "b=bindkey | rg -i"

alias "cx=chmod +x"
alias "scx=sudo chmod +x"

# Expand aliases
expand-aliases() {
  unset 'functions[_expand-aliases]'
  functions[_expand-aliases]=$BUFFER
  (($+functions[_expand-aliases])) &&
    BUFFER=${functions[_expand-aliases]#$'\t'} &&
    CURSOR=$#BUFFER
}

zle -N expand-aliases
bindkey "a" expand-aliases

alias "pk=pkill"
alias "spk=sudo pkill"

# ARCH LINUX
alias "pS=sudo pacman -S --noconfirm"
alias "pSy=sudo pacman -Sy --noconfirm"
alias "pSs=pacman -Ss" # search
alias "pQe=pacman -Qe" # lists all explicitly installed packages
alias "pQent=pacman -Qent" # lists all explicitly installed native packages to sync that are not direct or optional dependencies
alias "pQm=pacman -Qm" # lists all foreign packages
alias "pSyyy=sudo pacman -Syyy" # makes pacman aware of changes made to /etc/pacman.d/mirrorlist

# rsync -cr <Source> <Destination>
    # Example: rsync -cr Desktop ~/mnt/gdrive
    # -c syncs if checksums differ
    # -P is progress, shows progress bar while copying files

export ANDROID_HOME="/home/kev/programs/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ANDROID_NDK="/home/kev/programs/android-ndk-r10e"
export WORKON_HOME="/home/kev/Desktop/projects/.virtualenvs"
export PROJECT_HOME="/home/kev/Desktop/projects"

export HIL_ENDPOINT="http://127.0.0.1:5000"

source "/etc/bash_completion.d/virtualenvwrapper"

function h { history | grep -i "$@"; }
function fpush { git add . && git commit -m "$@" && git push origin pa3; }
function tm { mv "$@" "/home/kev/Desktop/trash/"; }
function emulator { cd "/home/kev/programs/sdk/emulator" && ./emulator @Nexus_5X_API_27 && cd - }
function lastdir { [ -s ~/.lastdirectory ] && cat ~/.lastdirectory | cd; }
function chrome { /opt/google/chrome/chrome --headless --disable-gpu "$@"; }
# function google-chrome { "$@" | if [ "$@" -eq 0]; then nohup /opt/google/chrome/chrome & else nohup /opt/google/chrome/chrome $(pwd)'/'"$@" & fi }
function so { source "$@"; }
function ssstonm { sudo systemctl stop network-manager; }
function ssstanm { sudo systemctl start network-manager; }
function note { touch $(date | sed 's/ /-/g' | sed 's/:/-/g' | tr '[:upper:]' '[:lower:]').txt; }
function txt2pdf { enscript -p $(echo "$1" | awk -F '\.' '{print $1}').ps "$1" && ps2pdf $(echo "$1" | awk -F '\.' '{print $1}').ps $(echo "$1" | awk -F '\.' '{print $1}').pdf && rm $(echo "$1" | awk -F '\.' '{print $1}').ps; }
# function t { tcpdump -r /home/kev/Desktop/cs/bu_notes/ec521/hw/traffic.dump "$@" }
function grin { grep -irn "$1" "$2"; }
function grinE { grep -irnE "$1" "$2"; }
function gcsmp { git commit -s -m "$1" && git push origin $(git_current_branch); }
function rmspaces { mv $1 $(echo $1 | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]'); }
function rmsp { ls -A | while read -r line; do
    mv $line $(echo $line | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]'); 
done;
} 
function mkdir { command mkdir $@ && cd $@; }

function evince { command evince $1 &; }

# TMuxinator session fn's
function mshw { tmuxinator start hw; }
function mslecture { tmuxinator start bu_lecture; }
function man { vim <(command man $1); }
# function man { man $@ | vim -; }

# function quteb {
#     workon py3 && qutebrowser && deactivate;
# }

# rename file extension (rename file extension)
# rnext <files to change> <current file extension> <new file extension>
function rnfx { for file in $1; do mv "$file" "$(basename "$file" .$2).$3"; done; }

# https://github.com/tmux-plugins/tmux-yank/issues/48
# function _copy-to-clipboard {
#     print -rn -- $BUFFER | pbcopy
#     [ -n "$TMUX" ] && tmux display-message 'Line copied to clipboard!'
# }
# zle -N _copy-to-clipboard
# bindkey -M viins "\`y" _copy-to-clipboard

# mass tar subdirs in current dir
# https://stackoverflow.com/questions/15936003/for-each-dir-create-a-tar-file
function tard { find . -maxdepth 1 -mindepth 1 -type d -exec tar cvf {}.tar {}  \; }

function lsr { ls -a $(find -maxdepth 1 -mindepth 1 -type d) } 

export EDITOR=vim
#export VISUAL=vim
#export PATH="/home/kev/node/node-v8.9.0-linux-x64/bin:$PATH"
#export TERM="xterm-256color"

# export PYTHONPATH="${PYTHONPATH}:$hw/cloud_computing/hil_project/Auditing-for-HW-as-a-Service-cloud/audit_rest/audit_rest/"

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

export TMUXINATOR_CONFIG="/home/kev/.dotfiles/tmuxinator"
# export XDG_CONFIG_HOME="/home/kev/.dotfiles"

#Set JAVA_HOME
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME

source /home/kev/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# for zsh autosuggestions and zsh history substring search

source $HOME/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# # Setup zsh-autosuggestions
# source $HOME/.zsh-autosuggestions/autosuggestions.zsh

# # Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }
# zle -N zle-line-init

# increase max size of .zsh_history
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# TODO: Make a terminal mark
# to start tmux immediately after starting zsh
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && (tmux ls | rg 'windows'; [[ $? -eq 1 ]] && tmuxinator s startmux) > /dev/null || (tmux ls | rg 'attached'; [[ $? -eq 1 ]] && tmux a) > /dev/null
fi

cd /home/kev/Desktop/cs/bu_notes; clear

export NODE_PATH=/usr/local/lib/node_modules:/home/kev/.npm:/usr/lib/nodejs

export NVM_DIR="/home/kev/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# to use vim as the man page viewer (useful when you are using shift+k in vim)
# https://www.reddit.com/r/vim/comments/74sgzs/til_vim_has_a_manpage_viewer_plugin/
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
# export MANPAGER="/usr/bin/env bash -c \"col -b | \
        # vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# UBUNTU
# function acs { apt-cache search "$@"; }
# function sai { sudo apt install "$@" -y; }
# function sagrp { sudo apt-get remove --purge "$@" -y; }
# function dpkgl { dpkg -l | grep "$@"; }
# alias "saug=sudo apt upgrade -y"
# alias "saud=sudo apt update -y"
# alias "sadug=sudo apt update -y && sudo apt dist-upgrade -y"
# alias "saa=sudo apt autoremove -y"

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# ONI_NEOVIM_PATH=/opt/Oni/resources/app/nvim.appimage
# export ONI_NEOVIM_PATH
