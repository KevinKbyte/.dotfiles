nnoremap <leader>cp :!g++ -o %:r % -Wall -Wextra -Werror && ./%:r<CR>

" Extra Conf Path Config
let g:ycm_global_ycm_extra_conf = '/home/kev/.dotfiles/.ycm_extra_conf.py'

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_add_preview_to_completeopt = 1
