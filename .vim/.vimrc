"  Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged') 
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align "Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' } 
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system

" For surrounding with quotes
Plug 'tpope/vim-surround'

" For commenting 
Plug 'tpope/vim-commentary'

" For . support with tpope plugins
Plug 'tpope/vim-repeat'

" For youcompleteme
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all'}

" For tab guidelines
Plug 'Yggdroot/indentLine'

" For the tables
Plug 'dhruvasagar/vim-table-mode'

" For speed
Plug 'easymotion/vim-easymotion'

" For syntax
Plug 'vim-syntastic/syntastic'

" For Python text objects Plug 'bps/vim-textobj-python'

" For language support
Plug 'sheerun/vim-polyglot'

" For Java dev
Plug 'artur-shaik/vim-javacomplete2'

" For git
Plug 'tpope/vim-fugitive'

" File drawer
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Fuzzy Finder
Plug 'ctrlpvim/ctrlp.vim'

" Live Browser Editing 
Plug 'jaxbot/browserlink.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" LaTeX
Plug 'lervag/vimtex'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview'

" Undo tree
Plug 'mbbill/undotree/'

" Python mode
Plug 'python-mode/python-mode'

" " Powerline
" Plug 'powerline/powerline'

" Tabline
Plug 'mkitt/tabline.vim'

" Jedi python
Plug 'davidhalter/jedi'

" Python style checker
Plug 'nvie/vim-flake8'

" \g will go to definition with this plugin
Plug 'davidhalter/jedi-vim'

" to navigate w/ tmux + vim
Plug 'christoomey/vim-tmux-navigator'

" C/C++ development
Plug 'JBakamovic/yavide'

" C/C++ autocomplete
Plug 'Rip-Rip/clang_complete'

" Class Outline Viewer
Plug 'majutsushi/tagbar'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Status bar
Plug 'vim-airline/vim-airline'

" Switch b/n source and header files quickly
" Plug '/vim-scripts/a.vim'

" Note taking, personal wiki
Plug 'vimwiki/vimwiki'

" Autoformat code
Plug 'Chiel92/vim-autoformat'

call plug#end()

"<>""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'

"============
"<> Multiple cursors
"============

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='g<C-n>'
let g:multi_cursor_prev_key='g<C-p>'
let g:multi_cursor_skip_key='g<C-x>'
let g:multi_cursor_quit_key='g<Esc>'
nnoremap <silent> g<M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> g<M-j> :MultipleCursorsFind <C-R>/<CR

" path to directory where library can be found
let g:clang_library_path='/usr/lib/llvm-5.0/lib'

" allows for backspaces to work properly
set backspace=indent,eol,start

"============
"<> TMUX
"============

" inoremap <silent>  <C-o>:TmuxNavigateLeft<CR>
" inoremap <silent> J <C-o>:TmuxNavigateDown<CR> 
" inoremap <silent> K <C-o>:TmuxNavigateUp<CR>
" inoremap <silent>  <C-o>:TmuxNavigateRight<CR>
let g:BASH_Ctrl_j = 'off'
nnoremap <silent>  :TmuxNavigateLeft<CR>
nnoremap <silent> J :TmuxNavigateDown<CR> 
nnoremap <silent> K :TmuxNavigateUp<CR>
nnoremap <silent>  :TmuxNavigateRight<CR>
nnoremap <silent> N :TmuxNavigatePrevious<CR>

" nnoremap <silent> H :TmuxNavigateLeft<CR>
" nnoremap <silent> J :TmuxNavigateDown<CR> 
" nnoremap <silent> K :TmuxNavigateUp<CR>
" nnoremap <silent> L :TmuxNavigateRight<CR>
" nnoremap <silent> N :TmuxNavigatePrevious<CR>

"<>

" Tmux maintains color
set background=dark
set t_Co=256

let g:tmux_navigator_no_mappings = 1

"============
"<> JAVA SUPPORT
"============

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

noremap <F3> :Autoformat<CR>

" to disable jedi-vim autocomplete for YCM, but allows jedi-vim's \g
" (assignments), \d (definitions), K (documentation), <leader>r rename,
" <leader>n shows all usages of a name, :Pyimport <module> opens module
let g:jedi#completions_enabled = 0

" IMPORTANT LINE, allows YCM to autocomplete
let g:jedi#force_py_version = 3

" YCM python interpreter
let g:ycm_server_python_interpreter = '/usr/bin/python3.5'
" For Python Semantic Completion w/ youcompleteme
let g:ycm_python_binary_path = '/usr/bin/python3'

" For vim-autoformat
let g:formatterpath = [ '/home/kevin/.vim/plugged/vim-flake8' ]

"============
"<> FOLDS
"============

" folds almost all indented lines 
set foldmethod=indent
nnoremap \m :set foldmethod=manual<CR>

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

"============
"<> SAVE STATES
"============

" Double trailing slashes in vim activates feature to avoid name collisions
" /path/one/foobar.txt --> %path%one%foobar.txt
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

if has("persistent_undo")
    set undodir=~/.vim/undo//
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
let g:UltiSnipsUsePythonVersion = 3
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

set cursorline
set ic          " Defaults ignore case when search

"============
"<> YCM MISC
"============

" <> PERSISTS SYSTEM CLIPBOARD ON EXIT
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" YCM shows completion menu typing inside comments
let g:ycm_complete_in_comments = 0
" YCM shows completion menu typing inside strings
let g:ycm_complete_in_strings = 1
" YCM collect ids from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" YCM seed ids with syntax
let g:ycm_seed_identifiers_with_syntax = 1
" YCM keeps log files after shutdown (1), not kept (0)
let g:ycm_keep_logfiles = 0
" YCM stop completion
let g:ycm_key_list_stop_completion = ['<C-y>']

"============
"<> NERDTREE
"============

nnoremap <silent>;nt :NERDTreeToggle<CR>
nnoremap <silent>;nf :NERDTreeFind<CR>

"<>

" Closes vim if only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" To open NERDTree automatically when vim starts up w/o any files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" To change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Auto delete buffer of file you just deleted with Nerd Tree
let NerdTreeAutoDeleteBuffer = 1

" Disable Press ? for help
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 0

"============
"<> EASY MOTION
"============

" map ;b <Plug>(easymotion-bl)
" map ;B <Plug>(easymotion-B)

" map ;e <Plug>(easymotion-el)
" map ;E <Plug>(easymotion-El)

" map ;ge <Plug>(easymotion-gel)
" map ;gE <Plug>(easymotion-gE)
" map ;Ge <Plug>(easymotion-bd-ge)
" nmap ;Ge <Plug>(easymotion-overwin-ge)

" " <Leader>f{char} to move to {char}
" map ;gf <Plug>(easymotion-bd-f)
" nmap ;gf <Plug>(easymotion-overwin-f)

" " 1 line s{char}{char} to move to {char}{char}
map g <Plug>(easymotion-fl2)
map G <Plug>(easymotion-Fl2)
" map f <Plug>(easymotion-overwin-f2)
" map f <Plug>(easymotion-bd-f2)
map f <Plug>(easymotion-overwin-f2)
map f <Plug>(easymotion-bd-f2)
map F <Plug>(easymotion-overwin-f)
map F <Plug>(easymotion-bd-f)
" " s{char}{char} to move to {char}{char}
" nmap j <Plug>(easymotion-overwin-f2)

" " Move to line
" " map ;l <Plug>(easymotion-bd-jk)
" " nmap ;l <Plug>(easymotion-overwin-line)

" " 1 line Move to word
" nmap ;w <Plug>(easymotion-wl)
" nmap ;W <Plug>(easymotion-W)
" " Move to word
" map  ;gw <Plug>(easymotion-bd-w)
" nmap ;gw <Plug>(easymotion-overwin-w)

" map ;r <Plug>(easymotion-s)
nmap . <Plug>(easymotion-next)
nmap , <Plug>(easymotion-prev)

"<>

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

"============
"<> MISC
"============

" Sets Incremental Search (Search while typing)
set incsearch

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
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

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

let mapleader = '\' 

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

let g:netrw_banner=0 "disable annoying banner 
let g:netrw_browse_split=4 "open in prior window 
let g:netrw_altv=1 "open splits to the right 
let g:netrw_liststyle=3 "tree view 
let g:netrw_list_hide=netrw_gitignore#Hide() 
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

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

" Make vimwiki as markdown
" let g:vimwiki_list = [{'path': '~/my_site/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

"============
"<> CUSTOM MAPS
"============

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>

nnoremap <silent> [<space>  :<c-u>put!=repeat([''],v:count)<bar>']+1<cr>
nnoremap <silent> ]<space>  :<c-u>put =repeat([''],v:count)<bar>'[-1<cr>

inoremap kj <esc>
nnoremap <CR> i<CR><Esc>
" For managing tabs nnoremap tc :tabclose<CR> nnoremap ti :tabnew<Space> nnoremap tn :tabnext<CR> nnoremap tp :tabprev<CR> nnoremap tf :tabfirst<CR> nnoremap tl :tablast<CR>

nnoremap <leader>ti :tabnew 
nnoremap <leader>tn :tabe 

" For moving lines around

" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Clear Search Highlights

set hlsearch
nnoremap <C-Space> :nohl<CR>

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
inoremap <s-b> <c-o><s-b>
inoremap o <c-o>:so %<CR>

if has('nvim')
    inoremap <A-s> <c-o>:w<CR>
    nnoremap <A-s> :w<CR>
else
    inoremap s <c-o>:w<CR>
    nnoremap s :w<CR>
endif

" to delete without backspace :)
inoremap x <backspace>
nnoremap o :so %<CR>
" nnoremap  :hid<CR>
inoremap o 

nnoremap l :ls<CR>:b 

