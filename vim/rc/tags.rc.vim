" tags and cscope

" generating tags in current directory
nnoremap <silent> <leader>o
                \ :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" adding tags in current directory or above and in all subdirectories
set tags=./tags,tags;

" adding tags in /usr/include for system API using
autocmd filetype c,cpp set tags+=/usr/include/tags

" adding tags in /lib/modules/$(uname -r)/build/include/linux
" for modules API using
autocmd filetype c,cpp,h
    \ set tags+=/lib/modules/2.6.32-38-generic/build/include/linux/tags

" mapping for generating cscope files
nnoremap <c-F11> :!cscope -Rbkq<cr>
if has("cscope")
  "set the cscope location
  set csprg=/usr/bin/cscope
  "set the search order: tags file is searched first, followed by cscope database
  set csto=1
  "use :cstag instead of the default :tag behavior
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  "show the successful or failure massage when adding the cscope database
  set csverb
endif

" mapping for cscope
nnoremap <c-\>s :cs find s <c-r>=expand("<cword>")<cr><cr>
nnoremap <c-\>g :cs find g <c-r>=expand("<cword>")<cr><cr>
nnoremap <c-\>c :cs find c <c-r>=expand("<cword>")<cr><cr>
nnoremap <c-\>t :cs find t <c-r>=expand("<cword>")<cr><cr>
nnoremap <c-\>e :cs find e <c-r>=expand("<cword>")<cr><cr>
nnoremap <c-\>f :cs find f <c-r>=expand("<cfile>")<cr><cr>
nnoremap <c-\>i :cs find i ^<c-r>=expand("<cfile>")<cr>$<cr>
nnoremap <c-\>d :cs find d <c-r>=expand("<cword>")<cr><cr>

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker