setlocal expandtab
setlocal shiftwidth=4
setlocal shiftwidth=4
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix
set encoding=utf-8

" https://stackoverflow.com/questions/1747091/how-do-you-use-vims-quickfix-feature
" :copen " Open the quickfix window
" :ccl   " Close it
" :cw    " Open it if there are "errors", close it otherwise (some people prefer this)
" :cn    " Go to the next error in the window
" :cnf   " Go to the first error in the next file
nnoremap <leader>cn :cn<CR>
nnoremap <leader>cf :cnf<CR>
nnoremap <leader>pl :call flake8#Flake8()<CR>


" " folds almost all indented lines and allows manual
" set foldmethod=indent

" inoremap . .<c-o>a

let mapleader = ' ' 
" PYMODE
let ropevim_vim_completion=0

" Show documentation for current word (selection)
let g:pymode_doc_bind = 'K'

" Runs code
let g:pymode_run_bind = '<leader>r'

" Set breakpoint
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Check code on every save (every) (0)
let g:pymode_lint_unmodified = 0

" Default code checkers
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']

" Pymode Lint on every save
let g:pymode_lint_on_write = 1

" AutoImport for element under cursor
let g:pymode_rope_autoimport = 0
let g:pymode_rope_autoimport_bind = '<leader>i'
nnoremap <leader>mtp :PymodeRopeModuleToPackage<CR>
" Open new Rope project in current working directory
nnoremap <leader>np :PymodeRopeNewProject<CR>
" Open new Rope project in [path]
nnoremap <leader>nP :PymodeRopeNewProject 
" Redo changes from last refactoring
nnoremap <leader>r :PymodeRopeRedo<CR>
" " Regenerate project cache
nnoremap <leader>pc :PymodeRopeRegenerate<CR>
" Rename current module
nnoremap <leader>rm :PymodeRopeRenameModule<CR>
" Undo changes from last refactoring
nnoremap <leader>u :PymodeRopeUndo<CR>

" show documentation for object under cursor
let g:pymode_rope_show_doc_bind = '<leader>d'

" Turn off code completion support for plugin (0)
let g:pymode_rope_completion = 0

" Turn on autoimport
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime', 'numpy']

" Go definition
let g:pymode_rope_goto_definition_bind = '<leader>gd'

" Rename method/fn/class/var under cursor
let g:pymode_rope_rename_bind = '<leader>rb'

let g:pymode_rope_completion_bind = '<C-Space>'

" Imports with Vimpy
nnoremap <leader>ip :VimpyCheckLine<CR>

" On exit, sorts imports
" autocmd VimLeave *.py :Isort<CR>
" https://stackoverflow.com/questions/36322321/how-do-i-check-if-ive-been-run-in-read-only-mode-r-in-vimrc?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa

autocmd BufReadPost *.py
    \  if &noreadonly
    \|  nnoremap ZZ :Isort<CR>ZZ
    \| endif

" https://realpython.com/vim-and-python-a-match-made-in-heaven/
"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  if sys.version_info[0] < 3: # python2
    execfile(activate_this, dict(__file__=activate_this))
  else:
    # exec(compile(open(filename, "rb").read(), filename, 'exec'), globals, locals)
    exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF
