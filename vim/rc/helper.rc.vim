" helper functions

" strip trailing white space except markdown file{{{1
function! StripTrailingWhitespace()
  " don't strip on these filetypes
  if &ft =~ 'markdown'
    return
  endif
  %s/\s\+$//e
endfunction

autocmd VimConfig bufwritepre,filewritepre *
      \ if &modifiable |
      \    call StripTrailingWhitespace() |
      \ endif

" macro expansion with gcc{{{1
" we have to install gnu indent programme, refer to
" http://vim.wikia.com/wiki/Macro_expansion_C/C%2B%2B for more details
function! ExpandCMacro()
  "get current info
  let l:macro_file_name = "__macroexpand__" . tabpagenr()
  let l:file_row        = line(".")
  let l:file_name       = expand("%")
  let l:file_window     = winnr()
  "create mark
  execute "normal! Oint " . l:macro_file_name . ";"
  execute "w"
  "open tiny window ... check if we have already an open buffer for macro
  if bufwinnr( l:macro_file_name ) != -1
    execute bufwinnr( l:macro_file_name) . "wincmd w"
    setlocal modifiable
    execute "normal! ggdG"
  else
    execute "bot 10split " . l:macro_file_name
    execute "setlocal filetype=cpp"
    execute "setlocal buftype=nofile"
    nnoremap <silent> <buffer> q :silent bd!<cr>
  endif
  "read file with gcc
  silent! execute "r!gcc -E " . l:file_name
  "keep specific macro line
  execute "normal! ggV/int " . l:macro_file_name . ";$\<cr>d"
  execute "normal! jdG"
  "indent
  execute "%!indent -st -kr"
  execute "normal! gg=G"
  "resize window
  execute "normal! G"
  let l:macro_end_row = line(".")
  execute "resize " . l:macro_end_row
  execute "normal! gg"
  "no modifiable
  setlocal nomodifiable
  "return to origin place
  execute l:file_window . "wincmd w"
  execute l:file_row
  execute "normal!u"
  execute "w"
  "highlight origin line
  let @/ = getline('.')
endfunction

autocmd VimConfig filetype c,cpp nnoremap <leader>m
      \ :call ExpandCMacro()<cr>

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
