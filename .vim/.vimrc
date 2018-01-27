"  Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged') 
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

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
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --all' }

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
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Undo tree
Plug 'mbbill/undotree/'

" Python mode
Plug 'python-mode/python-mode'

" Powerline
Plug 'powerline/powerline'

" Tabline
Plug 'mkitt/tabline.vim'

" Jedi python
Plug 'davidhalter/jedi'

" Python style checker
Plug 'nvie/vim-flake8'

" \g will go to definition with this plugin
Plug 'davidhalter/jedi-vim'
call plug#end()

"<>""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" to disable jedi-vim autocomplete for YCM, but allows jedi-vim's \g
" (assignments), \d (definitions), K (documentation), <leader>r rename,
" <leader>n shows all usages of a name, :Pyimport <module> opens module
let g:jedi#completions_enabled = 0

" IMPORTANT LINE, allows YCM to autocomplete
let g:jedi#force_py_version = 3

" au BufNewFile,BufRead *.js, *.html, *.css
"     \ set tabstop=2
"     \ set softtabstop=2
"     \ set shiftwidth=2


" folds almost all indented lines 
set foldmethod=indent
nnoremap \m :set foldmethod=manual<CR>

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave ?* mkview
  autocmd BufWinEnter ?* silent loadview
augroup END

" use f0 instead of f1 to stop viminfo from saving marks and jumps
" Saves for up to 100 files
set viminfo='100,f1

" Undo tree activate!
nnoremap ;u :UndotreeToggle<CR>

" Disable LaTeX-Box for vimtex
let g:polyglot_disabled = ['latex']

" Ultisnips python v3
let g:UltiSnipsUsePythonVersion = 3
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<C-b>'

set cursorline
set ic          " Defaults ignore case when search

" YCM shows completion menu typing inside comments
let g:ycm_complete_in_comments = 0
" YCM shows completion menu typing inside strings
let g:ycm_complete_in_strings = 1
" YCM collect ids from strings and comments
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" YCM seed ids with syntax
let g:ycm_seed_identifiers_with_syntax = 1
" YCM python interpreter
let g:ycm_server_python_interpreter = '/usr/bin/python3.5'
" YCM keeps log files after shutdown (1), not kept (0)
let g:ycm_keep_logfiles = 0
" YCM stop completion
let g:ycm_key_list_stop_completion = ['<C-y>']

" For Python Semantic Completion w/ youcompleteme
let g:ycm_python_binary_path = '/usr/bin/python3'

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

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

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

" SNIPPETS: " Read an empty HTML template and move cursor to title 
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" BUILD INTEGRATION: " Steal Mr. Bradley's formatter & add it to our spec_helper " http://philipbradley.net/rspec-into-vim-with-quickfix "
" Configure the 'make' command to run RSpec set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter  
" NOW WE CAN:
" - Run :make to run RSpec - :cl to list errors
" - :cc# to jump to error by number - :cn and :cp to navigate forward and back

set showcmd
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>

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

" EASY MOTION
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map c <Plug>(easymotion-bd-f)
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
map f <Plug>(easymotion-fl2)
map F <Plug>(easymotion-Fl2)
map g <Plug>(easymotion-f2)
map G <Plug>(easymotion-F2)
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
nmap <Leader>\ <Plug>(easymotion-next)
nmap <Leader>] <Plug>(easymotion-prev)

" Allows for moving around wrapped lines seamlessly
" nnoremap j gj
" nnoremap k gk

" to allow for alt + w to work in insert mode, because it's not working for
" some reason
inoremap w <c-o>w
inoremap $ <c-o>$
inoremap ^ <c-o>^
inoremap l <c-o>l
inoremap h <c-o>h
inoremap e <c-o>e
inoremap <s-e> <c-o><s-e>
inoremap j <c-o>j
inoremap <s-j> <c-o><s-j>
inoremap ge <c-o>g<c-o>e
inoremap k <c-o>k
inoremap i <esc>
inoremap . <c-o>.
inoremap b <c-o>b
inoremap <s-b> <c-o><s-b>
inoremap s <c-o>:w<CR>
inoremap o <c-o>:so %<CR>
" to delete without backspace :)
inoremap x <backspace>
nnoremap s :w<CR>
nnoremap o :so %<CR>
nnoremap  :hid<CR>
inoremap o 

nnoremap <silent><C-n> :NERDTreeToggle<CR>
nnoremap <silent><C-S-n> :NERDTreeFind<CR>

nnoremap l :ls<CR>:b

