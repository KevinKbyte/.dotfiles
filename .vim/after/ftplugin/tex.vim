let g:tex_conceal = ""

"https://tex.stackexchange.com/questions/81958/using-vim-latex-live-preview-with-minted-package
let g:Tex_DefaultTargetFormat='pdf'
let g:vimtex_compiler_enabled = 0

inoremap g$ <Esc>f$F$ci$
nmap <leader>im f$ci$
nmap <leader>iM F$ci$

" https://stackoverflow.com/questions/5010162/if-existscommand-fails-on-startup-using-pathogen
" Since this is sourced before the plugins, we can't check with if exists()
"arbitrary code execution if --shell-escape enabled by default

nnoremap a :AsyncRun pdflatex --shell-escape %<CR>:w<CR>
inoremap a <C-o>:AsyncRun pdflatex --shell-escape %<CR><C-o>:w<CR>

if has("nvim")
    nnoremap <M-S> :LLPStartPreview<CR>
else
    nnoremap S :LLPStartPreview<CR>
endif

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
setlocal complete+=k
setlocal dictionary+=/home/kevin/.dotfiles/.vim/dictionaries/tex
setlocal iskeyword+=-

inoremap $ $$<Esc>i
inoremap $ <nop>

" inoremap <C-a> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
" inoremap <C-a> <C-R>=g:ulti_expand_or_jump_res<CR>

" https://github.com/lervag/vimtex/issues/931
" Autocomplete Latex with vimtex

if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" let g:ycm_semantic_triggers.tex=['re!\\[A-Za-z]+',
"   \ 're!\\(usepackage|RequirePackage)(\s*\[[^]]*\])?\s*\{[^}]*',
"   \ 're!\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
"   \ 're!\\begin(\s*\[[^]]*\])?\s*\{[^}]*',
"   \ 're!\\end(\s*\[[^]]*\])?\s*\{[^}]*',
"   \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
"   \ 're!\\(text|block)cquote\*?(\[[^]]*\]){0,2}{[^}]*',
"   \ 're!\\(for|hy)[A-Za-z]*cquote\*?{[^}]*}(\[[^]]*\]){0,2}{[^}]*',
"   \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
"   \ 're!\\hyperref\[[^]]*',
"   \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
"   \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
"   \ 're!\\(include(only)?|input|subfile){[^}]*',
"   \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
"   \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*']
