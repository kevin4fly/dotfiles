" tags and cscope

" generating tags in current directory
nnoremap <silent> <leader>o
  \ :!ctags -R --sort=foldcase --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
" use tags file in directory of current file: ./tags
" and search tags file upward untile a tags file found or searched to root
" directory
" Note: the difference between currect directory returned by :pwd and
" directory of current file/buffer. for most time, of course, we want to
" search the tags file of the current buffer which sometimes isn't equal to
" current directory
set tags=./tags,tags;

" set tags for the standard C library libc6
autocmd VimConfig filetype c,h setlocal tags+=~/.vim/tags/libc6

" set tags for the standard C++ library libc6-4.7-dev
" autocmd VimConfig filetype cpp,hpp setlocal tags+=~/.vim/tags/stdlibcpp6-4.7-dev

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
