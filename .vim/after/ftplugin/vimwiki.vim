" Insert date and time
inoremap ;insd <C-r>=strftime('%b-%d-%Y')<CR>
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
