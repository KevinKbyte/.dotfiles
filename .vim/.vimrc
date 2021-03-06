" set filetype=vim
"  Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged') 
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align "Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" IMPORTANT: Make Ultisnips work with YouCompleteMe using SuperTab plugin
" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/32385352

" Multiple Plug commands can be written in a single line using | separators 

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'

" For youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all'}


" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' } 
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system

" https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
" Plug 'nixprime/cpsm', { 'do': 'env PY3=OFF ./install.sh' }
" Plug 'tacahiroy/ctrlp-funky'

Plug 'Yggdroot/LeaderF', {'do': './install.sh'}

Plug 'Konfekt/FastFold'

" For surrounding with quotes 
Plug 'tpope/vim-surround'

" For commenting 
Plug 'tpope/vim-commentary'

" For . support with tpope plugins
Plug 'tpope/vim-repeat'

" For speed
Plug 'easymotion/vim-easymotion'

" Fuzzy Finder
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Typescript autocomplete
" Plug 'leafgarland/typescript-vim'

" Unimpaired
Plug 'tpope/vim-unimpaired'

" More text objects
Plug 'wellle/targets.vim'

" For syntax
Plug 'vim-syntastic/syntastic'

" For language support
Plug 'sheerun/vim-polyglot'

" For git
Plug 'tpope/vim-fugitive'

" For Markdown
Plug 'plasticboy/vim-markdown'

" For Asynchronous
Plug 'skywind3000/asyncrun.vim'

" For i3 syntax color
Plug 'PotatoesMaster/i3-vim-syntax'

" to navigate w/ tmux + vim
Plug 'christoomey/vim-tmux-navigator'

" Colors
Plug 'flazz/vim-colorschemes'

" Note taking, personal wiki
Plug 'vimwiki/vimwiki'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'

" Fullscreen pane temporarily
" Plug 'vim-scripts/ZoomWin'

" Dependency of ghcmod-vim
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Python mode
Plug 'python-mode/python-mode'

" Python Autoimports
Plug 'KevinKByte/vimpy'

" Python import sorting
Plug 'fisadev/vim-isort'

" " Powerline
" Plug 'powerline/powerline'

" Tabline
Plug 'mkitt/tabline.vim'

" Jedi python
Plug 'davidhalter/jedi'

" \g will go to definition with this plugin
Plug 'davidhalter/jedi-vim'

"<> PLUG PROGRAMMING PLUGINS

" LaTeX
Plug 'lervag/vimtex'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview'


" Python style checker
Plug 'nvie/vim-flake8'

" C/C++ development
Plug 'JBakamovic/yavide'

" C/C++ autocomplete
Plug 'Rip-Rip/clang_complete'

" Status bar
Plug 'vim-airline/vim-airline'

" Switch b/n source and header files quickly
" Plug '/vim-scripts/a.vim'

" Autoformat code
Plug 'Chiel92/vim-autoformat'

" CamelCase motion
Plug 'bkad/CamelCaseMotion'

if has("nvim")
    Plug 'Shougo/denite.nvim'
    Plug 'kassio/neoterm'

    Plug 'mhinz/vim-startify'
    Plug 'mhinz/neovim-remote'
else

    " For tab guidelines
    Plug 'Yggdroot/indentLine'

    " For the tables
    Plug 'dhruvasagar/vim-table-mode'


    " " For Python text objects
    " Plug 'bps/vim-textobj-python'
    " For Java dev
    Plug 'artur-shaik/vim-javacomplete2'


    " File drawer
    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'


    " Live Browser Editing 
    " Plug 'jaxbot/browserlink.vim'

    " Undo tree
    Plug 'mbbill/undotree/'

    " Haskell
    Plug 'eagletmt/ghcmod-vim'

    " Class Outline Viewer
    Plug 'majutsushi/tagbar'

    " Multiple cursors
    " Plug 'terryma/vim-multiple-cursors'

endif
    
call plug#end()

"<>""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

let mapleader = ' ' 

"============
"<> Multiple cursors
"============

"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<Leader>mn'
"let g:multi_cursor_prev_key='<Leader>mp'
"let g:multi_cursor_skip_key='<Leader>ms'
"let g:multi_cursor_quit_key='<Leader>mq'

"" Note that when multicursor mode is started, it selects current word with
"" boundaries, i.e. it behaves like *. If you want to avoid word boundaries in
"" Normal mode (as g* does) but still have old behaviour up your sleeve, you can
"let g:multi_cursor_start_word_key='<Leader>mN'

"" If set to 0, then pressing g:multi_cursor_quit_key in Visual mode will not
"" quit and delete all existing cursors
"let g:multi_cursor_exit_from_visual_mode = 1

"" If set to 0, then pressing g:multi_cursor_quit_key in Insert mode will not
"" quit and delete all existing cursors. 
"let g:multi_cursor_exit_from_insert_mode = 1

"" Any key in this map (values are ignored) will cause multi-cursor Normal mode
"" to pause for map completion just like normal vim
"let g:multi_cursor_normal_maps = {'!':1, '@':1, '=':1, 'q':1, 'r':1, 't':1, 'T':1, 'y':1, '[':1, ']':1, '\':1, 'd':1, 'f':1, 'F':1, 'g':1, '"':1, 'z':1, 'c':1, 'm':1, '<':1, '>':1}

"" Any key in this map (values are ignored) will cause multi-cursor Visual mode
"" to pause for map completion just like normal vim. Otherwise keys mapped in
"" visual mode will "fail to replay" when multiple cursors are active. 
"let g:multi_cursor_visual_maps = {'space':1, 'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1}

"" Default highlighting (see help :highlight and help :highlight-link)
"highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
"highlight link multiple_cursors_visual Visual"

""This allows one to a) search for a keyword using * b)
"nnoremap <silent> <Leader>mj :MultipleCursorsFind <C-R>/<CR>
"vnoremap <silent> <Leader>mj :MultipleCursorsFind <C-R>/<CR>

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-5.0/lib'

" autocmd FileType cpp set keywordprg=cppman
let g:ycm_semantic_triggers = { 'c': [ 're!\w{2}' ] }

" " allows for backspaces to work properly
set backspace=indent,eol,start

"============
"<> FastFold
"============

nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

""============
""<> CamelCase motion
""============
" Map to w, b and e mappings:
" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" map <silent> ge <Plug>CamelCaseMotion_ge
" sunmap w
" sunmap b
" sunmap e
" sunmap ge

" Map insert mode motions:
" imap <silent> <S-Left> <C-o><Plug>CamelCaseMotion_b
" imap <silent> <S-Right> <C-o><Plug>CamelCaseMotion_w

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

""============
""<> FZF
""============

" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction
" \ 'ctrl-q': function('s:build_quickfix_list'),

let g:fzf_action = {
  \ 'Alt-t': 'tab split',
  \ 'Alt-x': 'split',
  \ 'Alt-v': 'vsplit' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

""============
""<> CTRLP
""============

let g:AutoPairsShortcutToggle = '<M-a>'

" https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
" let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }

" let g:ctrlp_funky_syntax_highlight = 1
" nnoremap <leader>F :CtrlPFunky<CR>

" let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:30'
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<M-u>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<M-d>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<M-n>'],
    \ 'PrtHistory(1)':        ['<M-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<M-h>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<M-t>'],
    \ 'AcceptSelection("v")': ['<M-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<M-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<M-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<M-F>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<M-c>', '<insert>'],
    \ 'PrtInsert()':          ['<M-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<M-Space>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<M-y>'],
    \ 'MarkToOpen()':         ['<M-z>'],
    \ 'OpenMulti()':          ['<M-o>'],
    \ 'PrtExit()':            ['<M-e>', '<c-c>', '<c-g>'],
    \}

let g:ctrlp_custom_ignore = {
\ 'dir': '\v[\/]\.(git)|tmp|view|plugged|undo|swap|hg|svn|etc|bin|run|cdrom|boot|dev|lib|lost|media|root|run|mnt|snap|srv|sys|System|usr|var|sbin|proc|opt$',
\ 'file': '\v\.(swp|zip|mp3|mp4|wav|tar|bin|jar|pyc|swo|png|jpeg|jpg|jpg_large|gif|pdf|aup|au|exe|so|dll)$',
\ }

let g:ctrlp_root_markers = ['$HOME/Desktop']
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=750

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" The last command can be used to add all recently used work dirs to the CtrlPBookmarkDir list by an autocommand like
" augroup CtrlPDirMRU
"   autocmd!
"   autocmd FileType * if &modifiable | execute 'silent CtrlPBookmarkDirAdd! %:p:h' | endif
" augroup END


if has("nvim")
    " nnoremap <A-p> :Denite file/rec<CR>
    " nnoremap <A-L> :Denite file/rec buffer<CR>
    " FZF
    nnoremap <M-P> :CtrlPMRUFiles<CR>
    nmap <A-p> :CtrlP .<CR>
    nnoremap <A-l> :Buffers<CR>
    nnoremap <M->> :Files ..<CR>
    nnoremap <M-lt> :Files 
    " nnoremap l :CtrlMRUBuffer<CR>
else
    nmap p :CtrlP .<CR>
    " let g:Lf_ShortcutF = '<c-p>'
    let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['u', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['d', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['n'],
    \ 'PrtHistory(1)':        ['p'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['h', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['t'],
    \ 'AcceptSelection("v")': ['v', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['r'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['f', '<c-up>'],
    \ 'ToggleType(-1)':       ['F', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['c', '<insert>'],
    \ 'PrtInsert()':          ['\'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      [' '],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['y'],
    \ 'MarkToOpen()':         ['z'],
    \ 'OpenMulti()':          ['o'],
    \ 'PrtExit()':            ['e', '<c-c>', '<c-g>'],
    \ }


    " " search word under cursor, the pattern is treated as regex, and enter normal mode directly
    " noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
    " " search word under cursor, the pattern is treated as regex,
    " " append the result to previous search results.
    " noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>
    " " search word under cursor literally only in current buffer
    " noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -F --current-buffer -e %s ", expand("<cword>"))<CR>
    " " search visually selected text literally, don't quit LeaderF after accepting an entry
    " xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
    " " recall last search. If the result window is closed, reopen it.
    " noremap go :<C-U>Leaderf! rg --stayOpen --recall<CR>

    nnoremap P :CtrlPMRUFiles<CR>
    nnoremap l :CtrlMRUBuffer<CR>

    if executable('fd')
        let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
    else 
        if executable('ag')
          let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif
    endif

    " nnoremap <leader>mr :CtrlPMRU<CR>
endif

"============
"<> TMUX
"============

" inoremap <silent>  <C-o>:TmuxNavigateLeft<CR>
" inoremap <silent> J <C-o>:TmuxNavigateDown<CR> 
" inoremap <silent> K <C-o>:TmuxNavigateUp<CR>
" inoremap <silent>  <C-o>:TmuxNavigateRight<CR>
let g:BASH_Ctrl_j = 'off'


if has("nvim")
    autocmd WinEnter term://* nohlsearch
        " https://vi.stackexchange.com/questions/3670/how-to-enter-insert-mode-when-entering-neovim-terminal-pane

    " to not switch to insert mode when coming back from vim pane fullscreen mode
    " Cuz it would insert mode even on non-terminal panes
    let g:fullscreening = 0
    fun! TermInsertMode()
        " " https://github.com/junegunn/fzf/issues/426
        if g:fullscreening == 0
            startinsert
        else
            call feedkeys('')
            let g:fullscreening = 0
        endif
        " let l:filename = expand("%")[0:4]
        " if l:filename == "term:"
            " startinsert
        " endif
    endfun

    autocmd BufEnter term://* call TermInsertMode()
    autocmd FileType fzf startinsert

    " using https://github.com/junegunn/fzf.vim & fzf installed.
    " Backspaces are used so the :tnoremap's special characters aren't
    " evaluated immediately. 
    " Purpose: when leaving fzf with esc, remaps esc back to "change to normal mode" keybinding
    autocmd FileType fzf tnoremap <Esc> <C-\><C-n>:tnoremap < <BS>Esc> < <BS>C-\>< <BS>C-n>< <BS>CR><CR>ZQ

    nnoremap <silent> <A-H> :TmuxNavigateLeft<CR> 
    nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
    nnoremap <silent> <A-J> :TmuxNavigateDown<CR> 
    nnoremap <silent> <A-K> :TmuxNavigateUp<CR>
    nnoremap <silent> <A-L> :TmuxNavigateRight<CR>
    nnoremap <silent> <A-N> :TmuxNavigatePrevious<CR>
    tnoremap <silent> <Esc> <C-\><C-n>

    " au FileType term://* startinsert

    " https://github.com/junegunn/fzf.vim/issues/544
    " au TermOpen * tnoremap <Esc> <c-\><c-n>
    " autocmd TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
    " tnoremap <Esc> <c-\><c-n>
    " autocmd FileType fzf tunmap <buffer> <Esc>

    tnoremap <C-H> <C-\><C-n><C-w>h
    tnoremap <A-J> <C-\><C-n><C-w>j
    tnoremap <A-K> <C-\><C-n><C-w>k
    tnoremap <A-L> <C-\><C-n><C-w>l

"     " nnoremap <F5>" <C-W><C-V>:enew<CR>:Tnew<CR>
"     nnoremap <F5>L <C-W>v<C-W>l<C-\><C-n>:enew<CR>:Tnew<CR>i
"     nnoremap <F5>K <C-W>n<C-\><C-n>:Tnew<CR>i
"     nnoremap <F5>J :belowright split<CR>j<C-\><C-n>:enew<CR>:Tnew<CR>i
"     nnoremap <F5>H <C-W>v<C-\><C-n>:enew<CR>:Tnew<CR>i

"     tnoremap <F5>L <C-\><C-n><C-W>v<C-W>l<C-\><C-n>:enew<CR>:Tnew<CR>i
"     tnoremap <F5>K <C-\><C-n><C-W>n<C-\><C-n>:Tnew<CR>i
"     tnoremap <F5>J <C-\><C-n>:belowright split<CR>j<C-\><C-n>:enew<CR>:Tnew<CR>i
"     tnoremap <F5>H <C-\><C-n><C-W>v<C-\><C-n>:enew<CR>:Tnew<CR>i

"     " For opening up new empty vim panes
"     nnoremap <F5>l <C-W>n<C-W>L
"     nnoremap <F5>k <C-W>n
"     nnoremap <F5>j <C-W>n<C-W>J
"     nnoremap <F5>h <C-W>n<C-W>H

"     tnoremap <F5>l <C-\><C-n><C-W>n<C-W>L
"     tnoremap <F5>k <C-\><C-n><C-W>n<C-W>K
"     tnoremap <F5>j <C-\><C-n><C-W>n<C-W>J
"     tnoremap <F5>h <C-\><C-n><C-W>n<C-W>H
else
    nnoremap <silent>  :TmuxNavigateLeft<CR>
    nnoremap <silent> J :TmuxNavigateDown<CR> 
    nnoremap <silent> K :TmuxNavigateUp<CR>
    nnoremap <silent> L :TmuxNavigateRight<CR>
    nnoremap <silent> N :TmuxNavigatePrevious<CR>
endif

"<>

" Tmux maintains color
set background=dark
set t_Co=256

let g:tmux_navigator_no_mappings = 1

"============
"<> JAVA SUPPORT
"============

" To allow syntastic with Java
let g:syntastic_java_checkers = []
let g:JavaComplete_ShowExternalCommandsOutput = 1
let g:JavaComplete_JavaCompiler="/usr/bin/javac"
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" path to additional jar files
" let g:JavaComplete_LibsPath = ''

" let g:JavaComplete_GradleExecutable = 'gradle' - use your own path to gradle executable file.

" set directory that contains custom templates, for class creation. By default this options is null.
let g:JavaComplete_CustomTemplateDirectory = '~/.jc_templates'

" Disable automatic startup of server (0)
let g:JaveComplete_AutoStartServer = 0

" use full qualified name in completions description. By default is 0
let g:JavaComplete_UseFQN = 1
set background=dark

" set the base cache directory of javacomplete2. By default it is ~/.cache.
let g:JavaComplete_BaseDir = '~/.cache' 

" directory to write server logs
let g:JavaComplete_JavaviLogfileDirectory = ''

" enables server side logging
let g:JavaComplete_JavaviDebug = 1

"============
"<> PYTHON
"============

" Python Mode

" Turns on whole plugin (1)
let g:pymode = 1

" Turns on plugin's warnings (0)
let g:pymode_warnings = 0

" Trim unused white spaces on save
let g:pymode_trim_whitespaces = 1

" Setup pymode quickfix window
let g:pymode_rope = 0
" let g:pymode_quickfix_minheight = 3
" let g:pymode_quickfix_maxheight = 6
" let g:pymode_rope_autoimport=1
" let g:pymode_rope_autoimport_import_after_complete = 1
" let g:pymode_rope_autoimport_modules = ['os', 'numpy', 'subprocess']

" let g:pymode_rope_rename_bind = '<C-c>rr'
" let g:pymode_rope_autoimport_bind = '<C-c>ra'

noremap <F3> :Autoformat<CR>

" to disable jedi-vim autocomplete for YCM, but allows jedi-vim's \g
" (assignments), \d (definitions), K (documentation), <leeader>r rename,
" <leader>n shows all usages of a name, :Pyimport <module> opens module
let g:jedi#completions_enabled = 1

" IMPORTANT LINE, allows YCM to autocomplete
let g:jedi#force_py_version = 3

" YCM python interpreter
" let g:ycm_server_python_interpreter = '/usr/bin/python3'
" For Python Semantic Completion w/ youcompleteme
let g:ycm_python_binary_path = '/usr/bin/python3'

" For vim-autoformat
let g:formatterpath = [ '/home/kevin/.vim/plugged/vim-flake8' ]

"============
"<> FOLDS
"============

" folds almost all indented lines 
if has("nvim") 
else
    set foldmethod=indent
    nnoremap <leader>fmm :set foldmethod=manual<CR>
    nnoremap <leader>fmi :set foldmethod=indent<CR>
    nnoremap <leader>fms :set foldmethod=syntax<CR>

    augroup AutoSaveFolds
      autocmd!
      autocmd BufWinLeave ?* mkview
      autocmd BufWinEnter ?* silent loadview
    augroup END
endif

"============
"<> SAVE STATES
"============

" Double trailing slashes in vim activates feature to avoid name collisions
" /path/one/foobar.txt --> %path%one%foobar.txt
set backupdir=~/.dotfiles/.vim/backup//
set directory=~/.dotfiles/.vim/swap//

if has("persistent_undo")
    set undodir=~/.dotfiles/.vim/undo//
    set undofile
endif

" Keep undo history across sessions 
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2

" use f0 instead of f1 to stop viminfo from saving marks and jumps
" Saves for up to 100 files
set viminfo='100,f1

" Undo tree activate!
nnoremap u :UndotreeToggle<CR>

" Disable LaTeX-Box for vimtex
let g:polyglot_disabled = ['latex']

" autocmd FileType * exec("setlocal dictionary+=".$HOME."/.vim/dictionaries/".expand('<amatch>'))
" set completeopt=menuone,longest,preview
" set complete+=k

" Ultisnips python v3
" let g:UltiSnipsUsePythonVersion = 3
nnoremap <leader>ue :UltiSnipsEdit<CR>

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

" IMPORTANT: Make Ultisnips work with YouCompleteMe using SuperTab plugin
" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme/32385352
set pumheight=10
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"...
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/plugged/vim-snippets/UltiSnips']
let g:UltiSnipsEditSplit= "context"

set cursorline cursorcolumn
set ic          " Defaults ignore case when search

"============
"<> YCM MISC
"============
" autocmd filetype python let g:loaded_youcompleteme = 1

" defines a shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" <> PERSISTS SYSTEM CLIPBOARD ON EXIT
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" YCM shows completion menu typing inside comments
let g:ycm_complete_in_comments = 0
" YCM shows completion menu typing inside strings
let g:ycm_complete_in_strings = 0
" YCM collect ids from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" YCM seed ids with syntax
let g:ycm_seed_identifiers_with_syntax = 1
" YCM keeps log files after shutdown (1), not kept (0)
let g:ycm_keep_logfiles = 0
" YCM stop completion
let g:ycm_key_list_stop_completion = ['<C-y>']
" Extra Conf Path Config
" let g:ycm_global_ycm_extra_conf = '/home/kev/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

"" load ycm conf by default
let g:ycm_confirm_extra_conf=0

" let g:ycm_key_invoke_completion = '<C-n>'

"============
"<> NERDTREE
"============

if has("nvim")
else
    " nnoremap <silent>;nt :NERDTreeToggle<CR>
    " nnoremap <silent>;nf :NERDTreeFind<CR>

    " Closes vim if only window left open is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " To open NERDTree automatically when vim starts up w/o any files specified
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " To change default arrows
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

    " Auto delete buffer of file you just deleted with Nerd Tree
    let NerdTreeAutoDeleteBuffer = 1

    " Disable Press ? for help
    let NERDTreeMinimalUI = 0
    let NERDTreeDirArrows = 0
endif

"<>

"u===========
"<> EASY MOTION
"============

" map <leader>bl <Plug>(easymotion-bl)
" map <leader>B <Plug>(easymotion-B)

" map <leader>el <Plug>(easymotion-el)
" " map <leader>El <Plug>(easymotion-El)

" map <leader>gel <Plug>(easymotion-gel)
" map <leader>gE <Plug>(easymotion-gE)
" " map <leader>ge <Plug>(easymotion-bd-ge)
" " nmap <leader>ge <Plug>(easymotion-overwin-ge)

" " " <Leader>f{char} to move to {char}
" map <leader>gf <Plug>(easymotion-bd-f)
" nmap <leader>gf <Plug>(easymotion-overwin-f)

"  " 1 line s{char}{char} to move to {char}{char}
" map <leader>f <Plug>(easymotion-fl2)
" map <leader>F <Plug>(easymotion-Fl2)
map <leader>f <Plug>(easymotion-overwin-f2)
map <leader>f <Plug>(easymotion-bd-f2)
" map <leader>ft <Plug>(easymotion-overwin-f2)
" map <leader>ft <Plug>(easymotion-bd-f2)
" map <leader>fo <Plug>(easymotion-overwin-f)
" map <leader>fo <Plug>(easymotion-bd-f)
" " " s{char}{char} to move to {char}{char}
" " nmap j <Plcg>(easymotion-overwin-f2)

" " " Move to line
" map <leader>l <Plug>(easymotion-bd-jk)
" nmap <leader>l <Plug>(easymotion-overwin-line)

" " " 1 line Move to word
" nmap <leader>wl <Plug>(easymotion-wl)
" nmap <leader>W <Plug>(easymotion-W)
" " " Move to word
" map  <leader>gw <Plug>(easymotion-bd-w)
" nmap <leader>gw <Plug>(easymotion-overwin-w)

" map ;r <Plug>(easymotion-s)
nmap <leader>h <Plug>(easymotion-next)
nmap <leader>l <Plug>(easymotion-prev)
nmap <leader>rcv :e ~/.vimrc<CR>

"<>

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"============
"<> MISC
"============

nnoremap <leader>cu :w \| %bd \| e#<CR>

" https://github.com/mhinz/vim-startify/issues/139
" if has('nvim')
"   autocmd TabNewEntered * Startify
" else
autocmd VimEnter * let t:startify_new_tab = 1
autocmd BufEnter *
    \ if !exists('t:startify_new_tab') && empty(expand('%')) |
    \   let t:startify_new_tab = 1 |
    \   Startify |
    \ endif
" endif

if has("nvim")
    " https://stackoverflow.com/questions/34009064/how-do-i-set-the-terminal-buffer-scrollback-size
    autocmd TermOpen * setlocal scrollback=100000
    " or put this line in ~/.config/nvim/init.vim
    " set scrollback=100000
    
    " https://www.reddit.com/r/neovim/comments/632wh4/neovim_does_not_save_last_cursor_position/
    autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

    " tnoremap <F5>F <C-\><C-n><C-w>\|<C-w>_
    " nnoremap <leader>> :tabm +<CR>
    " nnoremap <leader>< :tabm -<CR>
    cnoremap <M-b> <S-Left>
    cnoremap <M-f> <S-Right>
    cnoremap <M-a> <Home>
    cnoremap <M-e> <End>
    cnoremap <C-a> <Home>
    cnoremap <C-e> <End>
else
    cnoremap b <S-Left>
    cnoremap f <S-Right>
endif

nnoremap Q :wa<CR>:silent! %bd<CR>

" to auto move to right window when vertical splitting
nnoremap v vl

nnoremap <leader>vr :tabe ~/.vimrc<CR>
" nnoremap <leader>vr :tabe ~/.vimrc<CR>:set filetype=vim<CR>

" http://vim.wikia.com/wiki/Search_for_visually_selected_text
" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpo = s:save_cpo | unlet s:save_cpo

" FOR REFACTORING
" https://vi.stackexchange.com/questions/13689/how-to-find-and-replace-in-vim-without-having-to-type-the-original-word
" changes all occurrences of word
nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" changes all occurrences of word
" https://www.reddit.com/r/vim/comments/19sm9v/replace_all_instances_of_currently_highlighted/
" http://vim.wikia.com/wiki/Search_and_replace_in_a_visual_selection
nnoremap <Leader>C :%s///gc<Left><Left><Left>
vmap <Leader>C #:%s///gc<Left><Left><Left>

vnoremap / <Esc>/\%V

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-j> i<CR><Esc>

" netrw 
" https://vi.stackexchange.com/questions/6837/explore-shows-the-directory
let g:netrw_list_hide = '^\./$'
let g:netrw_hide = 1

" FZF Mappings
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

if has('nvim')
    inoremap <M-f> <C-o>w
    inoremap <M-b> <C-o>b

    imap <M-w> <plug>(fzf-complete-word)
    imap <M-P> <plug>(fzf-complete-path)
    imap <M-n> <plug>(fzf-complete-file-ag)
    imap <M-l> <plug>(fzf-complete-line)
    imap <M-L> <plug>(fzf-complete-buffer-line)
else
endif

" Make calcurse notes markdown compatible
" https://www.youtube.com/watch?v=hvc-pHjbhdE
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead, BufNewFile ~/.calcurse/notes/* set filetype=markdown

" source:
" https://stackoverflow.com/questions/916875/yank-file-name-path-of-current-buffer-in-vim
" copy current file name (relative/absolute) to unnamed register (@"") [not
" system clipboard (@+ and @*)] (Linux version)

if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
  " relative path (src/foo.txt)
  nnoremap <leader>cf :let @+=expand("%")<CR>

  " absolute path (/something/src/foo.txt)
  nnoremap <leader>cF :let @+=expand("%:p")<CR>

  " filename (foo.txt)
  nnoremap <leader>cn :let @+=expand("%:t")<CR>

  " directory name (/something/src)
  nnoremap <leader>cd :let @+=expand("%:p:h")<CR>
endif

" " copy current file name (relative/absolute) to system clipboard (Linux version)
" if has("mac") || has("gui_macvim") || has("gui_mac")
"   " relative path  (src/foo.txt)
"   nnoremap <leader>cf :let @*=expand("%")<CR>

"   " absolute path  (/something/src/foo.txt)
"   nnoremap <leader>cF :let @*=expand("%:p")<CR>

"   " filename       (foo.txt)
"   nnoremap <leader>ct :let @*=expand("%:t")<CR>

"   " directory name (/something/src)
"   nnoremap <leader>ch :let @*=expand("%:p:h")<CR>
" endif

nnoremap <leader>sft :set filetype=

" Write as sudo for readonly files
cmap w!! w !sudo sh -c "cat > '%'"

set wildmenu
set wildmode=longest,list,full

" Macro doesn't play and make it slow
set lazyredraw

" man page viewer
runtime! ftplugin/man.vim


" allows you to open vim help for keywords when you're in vimrc
setlocal keywordprg=:help

" SEARCH

" Sets Incremental Search (Search while typing)
set incsearch
if has("nvim")
    " Shows global replacement in a split
    set inccommand=split 
endif

" Uses case if any caps are used
set smartcase

" copy the previous indentation on autoindenting
set copyindent    

set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

cmap w!! w !sudo tee % >/dev/null

" Updates timestamps in XML files
" Enter :UpdateTimeStamps to update the value to the current time in each
" instance of a tag w/ format shown below. 
" Type :Up<Tab> 
" Can apply to multiple buffers w/ :bufdo UpdateTimeStamps

function! s:UpdateTimestamps()
  let tstamp = strftime('%s000')
  %s#<property name='p2.timestamp' value='\zs\d\+\ze'/>#\=tstamp#g
  echo 'New time: ' . tstamp
endfunction
command! UpdateTimestamps call s:UpdateTimestamps()

" SNIPPETS: " Read an empty HTML template and move cursor to title 
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" Adding indentation functionality
" autocmd FileType html setlocal shiftwidth=2 tabstop=2
" autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
" set expandtab           " Changes tabs into spaces
" set shiftwidth=4        " Indents correspond to tabs
set tabstop=4 expandtab shiftwidth=4 " tabs to be 4 spaces
" set autoindent          " Auto indents 
set cindent             " stricter rules for c programs
set wrap linebreak nolist

set autochdir           " allows :e <filename> to work w/o :e %:h/filename

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" the ^[ is an esc char that comes before the 'a'
" in most default configs, ^[a may be typed by pressing first <c-v>, then <m-a>
" allows commenting on apache filetype when using tpope/vim-commentary
autocmd filetype apache setlocal commentstring=#\ %s


" in order to support 

" keeps line number on by default
set nu

" sets relative numbering on the left side of vim
set relativenumber

" enter the current millenium 
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on 
filetype plugin indent on

" enable vim reverse history search in the command line
" https://stackoverflow.com/questions/741913/how-do-you-search-through-vims-command-history
set history=3000

" for C-p/C-n search completion in vim command line
" https://stackoverflow.com/questions/14244513/reverse-search-completion-of-vims-command-history-without-using-direction-keys
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" File naigation
set path+=**
" Display all matching files when we tab complete 
set wildmenu

" Tag Jumping
command! MakeTags !ctags -R .

" NOW WE CAN: 
" - Use C-] to jump to tag under cursor 
" - Use gC-] for ambiguous tags 
" - Use C-t to jump back to the tag stack 

" THINGS TO CONSIDER: 
" - This doesn't help if you want a visual list of tags

if has('nvim')
else
    let g:netrw_banner=0 "disable annoying banner 
    let g:netrw_browse_split=4 "open in prior window 
    let g:netrw_altv=1 "open splits to the right 
    let g:netrw_liststyle=3 "tree view 
    let g:netrw_list_hide=netrw_gitignore#Hide() 
    let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
endif

" NOW WE CAN: 
" - :edit a folder to open a file browser 
" - <CR>/v/t to open in an h-split/v-split/tab 
" - check |netrw-browse-maps| for more mappings

" BUILD INTEGRATION: " Steal Mr. Bradley's formatter & add it to our spec_helper " http://philipbradley.net/rspec-into-vim-with-quickfix "
" Configure the 'make' command to run RSpec set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter  
" NOW WE CAN:
" - Run :make to run RSpec - :cl to list errors
" - :cc# to jump to error by number - :cn and :cp to navigate forward and back

set showcmd

"============
"<> VIMWIKI
"============

" So markdown files will not be opened as VimWiki syntax
let g:vimwiki_global_ext=0
" let g:vimwiki_folding='list'

" Make vimwiki as markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                     \ 'syntax': 'markdown', 'ext': '.md'}]
"============
"<> RICE
"============

if has('nvim')
else
colorscheme xoria256
" highlight Normal guibg=black guifg=white
" set background=dark
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = get(g:, 'airline#extensions#wordcount#filetypes',
      \ '\vhelp|markdown|vimwiki|rst|org|text|asciidoc|tex|mail')
endif

"============
"<> CUSTOM MAPS
"============

" easier moving code blocks
" vnoremap < <gv " better indentation
" vnoremap > >gv " better indentation

" Shows whitespace
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" au InsertLeave * match ExtraWhitespace /\s\+$/

nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>

" nnoremap <C-W>o :silent! ZoomWin<CR>

nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

" inoremap kj <Esc>
inoremap kj 
" nnoremap <CR> i<CR><Esc>
" For managing tabs nnoremap tc :tabclose<CR> nnoremap ti :tabnew<Space> nnoremap tn :tabnext<CR> nnoremap tp :tabprev<CR> nnoremap tf :tabfirst<CR> nnoremap tl :tablast<CR>

augroup bufclosetrack
  au!
  autocmd WinLeave * let g:lastWinName = @%
augroup END
function! LastWindow()
  exe "split " . g:lastWinName
endfunction

nnoremap <leader>tn :tabe 
nnoremap <Leader>wp <C-w><C-p>
nnoremap <Leader>tj :tabfirst<CR>
nnoremap <Leader>tk :tablast<CR>
nnoremap <Leader>tc :tabclose<CR>

" Tab movement
if !exists('g:lasttab')
      let g:lasttab = 1
  endif
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

nnoremap <leader>mt :tabm 
nnoremap <leader>> :tabm +<CR>
nnoremap <leader>< :tabm -<CR>

" nnoremap <leader>F <C-w>\|<C-w>_
" https://vi.stackexchange.com/questions/241/undo-only-window
nnoremap <C-w>o :call TempFullscreen()<CR>
nnoremap <leader>F :call TempFullscreen()<CR>

let g:isFullScreened = 0

" autocmd FileType \(term://*\)\@! call feedkeys('')
function! TempFullscreen()
    if g:isFullScreened == 1
      let g:isFullScreened = 0
      let g:fullscreening = 1
      source ~/session.vim
    else
      let g:isFullScreened = 1
      mksession! ~/session.vim
      wincmd o
    endif
endfunction



" Map for vertical split gf
" https://vi.stackexchange.com/questions/3364/open-filename-under-cursor-like-gf-but-in-a-new-tab-or-split
nnoremap <C-W><C-F> <C-W><C-V><C-W><C-P>gf

nnoremap <silent><Leader>nt :NERDTreeToggle<CR>
nnoremap <silent><Leader>nf :NERDTreeFind<CR>

" For moving lines around

" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Clear Search Highlights

set hlsearch

" Remove $ signs at end of every line
set nolist

nnoremap <leader>nh :nohl<CR>

" Toggle Settings

nnoremap <leader>ss :set spell!<CR>

" Allows for moving around wrapped lines seamlessly
" nnoremap j gj
" nnoremap k gk

" to allow for alt + w to work in insert mode, because it's not working for
" some reason
inoremap w <c-o>w
inoremap $ <c-o>$
inoremap ^ <c-o>^
inoremap l <c-o>l
" inoremap h <c-o>h
inoremap e <c-o>e
inoremap <s-e> <c-o><s-e>
" inoremap j <c-o>j
inoremap <s-j> <c-o><s-j>
inoremap ge <c-o>g<c-o>e
" inoremap k <c-o>k
inoremap i <esc>
inoremap . <c-o>.
inoremap b <c-o>b
inoremap f <c-o>e
inoremap <s-b> <c-o><s-b>
inoremap o <c-o>:so %<CR>

nnoremap gfb :call search("[{[(]", "wes")<CR>
nnoremap gbb :call search("[{[(]", "bes")<CR>

if has('nvim')
    inoremap <A-s> <c-o>:w<CR>
    nnoremap <A-s> :w<CR>
    inoremap <A-o> <c-o>:so %<CR>
    nnoremap <A-o> :so %<CR>
    " nnoremap <A-l> :ls<CR>:b 
else
    inoremap s <c-o>:w<CR>
    nnoremap s :w<CR>
    nnoremap o :so %<CR>
    " nnoremap l :ls<CR>:b 
endif

if has('nvim')
    noremap <Up> <C-w>k
    noremap <Down> <C-w>j
    noremap <Left> <C-w>h
    noremap <Right> <C-w>l
else
    " noremap <Up> <Nop>
    " noremap <Down> <Nop>
    " noremap <Left> <Nop>
    " noremap <Right> <Nop>
endif

" to delete without backspace :)
inoremap x <backspace>
" nnoremap  :hid<CR>
inoremap o 

nmap K <leader>K

" Text to speech 
" Took some knowledge from
" https://github.com/vim-scripts/Speech/blob/master/plugin/speech.vim

" allows <C-a> to also increment letters
set nrformats+=alpha

let g:SpeechLang = 'en-us'

function! TexttoSpeech (string)
    echo a:string
    let string = a:string
    let string = substitute (string, '[', ' open square bracket ', 'g')
    let string = substitute (string, ']', ' closed square bracket ', 'g')
    let string = substitute (string, '{', ' open curly bracket ', 'g')
    let string = substitute (string, '}', ' closed curly bracket ', 'g')
    let string = substitute (string, '(', ' open parentheses ', 'g')
    let string = substitute (string, ')', ' closed parentheses ', 'g')
    let string = substitute (string, "'", ' single quote ', 'g')
    let string = substitute (string, '"', ' double quote ', 'g')
    let string = substitute (string, '&', ' ampersand ', 'g')
    let string = substitute (string, '\.', ' period ', 'g')
    let string = substitute (string, ',', ' comma ', 'g')
    let string = substitute (string, ':', ' colon ', 'g')
    let string = substitute (string, ';', ' semicolon ', 'g')
    let string = substitute (string, '<', ' less than ', 'g')
    let string = substitute (string, '>', ' greater than ', 'g')
    let string = substitute (string, '/', ' forward slash ', 'g')
    let string = substitute (string, '\', ' backslash ', 'g')
    let string = substitute (string, '\^', ' caret ', 'g')
    let string = substitute (string, '?', ' question mark ', 'g')
    let string = substitute (string, '\!', ' exclamation point ', 'g')
    let string = substitute (string, '\#', ' hashtag ', 'g')
    let string = substitute (string, '\$', ' dollar sign ', 'g')
    let string = substitute (string, '%', ' percentage sign ', 'g')
    let string = substitute (string, '\*', ' asterick ', 'g')
    let string = substitute (string, '\-', ' minus sign ', 'g')
    let string = substitute (string, '+', ' plus sign ', 'g')
    let string = substitute (string, '=', ' equals sign ', 'g')
    let string = substitute (string, '@', ' at symbol ', 'g')
    let string = substitute (string, '\`', ' backtick ', 'g')
    let string = substitute (string, '\~', ' tilde ', 'g')
    let string = substitute (string, '_', ' underscore ', 'g')

    " allows distinguishing of capital letters in audio
    let l:alph = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
        \ 'V', 'W', 'X', 'Y', 'Z']
    for s:item in l:alph
        let string = substitute (string, '\C' . s:item, ' capital ' . s:item, 'g')
    endfor

    let string = substitute (string, '[^A-Za-z0-9,. ]', '', 'g')

    let l:cmd = '!espeak -v en "' . string . '"'
    " let l:api = '"http://translate.google.com/' . 
    "                                \ 'translate_tts?ie=UTF-8&tl=' . g:SpeechLang .
    "                                \ '&client=tw-ob' .
    "                                \ '&q=' . string . '"'
    " " let x = system ('mplayer ' .
    " "                 \ api .
    " "                 \ ' > /dev/null 2>&1')
    " " let l:cmd = '!mplayer ' . l:api . ' > /dev/null 2>&1'
    " let l:cmd = '!mplayer ' . l:api 
    " echo l:cmd
    execute l:cmd
endfunction

function! LineTextToSpeech ()
    let string = getline(".")
    
    call TexttoSpeech(string)
endfunction

function! WordTextToSpeech ()
    " let string = expand("<cWORD>")
    call TexttoSpeech(expand("<cWORD>"))
endfunction

" https://stackoverflow.com/questions/17838700/vimscript-get-visual-mode-selection-text-in-mapping
" https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
fun! s:get_visual_selection()
   " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
 endfun

function! SelectedTTS ()
    " echo s:get_visual_selection()
    call TexttoSpeech(s:get_visual_selection())
endfunction

vnoremap <Leader>s :call SelectedTTS()<CR>
nnoremap <Leader>s :call WordTextToSpeech()<CR>
nnoremap <Leader>l :call LineTextToSpeech()<CR>

