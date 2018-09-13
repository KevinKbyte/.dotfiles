let g:tex_conceal = ""

nnoremap S :LLPStartPreview<CR>

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
setlocal complete+=k
setlocal dictionary+=/home/kevin/.dotfiles/.vim/dictionaries/tex
setlocal iskeyword+=-
