# If you come from bash you might have to change your $PATH.  export
# PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export ALIASES=$HOME/.dotfiles/zsh/aliases.zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="zui"
# ZSH_THEME="kev"
export VIRTUAL_ENV_DISABLE_PROMPT=1

# so that commands prepended with spaces are not recorded in .zsh_history
export HISTCONTROL=ignoreboth
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
plugins=(
git
git-extras
)

source $ZSH/oh-my-zsh.sh
# source ~/.dotfiles/zsh/kev.zsh-theme
source ~/.dotfiles/zsh/kev-easy-cmd-yank.zsh-theme

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
if command -v nvim>/dev/null; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# export zrc="$HOME/.zshrc"
# export i3c="$HOME/.config/i3/config"
# export vrc="$HOME/.vimrc"
# export trc="$HOME/.dotfiles/.tmux/.tmux.conf"
export zrc="$HOME/.zshrc"
export i3c="$HOME/.config/i3/config"
export vrc="$HOME/.vimrc"
export trc="$HOME/.dotfiles/.tmux/.tmux.conf"
export scr="$HOME/.dotfiles/i3/scripts/"

alias "trc=$EDITOR ~/.dotfiles/.tmux/.tmux.conf"
alias "zrc=$EDITOR ~/.dotfiles/zsh/.zshrc && source ~/.dotfiles/zsh/.zshrc"
alias "i3c=$EDITOR ~/.dotfiles/i3/config"
alias "szrc=source ~/.dotfiles/zsh/.zshrc"
alias "arc=$EDITOR $ALIASES && source $ALIASES"

export hw="$HOME/Desktop/bu_notes/cs"
export jp="$HOME/Desktop/bu_notes/lj112"
export cs="$HOME/Desktop/bu_notes/cs/ec521"
export tf="$HOME/test_files"
# ftplugin aka file type plugin 
export fp="$HOME/.dotfiles/.vim/after/ftplugin/"
export dl="$HOME/Downloads"
export dot="$HOME/.dotfiles"

alias hw="cd $hw"
alias jp="cd $jp"
alias cs="cd $cs"
alias fp="cd $fp"
alias dl="cd $dl"
alias tf="cd $tf"

function cd { builtin cd "$@" && ls -a; }

function gundo() {
    git push -f origin $1:"$(git_current_branch)"
    git reset --soft $1
}

function cabrm() {
    # cabal unregister package
    # does not fully remove pkg
    # if in sandbox: cabal sandbox hc-pkg -- unregister attoparsec --force
    ghc-pkg unregister --force $1
    rm ~/.cabal/lib/x86_64-linux-ghc-8.6.3/$1-[0-9]* -r
}

function cabh() {
    cabal $1 --help
}

# rsync -cr <Source> <Destination>
    # Example: rsync -cr Desktop ~/mnt/gdrive
    # -c syncs if checksums differ
    # -P is progress, shows progress bar while copying files

export MPD_HOST=$HOME/.config/mpd/socket

export ANDROID_HOME="$HOME/programs/sdk"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export ANDROID_NDK="$HOME/programs/android-ndk-r10e"
export PROJECT_HOME="$HOME/Desktop/projects"

# export workon home first for virtualenvwrapper
export WORKON_HOME="$HOME/Desktop/projects/.virtualenvs"
source $ZSH/plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh

export HIL_ENDPOINT="http://127.0.0.1:5000"

# source "/etc/bash_completion.d/virtualenvwrapper"

function wh { while true ; do "$@" && sleep 2; done; }
function h { history | grep -i "$@"; }
function fpush { git add . && git commit -m "$@" && git push origin pa3; }
function tm { mv "$@" "$HOME/Desktop/trash/"; }
function emulator { cd "$HOME/programs/sdk/emulator" && ./emulator @Nexus_5X_API_Q && cd - }
function lastdir { [ -s ~/.lastdirectory ] && cat ~/.lastdirectory | cd; }
function chrome { /opt/google/chrome/chrome --headless --disable-gpu "$@"; }
# function google-chrome { "$@" | if [ "$@" -eq 0]; then nohup /opt/google/chrome/chrome & else nohup /opt/google/chrome/chrome $(pwd)'/'"$@" & fi }
function sai { sudo apt install "$@" -y && echo "$@" >> ~/.dotfiles/zsh/ubuntu-programs.txt; }
function sagrp { sudo apt-get remove --purge "$@" -y; }
function so { source "$@"; }
function acs { apt-cache search "$@"; }
function ssstonm { sudo systemctl stop network-manager; }
function ssstanm { sudo systemctl start network-manager; }
function dpkgl { dpkg -l | grep "$@"; }
function note { touch $(date | sed 's/ /-/g' | sed 's/:/-/g' | tr '[:upper:]' '[:lower:]').txt; }
function txt2pdf { enscript -p $(echo "$1" | awk -F '\.' '{print $1}').ps "$1" && ps2pdf $(echo "$1" | awk -F '\.' '{print $1}').ps $(echo "$1" | awk -F '\.' '{print $1}').pdf && rm $(echo "$1" | awk -F '\.' '{print $1}').ps; }
# function t { tcpdump -r $HOME/Desktop/cs/bu_notes/ec521/hw/traffic.dump "$@" }
function grin { grep -irn "$1" "$2"; }
function grinE { grep -irnE "$1" "$2"; }
function gcsmp { git commit -s -m "$1" && git push origin $(git_current_branch); }
function rmspaces { for file in "$@"; do mv $file $(echo $file | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]'); done; }
function rmsp { ls -A | while read -r line; do
    mv $line $(echo $line | sed 's/\ /-/g' | tr '[:upper:]' '[:lower:]'); 
done;
} 
# function mkdir { command mkdir $@ && cd $@; }
function mkd { command mkdir $@ && cd $@; }

function evince { command evince $1 &; }

# TMuxinator session fn's
function mshw { tmuxinator start hw; }
function mslecture { tmuxinator start bu_lecture; }
function man { $EDITOR <(command man $@); }
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

function bak { cp $1 .$(echo $1 | awk -F "." '{print $1}')_bak.$(echo $1 | awk -F "." '{print $2}') }

function mkt { #mktouch
    # https://stackoverflow.com/questions/9452935/unix-create-path-of-folders-and-file
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for f in "$@"; do
        mkdir -p -- "$(dirname -- "$f")"
        touch -- "$f"
    done
}

# hex2decimal
# https://stackoverflow.com/questions/13280131/hexadecimal-to-decimal-in-shell-script
# https://unix.stackexchange.com/questions/51983/how-to-uppercase-the-command-line-argument
function h2d {
    if [ $# -lt 1 ]; then
        echo "Missing argument";
        return 1;
    fi

    for hex in "$@"; do
        hex=$(echo $hex | awk '{print toupper($0)}')
        echo "ibase=16; $hex" | bc
    done
}

# https://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
# function countdown(){
function timer(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   # mplayer ~/Music/*
}

# timer with music
function timerm(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   mplayer ~/Music/*
}

# Vocab timer
# https://stackoverflow.com/questions/12628327/how-to-show-and-update-echo-on-same-line
function voc(){
    for (( i = 0; i < $1; i++ )); do
        echo "$i"
        timer $2
        echo
    done
}

# Alarm
# https://www.reddit.com/r/linux/comments/9co9x2/simple_shell_script_alarm_clock/
function larm() {
    if [ $# -lt 1 ]; then
        echo "Example use: larm \"10:00\""
        echo "             larm \"10:00:01\""
        echo "Calls default 10 min timer when run without arguments"

        timerm $((10*60))
        exit 0;
    fi

    _alarm_time="$(( $(date -d $1 +%s) - $(date +%s) ))"

    # Continue only if alarm set later than current time
    if [[ $_alarm_time > 0 ]]; then
        sleep $_alarm_time

        unset _alarm_time

        mplayer ~/Music/*
    else
        unset _alarm_time
        return 1;
    fi
}

fcp() {
    # full filename copy
    readlink -f "$@" | xclip -selection clipboard
} 

function chext(){
    for f in *.$1; do 
        mv -- "$f" "${f%.$1}.$2"
    done
}

function grp(){
    grep -irn "$@" .
}

function pgrp(){
    pdfgrep -irn "$@" .
}

function pkal() {
    for i in $(p xautolock | awk '{print $2}' | tail -n +2); do 
        kill $i
    done
}

# Internet Toggle
function it() {
    # https://stackoverflow.com/questions/929368/how-to-test-an-internet-connection-with-bash
    wget -q --spider https://google.com

    if [ $? -eq 0 ]; then
        # echo "Online"
        nmcli c down "$1"
    else
        # echo "Offline"
        nmcli c up "$1"
    fi
}

# bt toggle
function bt() {
    _device_id=$(cat ~/test_files/device_id.txt)
    echo "info EB:06:EF:1A:91:90" | bluetoothctl | grep -i "Connected: yes" > /dev/null

    if [ $? -eq 0 ]; then
        # echo "Connected"
        # echo -e "connect <device_id>" | bluetoothctl
        echo -e "disconnect "$_device_id | bluetoothctl
    else
        # echo "Disconnected"
        echo -e "connect "$_device_id | bluetoothctl
    fi

    unset _device_id
} 

# Finds an input 
function f() {
    if [ "$#" -le 1 ]; then
        echo "find . -iname "$@
        find . -iname "$@"
    else
        _f_inp="\"$1\""
        shift
        for filename in "$@"; do
            _f_inp+=" -o -iname \""$filename"\""
        done
            
        f_cmd="find . -type f -iname "$_f_inp
        _f_files=$(eval $f_cmd)

        _f_files="${_f_files//[~]/\\~}"
        _f_files="${_f_files//[ ]/\\ }"
        echo "$_f_files"

        unset _f_files
        unset _f_cmd
        unset _f_inp
    fi
}

function mp4t3() {
    ffmpeg -i "$1" -f mp3 -ab 192000 -vn "$2".mp3
}

function mpl() {
    mplayer "$@" -loop 0
}

function pdfx() {
    # https://askubuntu.com/questions/221962/how-can-i-extract-a-page-range-a-part-of-a-pdf
    # example: pdfx myfile.pdf 1 2
    gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -dSAFER \
       -dFirstPage=${2} \
       -dLastPage=${3} \
       -sOutputFile=${1%.pdf}_p${2}-p${3}.pdf \
       ${1}
}

function mv() {
    if [[ $# -eq 1 ]]; then
        command mv $@ .
    else
        echo $#
        command mv $@
    fi
}

function m { mv "$@" .; }

function a() { # adds alias for you to aliases.zsh
    # check if alias already has been binded to a command/alias/function
    check=$(which $1)
    if [[ $? -eq 0 ]]; then
        echo $check
    else
        # if unbounded alias, then bind it and send it to aliases.zsh
        alias $1=$2
        echo "alias \"$1=$2\"" >> $ALIASES
    fi
}

# Unalias d which is aliased as dirs in oh-my-zsh. We want to use d for our function below
source ~/.dotfiles/zsh/scripts/MRUd.sh

#export VISUAL=vim
#export PATH="$HOME/node/node-v8.9.0-linux-x64/bin:$PATH"
#export TERM="xterm-256color"

# export PYTHONPATH="${PYTHONPATH}:$hw/cloud_computing/hil_project/Auditing-for-HW-as-a-Service-cloud/audit_rest/audit_rest/"

# zsh vi mode
set -o vi

export KEYTIMEOUT=10
bindkey -M viins 'kj' vi-cmd-mode  
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey '^X' edit-command-line
bindkey '\ev' edit-command-line

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

source ~/.dotfiles/zsh/key-bindings.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# for tmuxinator
source ~/.dotfiles/zsh/tmuxinator.zsh

export TMUXINATOR_CONFIG="$HOME/.dotfiles/tmuxinator"
# export XDG_CONFIG_HOME="$HOME/.dotfiles"

#Set JAVA_HOME
JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export JAVA_HOME
ZSH_PLUGIN_FOLDER="$HOME/.github"

# for zsh autosuggestions and zsh history substring search

source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.plugin.zsh
source $ZSH_PLUGIN_FOLDER/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZSH_PLUGIN_FOLDER/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=256'

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '$terminfo[kcuu1]' history-substring-search-up
bindkey '$terminfo[kcud1]' history-substring-search-down

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
# if command -v tmux>/dev/null; then
#     [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && (tmux ls | grep 'windows'; [[ $? -eq 1 ]] && tmuxinator s startmux) > /dev/null || (tmux ls | rg 'attached'; [[ $? -eq 1 ]] && tmux a) > /dev/null
# fi
if command -v tmux>/dev/null; then
    [ -z $TMUX ] && (tmux ls | grep 'attached' ; [[ $? -ne 0 ]] && tmux) > /dev/null 
    [ $TMUX ] && (tmuxinator s startmux) > /dev/null 
fi

# cd $HOME/Desktop/bu_notes/cs
clear

export NODE_PATH=/usr/local/lib/node_modules:$HOME/.npm:/usr/lib/nodejs
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# to use vim as the man page viewer (useful when you are using shift+k in vim)
# https://www.reddit.com/r/vim/comments/74sgzs/til_vim_has_a_manpage_viewer_plugin/
export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"
# export MANPAGER="/usr/bin/env bash -c \"col -b | \
        # vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

# ONI_NEOVIM_PATH=/opt/Oni/resources/app/nvim.appimage
# export ONI_NEOVIM_PATH

# To get the bashmarks working
# https://alysivji.github.io/category/quick-hits.html

unalias g && source ~/.dotfiles/zsh/scripts/bashmarks/bashmarks.sh
source $ALIASES

# change directory colors
source ~/.dotfiles/setup_scripts/ls_colors.sh

# https://unix.stackexchange.com/questions/498482/bash-tab-completion-colors-differ-from-ls-colors
# set colored-stats on

### Added by Zplugin's installer
# source '/home/kev/.zplugin/bin/zplugin.zsh'
# autoload -Uz _zplugin
# (( ${+_comps} )) && _comps[zplugin]=_zplugin
# ### End of Zplugin's installer chunk

# zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
# zplugin load trapd00r/LS_COLORS
