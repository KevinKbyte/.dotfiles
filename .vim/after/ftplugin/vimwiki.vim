" Insert date and time
inoremap ;insd <C-o>:pu=strftime('%b-%d-%Y')<CR>
nnoremap ;insd :pu=strftime('%b-%d-%Y')<CR>
inoremap <TAB> <C-t>
inoremap <S-TAB> <C-d>
nmap <space><space>j <C-E>:sleep 500m<CR>j<space><space>j
nmap <space><space>k <C-E>:sleep 1m<CR>j<space><space>k

" Getting Word count
function! GetCountsForCurrLine ()
    let string = getline(".")
    let l:cmd = '!echo "' . string . '" | wc'
    execute l:cmd
endfunction

nnoremap <leader>wc :call GetCountsForCurrLine()<CR>
nnoremap <C-i> <C-i>
