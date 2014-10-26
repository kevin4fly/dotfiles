" buffer, window and tab

" hidden buffer when it is abandoned instead of unload from memory
set hidden

" move to next buffer
nnoremap <silent> <c-k> :bnext<cr>
" nove to previous buffer
nnoremap <silent> <c-j> :bprevious<cr>
" delete buffer without closing windows, we have bbye plugin
" refer to plugins.rc.vim

" quit windows without saving
nnoremap <silent> <leader>x :quit!<cr>
" close tab or window
nnoremap <silent> <leader>z :close<cr>
" save all the files and then quit
nnoremap <silent> <leader>ca :wqa!<cr>

" remember info about open buffers on close
"set viminfo^=%

" useful mappings for managing tab and window
" new tab
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <c-w>t :tabnew<cr>
" new window
nnoremap <silent> <leader>vn :vnew<cr>
nnoremap <silent> <c-w>\| :vnew<cr>
nnoremap <silent> <c-w>- :new<cr>
" new buffer
nnoremap <silent> <leader>en :enew<cr>
nnoremap <silent> <c-w>b :enew<cr>
" tab only
nnoremap <silent> <leader>to :tabonly<cr>
" tab next/previous
nnoremap <silent> <c-h> :tabprevious<cr>
nnoremap <silent> <c-l> :tabnext<cr>
" window only
nnoremap <leader>wo :only<cr>
" tab close
"nnoremap <leader>tc :tabclose<cr>

" switch cwd to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" open help text
nnoremap <silent> <leader>h :help<cr>

" return to last edit position when opening files (you want this!)
autocmd bufreadpost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   execute "normal! g`\""                       |
            \ endif

" auto wipe out empty buffers
autocmd bufhidden * call CleanEmptyBuffers()

function! CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) &&
              \ empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'Bd '.join(buffers, ' ')
  endif
endfunction

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker