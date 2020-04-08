" Insert date time for entry
imap ;insD d-<C-r>=strftime('%b-%d-%Y')<CR><Esc>"ayiW<CR><CR>"ap=o<CR>

" Insert date and time
inoremap ;insd <C-r>=strftime('%b-%d-%Y')<CR>

" Creates a new file with name and date
imap ;inst -<C-r>=strftime('%b-%d-%Y')<CR><Esc>"ayiW<CR><CR>"ap=o<CR>
" imap ;inst <C-r>=strftime('%b-%d-%Y')<CR><Esc><CR><CR>

inoremap ;st Start Time: <C-r>=strftime('%b-%d-%Y-%T')<CR>
inoremap ;ed End Time: <C-r>=strftime('%b-%d-%Y-%T')<CR>
" nnoremap ;insd :pu=strftime('%b-%d-%Y')<CR>
" inoremap <TAB> <C-t>
" inoremap <S-TAB> <C-d>
nmap <space><space>j <C-E>:sleep 500m<CR>j<space><space>j
nmap <space><space>k <C-E>:sleep 1m<CR>j<space><space>k

" Getting Word count
function! GetCountsForCurrLine ()
    let string = getline(".")
    let l:cmd = '!echo "' . string . '" | wc'
    execute l:cmd
endfunction
"
nnoremap <leader>alf o# a<CR><CR># b<CR><CR># c<CR><CR># d<CR><CR># e<CR><CR># f<CR><CR># g<CR><CR># h<CR><CR># i<CR><CR># j<CR><CR># k<CR><CR># l<CR><CR># m<CR><CR># n<CR><CR># o<CR><CR># p<CR><CR># q<CR><CR># r<CR><CR># s<CR><CR># t<CR><CR># u<CR><CR># v<CR><CR># w<CR><CR># x<CR><CR># y<CR><CR># z<Esc>
nnoremap <leader>Alf o# A<CR><CR># B<CR><CR># C<CR><CR># D<CR><CR># E<CR><CR># F<CR><CR># G<CR><CR># H<CR><CR># I<CR><CR># J<CR><CR># K<CR><CR># L<CR><CR># M<CR><CR># N<CR><CR># O<CR><CR># P<CR><CR># Q<CR><CR># R<CR><CR># S<CR><CR># T<CR><CR># U<CR><CR># V<CR><CR># W<CR><CR># X<CR><CR># Y<CR><CR># Z<Esc>

nnoremap <leader>wc :call GetCountsForCurrLine()<CR>
vnoremap <leader>wc :call GetCountsForCurrLine()<CR>
nnoremap <C-i> <C-i>

nnoremap <leader>rs :AsyncRun rsync -Pcr ~/vimwiki ~/mnt/gdrive/linux<CR>
nnoremap <leader>ps :AsyncRun pwgen 15 1 --symbols \| xclip -selection clipboard<CR>
nnoremap <leader>pn :AsyncRun pwgen 15 1 \| xclip -selection clipboard<CR>
" set foldmethod=indent

noremap gl* :VimwikiChangeSymbolTo *<CR>
noremap gL* :VimwikiChangeSymbolInListTo *<CR>
vnoremap gl* :VimwikiChangeSymbolTo *<CR>
vnoremap gL* :VimwikiChangeSymbolInListTo *<CR>

" noremap gla :VimwikiChangeSymbolTo a)<CR>
" noremap glA :VimwikiChangeSymbolInListTo a)<CR>
" vnoremap gla :VimwikiChangeSymbolTo a)<CR>
" vnoremap glA :VimwikiChangeSymbolInListTo a)<CR>

" vnoremap gl1 :s/^\s*\zs/\=(line('.') - line("'<")+1).'. '<CR>
