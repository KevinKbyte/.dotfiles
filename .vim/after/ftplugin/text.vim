" autocmd VimEnter * inoremap <tab> <C-t>

" Allows for moving around wrapped lines seamlessly
inoremap k <c-o>gk
inoremap j <c-o>gj

nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^
nnoremap ,k I<><Esc>

" " folds almost all indented lines and allows manual
set foldmethod=indent

