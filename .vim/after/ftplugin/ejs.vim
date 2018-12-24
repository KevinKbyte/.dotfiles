" https://stackoverflow.com/questions/5826192/how-can-i-edit-my-vim-config-so-that-vim-treats-ejs-files-the-same-as-it-curr
if has("autocmd")
    au BufRead,BufNewFile *.ejs setfiletype html
endif

" for snippets to work with specified portion of ejs
nnoremap <leader>js :set filetype=js<CR>
nnoremap <leader>ht :set filetype=html<CR>

inoremap <% <%  %><c-o>2h
