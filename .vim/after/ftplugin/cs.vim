vmap \em :call ExtractMethod()<CR>
function! ExtractMethod() range
  let name = inputdialog("Name of new method:")
  '<
  exe "normal! O\<BS>private " . name ."()\<CR>{\<Esc>"
  '>
  exe "normal! oreturn ;\<CR>}\<Esc>k"
  s/return/\/\/ return/ge
  normal! j%
  normal! kf(
  exe "normal! yyPi// = \<Esc>wdwA;\<Esc>"
  normal! ==
  normal! j0w
endfunction

"Create property
imap <C-c><C-p><C-s> <Esc>:call CreateProperty("string")<CR>a
imap <C-c><C-p><C-i> <Esc>:call CreateProperty("int")<CR>a
function! CreateProperty(type)
  exe "normal bim_\<Esc>b\"yywiprivate ".a:type." \<Esc>A;\<CR>public ".a:type.
        \ " \<Esc>\"ypb2xea\<CR>{\<Esc>oget\<CR>{\<CR>return " .
        \ "\<Esc>\"ypa;\<CR>}\<CR>set\<CR>{\<CR>\<Tab>\<Esc>\"yPa = value;\<CR>}\<CR>}\<CR>\<Esc>"
  normal! 12k2wi
endfunction

"Create abstract class
imap <C-c><C-a><C-c> <Esc>bipublic abstract class <Esc>A<CR>{<CR>public abstract void X();<CR>}<Esc>:?X<CR>0fXs
"Create concrete class
map <C-c><C-c><C-c> :silent! call ImplementAbstractClass()<CR>
function! ImplementAbstractClass() range
  exe "normal \<Esc>\"yyw"
  /{
  normal "xy%
  normal %o
  exe "normal! \<Esc>o"
  let name = inputdialog("Name of new method:")
  exe "normal! ipublic class " .name." : \<Esc>\"yp\"xp"
  exe "normal! }O}\<Esc>=="
  normal %v%
  normal! gv
  '<,'>s/abstract/override/g
  normal! gv
  '<,'>s/;/\r{\r}\r/g
  normal! ==
  normal %kdd%k
endfunction
