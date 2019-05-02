# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins
# http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#Standard-Widgets

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
# if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
#   function zle-line-init() {
#     echoti smkx
#   }
#   function zle-line-finish() {
#     echoti rmkx
#   }
#   zle -N zle-line-init
#   zle -N zle-line-finish
# fi

# bindkey -e                                            # Use emacs key bindings

# bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
# bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
#  is to allow use of thes commands even when in middle of command

# alt+e for file explorer, explore files
bindkey -s 'e' ' ranger\n clear\n'
bindkey -M viins -s 'e' ' ranger\n clear\n'

# alt+r 
# bindkey -s 'r' ' | rg -i '
# bindkey -M viins -s 'r' ' | rg -i '
bindkey 'r' fzf-history-widget
bindkey -M viins 'r' fzf-history-widget

# alt+t
bindkey 't' fzf-history-widget
bindkey -M viins 't' fzf-file-widget

# alt+g to call g, aliased to go to bookmark
bindkey -s 'g' ' g '
bindkey -M viins -s 'g' ' g '

# ctrl+space to complete
bindkey '^ ' autosuggest-execute
bindkey -M viins '^ ' autosuggest-execute

# alt+l
bindkey -s '\el' ' ls -a\n'                               # [Esc-l] - run command: ls -a
bindkey -M viins -s '\el' ' ls -a\n'                               # [Esc-l] - run command: ls -a

# alt+shift+l
bindkey -s '' ' clear\n ls -a\n'
bindkey -M viins -s '' ' clear\n ls -a\n'

# alt+shift+.
bindkey -s '>' ' clear\n cd ..\n'
bindkey -M viins -s '>' ' clear\n cd ..\n'

bindkey -s '<' ' clear\n cd -\n'
bindkey -M viins -s '<' ' clear\n cd -\n'

# alt+;
bindkey -s ';' ' ls -al\n'
bindkey -M viins -s ';' ' ls -al\n'

# alt+shift+;
bindkey -s ':' ' clear\n ls -al\n'
bindkey -M viins -s ':' ' clear\n ls -al\n'

# alt+shift+d
bindkey -s 'D' ' dirs | head -10\n'
bindkey -M viins -s 'D' ' dirs | head -10\n'

# alt+<space>
bindkey -s ' ' 'cd '
bindkey -M viins -s ' ' 'cd '

# https://unix.stackexchange.com/questions/25765/pasting-from-clipboard-to-vi-enabled-zsh-or-bash-shell
vi-append-x-selection () { RBUFFER=$(xclip -o -selection clipboard </dev/null)$RBUFFER; }
zle -N vi-append-x-selection
bindkey -a 'p' vi-append-x-selection
vi-yank-x-selection () { print -rn -- $CUTBUFFER | xclip -selection clipboard; }
zle -N vi-yank-x-selection
bindkey -a 'y' vi-yank-x-selection

bindkey -a ' ' edit-command-line

# Default bindkeys enabled for vi mode
bindkey -M viins "^@" autosuggest-execute
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^B" backward-char
bindkey -M viins "^D" delete-char-or-list
bindkey -M viins "^E" end-of-line
bindkey -M viins "^F" forward-char
bindkey -M viins "^G" send-break
bindkey -M viins "^H" backward-delete-char
# Do not do "bindkey -M viins "^I" fzf-completion", or else tab will crash terminal
# https://github.com/junegunn/fzf/wiki/Configuring-fuzzy-completion
# setopt vi resets tab binding so unless have dedicated key, fuzzy completion unavailable
# bindkey '^I' "^I" expand-or-complete
bindkey -M viins "^J" accept-line
bindkey -M viins "^K" kill-line
bindkey -M viins "^L" clear-screen
bindkey -M viins "^M" accept-line
bindkey -M viins "^N" history-substring-search-down
bindkey -M viins "^O" accept-line-and-down-history
bindkey -M viins "^P" history-substring-search-up
bindkey -M viins "^Q" push-line
bindkey -M viins "^R" fzf-history-widget
bindkey -M viins "^S" history-incremental-search-forward
bindkey -M viins "^T" fzf-file-widget
bindkey -M viins "^U" kill-whole-line
bindkey -M viins "^V" quoted-insert
bindkey -M viins "^W" backward-kill-word
bindkey -M viins "^X^B" vi-match-bracket
bindkey -M viins "^X^E" edit-command-line
bindkey -M viins "^X^F" vi-find-next-char
bindkey -M viins "^X^J" vi-join
bindkey -M viins "^X^K" kill-buffer
bindkey -M viins "^X^N" infer-next-history
bindkey -M viins "^X^O" overwrite-mode
bindkey -M viins "^X^R" _read_comp
bindkey -M viins "^X^U" undo
bindkey -M viins "^X^V" vi-cmd-mode
bindkey -M viins "^X^X" exchange-point-and-mark
bindkey -M viins "^X*" expand-word
bindkey -M viins "^X=" what-cursor-position
bindkey -M viins "^X?" _complete_debug
bindkey -M viins "^XC" _correct_filename
bindkey -M viins "^XG" list-expand
bindkey -M viins "^Xa" expand-aliases
bindkey -M viins "^Xc" _correct_word
bindkey -M viins "^Xd" _list_expansions
bindkey -M viins "^Xe" _expand_word
bindkey -M viins "^Xg" list-expand
bindkey -M viins "^Xh" _complete_help
bindkey -M viins "^Xm" _most_recent_file
bindkey -M viins "^Xn" _next_tags
bindkey -M viins "^Xr" history-incremental-search-backward
bindkey -M viins "^Xs" history-incremental-search-forward
bindkey -M viins "^Xt" _complete_tag
bindkey -M viins "^Xu" undo
bindkey -M viins "^X~" _bash_list-choices
bindkey -M viins "^Y" yank
bindkey -M viins "^[^D" list-choices
bindkey -M viins "^[^G" send-break
bindkey -M viins "^[^H" backward-kill-word
bindkey -M viins "^[^I" self-insert-unmeta
bindkey -M viins "^[^J" self-insert-unmeta
bindkey -M viins "^[^M" self-insert-unmeta
bindkey -M viins "^[^_" copy-prev-word
bindkey -M viins "^[!" expand-history
bindkey -M viins "^[\"" quote-region
bindkey -M viins "^[\$" spell-word
bindkey -M viins "^['" quote-line
bindkey -M viins "^[," _history-complete-newer
bindkey -M viins "^[-" neg-argument
bindkey -M viins "^[." insert-last-word
bindkey -M viins "^[/" _history-complete-older
bindkey -M viins "^[0" digit-argument
bindkey -M viins "^[1" digit-argument
bindkey -M viins "^[2" digit-argument
bindkey -M viins "^[3" digit-argument
bindkey -M viins "^[4" digit-argument
bindkey -M viins "^[5" digit-argument
bindkey -M viins "^[6" digit-argument
bindkey -M viins "^[7" digit-argument
bindkey -M viins "^[8" digit-argument
bindkey -M viins "^[9" digit-argument
bindkey -M viins "^[?" which-command
bindkey -M viins "^[A" accept-and-hold
bindkey -M viins "^[B" backward-word
bindkey -M viins "^[C" capitalize-word
bindkey -M viins "^[F" forward-word
bindkey -M viins "^[G" get-line
bindkey -M viins "^[H" run-help
bindkey -M viins "^[L" down-case-word
bindkey -M viins "^[N" history-search-forward
bindkey -M viins "^[OA" history-substring-search-up
bindkey -M viins "^[OB" history-substring-search-down
bindkey -M viins "^[OC" forward-char
bindkey -M viins "^[OD" backward-char
bindkey -M viins "^[P" history-search-backward
bindkey -M viins "^[Q" push-line
bindkey -M viins "^[S" spell-word
bindkey -M viins "^[T" transpose-words
bindkey -M viins "^[U" up-case-word
bindkey -M viins "^[W" copy-region-as-kill
bindkey -M viins "^[[1;5C" forward-word
bindkey -M viins "^[[1;5D" backward-word
bindkey -M viins "^[[1~" beginning-of-line
bindkey -M viins "^[[200~" bracketed-paste
bindkey -M viins "^[[2~" overwrite-mode
bindkey -M viins "^[[3~" delete-char
bindkey -M viins "^[[4~" end-of-line
bindkey -M viins "^[[5~" up-line-or-history
bindkey -M viins "^[[6~" down-line-or-history
bindkey -M viins "^[[A" history-substring-search-up
bindkey -M viins "^[[B" history-substring-search-down
bindkey -M viins "^[[C" forward-char
bindkey -M viins "^[[D" backward-char
bindkey -M viins "^[[Z" reverse-menu-complete
bindkey -M viins "^[_" insert-last-word
bindkey -M viins "^[a" accept-and-hold
bindkey -M viins "^[b" backward-word
bindkey -M viins "^[c" fzf-cd-widget
bindkey -M viins "^[d" kill-word
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[h" run-help
bindkey -M viins "^[m" copy-prev-shell-word
bindkey -M viins "^[n" history-search-forward
bindkey -M viins "^[p" history-search-backward
bindkey -M viins "^[q" push-line
bindkey -M viins "^[s" spell-word
bindkey -M viins "^[t" transpose-words
bindkey -M viins "^[u" up-case-word
bindkey -M viins "^[w" kill-region
bindkey -M viins "^[x" execute-named-cmd
bindkey -M viins "^[y" yank-pop
bindkey -M viins "^[z" execute-last-named-cmd
bindkey -M viins "^[|" vi-goto-column
bindkey -M viins "^[~" _bash_complete-word
bindkey -M viins "^[^?" backward-kill-word
bindkey -M viins "^_" undo
bindkey -M viins " " magic-space
bindkey -M viins "!"-"\$" self-insert
bindkey -M viins "\$terminfo[kcud1]" history-substring-search-down
bindkey -M viins "\$terminfo[kcuu1]" history-substring-search-up
bindkey -M viins "%"-"~" self-insert
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "\M-^@"-"\M-^?" self-insert

# bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
# if [[ "${terminfo[kpp]}" != "" ]]; then
#   bindkey "${terminfo[kpp]}" up-line-or-history       # [PageUp] - Up a line of history
# fi
# if [[ "${terminfo[knp]}" != "" ]]; then
#   bindkey "${terminfo[knp]}" down-line-or-history     # [PageDown] - Down a line of history
# fi

# # start typing + [Up-Arrow] - fuzzy find history forward
# if [[ "${terminfo[kcuu1]}" != "" ]]; then
#   autoload -U up-line-or-beginning-search
#   zle -N up-line-or-beginning-search
#   bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
# fi
# # start typing + [Down-Arrow] - fuzzy find history backward
# if [[ "${terminfo[kcud1]}" != "" ]]; then
#   autoload -U down-line-or-beginning-search
#   zle -N down-line-or-beginning-search
#   bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
# fi

# if [[ "${terminfo[khome]}" != "" ]]; then
#   bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
# fi
# if [[ "${terminfo[kend]}" != "" ]]; then
#   bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
# fi

# bindkey ' ' magic-space                               # [Space] - do history expansion

# bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
# bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word
# bindkey '^[L' forward-word                        # [Ctrl-RightArrow] - move forward one word
# bindkey q^[H' backward-word                       # [Ctrl-LeftArrow] - move backward one word

# if [[ "${terminfo[kcbt]}" != "" ]]; then
#   bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
# fi

# bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
# if [[ "${terminfo[kdch1]}" != "" ]]; then
#   bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
# else
#   bindkey "^[[3~" delete-char
#   bindkey "^[3;5~" delete-char
#   bindkey "\e[3~" delete-char
# fi

# # Edit the current command line in $EDITOR
# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey '\C-x\C-e' edit-command-line

# # file rename magick
# bindkey "^[m" copy-prev-shell-word

# consider emacs keybindings:

#bindkey -e  ## emacs key bindings
#
#bindkey '^[[A' up-line-or-search
#bindkey '^[[B' down-line-or-search
#bindkey '^[^[[C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
#
#bindkey -s '^X^Z' '%-^M'
#bindkey '^[e' expand-cmd-path
#bindkey '^[^I' reverse-menu-complete
#bindkey '^X^N' accept-and-infer-next-history
#bindkey '^W' kill-region
#bindkey '^I' complete-word
## Fix weird sequence that rxvt produces
#bindkey -s '^[[Z' '\t'
