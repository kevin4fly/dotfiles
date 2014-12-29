" buffer, window and tab

" move to next buffer
nnoremap <silent> <c-k> :bnext<cr>
" nove to previous buffer
nnoremap <silent> <c-j> :bprevious<cr>
" delete buffer without closing windows, we have bbye plugin
" refer to plugins.rc.vim

" quit window or tab with buffer saved
" nnoremap <silent> <c-w>q    :quit<cr>
nnoremap <silent> <leader>q  :quit<cr>
" nnoremap <silent> <leader>z  :quit<cr>
nnoremap <silent> <c-q>      :quit<cr>
" save all the files and then quit
nnoremap <silent> <leader>ca    :wqa<cr>
nnoremap <silent> <leader><c-q> :wqa<cr>
nnoremap <silent> <c-w><c-q>    :wqa<cr>
" quit all windows and tabs forcely even if they are not saved
nnoremap <silent> <leader>Q  :qall!<cr>
nnoremap <silent> <leader>X  :qall!<cr>
nnoremap <silent> <c-w>Q     :qall!<cr>
nnoremap <silent> <c-w>X     :qall!<cr>

" close help docs with q
autocmd VimConfig filetype help nnoremap <silent> q :close<cr>

" remember info about open buffers on close
"set viminfo^=%

" useful mappings for managing tab and window
" new tabpage
nnoremap <silent> <c-w>p :tabnew<cr>
" new window
nnoremap <silent> <c-w>v :vnew<cr>
nnoremap <silent> <c-w>s :new<cr>:wincmd J<cr>
" new buffer
nnoremap <silent> <c-w>f :enew<cr>
" tab only
nnoremap <silent> <leader>to :tabonly<cr>
" tab next/previous
nnoremap <silent> <c-h> :tabprevious<cr>
nnoremap <silent> <c-l> :tabnext<cr>
" swap tabs
nnoremap <silent> <c-w>[ :tabmove -1<cr>
nnoremap <silent> <c-w>] :tabmove +1<cr>

" switch cwd to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" return to last edit position when opening files (you want this!)
autocmd VimConfig bufreadpost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   execute "normal! g`\""                       |
      \ endif

" auto wipe out empty buffers
autocmd VimConfig bufhidden * call CleanEmptyBuffers()

function! CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) &&
              \ empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'Bd '.join(buffers, ' ')
  endif
endfunction

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
