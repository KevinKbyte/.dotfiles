alias blender=/home/kev/Downloads/blender-2.81a-linux-glibc217-x86_64/blender 
alias open=xdg-open
alias libro="libreoffice"
alias hls="history | tail -20"

alias "c=xclip -selection clipboard"
alias "pc=pwd|xclip -selection clipboard"
# in order to not override files unintentionally 
alias "cp=cp -i"
# alias "v=vim"
if [ -z $NVIM_LISTEN_ADDRESS ]; then
    alias "v=$EDITOR"
else
    alias "v=nvr -l"
fi
alias "nv=nvim"
alias dirs="dirs | sed 's/ /\n/g' | awk 'BEGIN{print \"-----\"}; {print NR-1 \": \" \$0}' | xargs -I{} echo \$fg[red]{}\$fg[default]"
alias dr="dirs | head -10"

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
alias "saug=sudo apt upgrade -y"
alias "saud=sudo apt update -y"
alias "sadug=sudo apt update -y && sudo apt dist-upgrade -y"

# TMUX="~/.dotfiles/.tmux/.tmux.conf"
# VIMRC="~/.dotfiles/.vim/.vimrc"
# ZSHRC="~/.dotfiles/zsh/.zshrc"
# I3="~/.dotfiles/i3/config"
alias "saa=sudo apt autoremove -y"
alias "zrc=$EDITOR ~/.dotfiles/zsh/.zshrc && source ~/.dotfiles/zsh/.zshrc"
alias "i3c=$EDITOR ~/.dotfiles/i3/config"
alias "soi3c=source ~/.dotfiles/i3/config"
alias "szrc=source ~/.dotfiles/zsh/.zshrc"
alias "vrc=$EDITOR ~/.dotfiles/.vim/.vimrc"
alias "mux=tmuxinator"
alias "tmks=tmux kill-server"
alias "tmsf=tmux source-file ~/.tmux.conf"
alias "chb=chromium-browser"
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
alias "oc=$HOME/Desktop/cs/bu_notes/cloud_computing/oc/openshift-origin-server-v3.9.0-191fece-linux-64bit/oc"

# Compress then Encrypt
alias "encr=$HOME/.dotfiles/zsh/encrypt.sh"
# Decrypt then Decompress
alias "decr=$HOME/.dotfiles/zsh/decrypt.sh"
alias "rclmnte=sudo fusermount -uz ~/mnt/gdrive; sudo rclone mount --allow-other --allow-non-empty wn_enc: ~/mnt/gdrive"
alias "rclmnt=sudo fusermount -uz ~/mnt/gdrive; sudo rclone mount --allow-other --allow-non-empty wn: ~/mnt/gdrive"

alias "slack-term" -config ~/snap/slack-term/current/slack-term.json

alias "p=ps aux | rg -i"
alias "ax={ alias & cat ~/.zshrc | rg function; } | rg -i"
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

# Japanese Daemon (Keyboard)
# alias "jpdt=sudo pkill ibus-daemon && xmodmap -e \"keycode 105 = Control_R NoSymbol Control_R\""
# alias "jpd=ibus-daemon -drx && xmodmap -e \"keycode 105 = F13 NoSymbol F13\""
alias "jpd=ibus-daemon -drx"
# Terminates Japanese Daemon (Keyboard)
alias "jpdt=sudo pkill ibus-daemon"

alias "k=kill"
alias "sk=sudo kill"
alias "pk=pkill"
alias "spk=sudo pkill"
alias "sctl=sudo systemctl"
alias "chx=chmod +x"
alias "python=python3"
alias "pip=pip3"
alias "sudb=sudo updatedb"
alias "s=sudo"
alias "rgr=ranger"
alias "calc=calcurse"
alias "bd=ssh bandit"
alias "doc2pdf=soffice --headless --convert-to pdf"
alias "zh=$EDITOR ~/.zsh_history"
alias "click=python $HOME/.dotfiles/i3/scripts/clicker_gen_txt_file.py && clear"
alias "pips=pip search"
alias "pipi=pip install"
alias "pipu=pip uninstall"
alias "sw=$HOME/.dotfiles/zsh/scripts/stopwatch.sh"

if hash timew 2>/dev/null ; then
    alias "tw=timew"
    alias "tws=timew start"
    alias "twx=timew stop"
    alias "twxs=timew stop && timew start"
fi

# Git
alias "grsu=git remote -v && git remote set-url"

# Cabal 
alias "cab=cabal"
alias "cabi=cabal new-install"
alias "cabu=cabal new-update"
alias "cabnr=cabal new-repl"
alias "cabt=cabal new-test"
alias "cabs=cabal new-sandbox"
alias "py=python"
alias "npms=npm search"
alias "npmi=npm install"
alias "npmis=npm install --save"
alias "npmst=npm start"
alias "onex=mplayer ~/Documents/one_min_interval_timer.mp3 -loop 0"
alias "grs=git reset --soft"

alias "una=unalias"
alias "fn=find . -iname"

# Emacs
alias "enw=emacs -nw"
