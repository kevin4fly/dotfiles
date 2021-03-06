" mappings

" set map leader for easy combination
let g:mapleader = ","

" fast saving
nnoremap <leader>w :w!<cr>
nnoremap <leader>wa :wall!<cr>
" fast reloading the .vimrc
nnoremap <silent> <leader>vv :source $MYVIMRC<cr> \|
                           \ :filetype detect<cr> \|
                           \ :redraw<cr>          \|
                           \ :execute 'echo $MYVIMRC . " reloaded"'<cr>
" fast editing the .vimrc
nnoremap <silent> <leader>ee :e $MYVIMRC<cr>
" reload the .vimrc automatically if it is modified
" autocmd VimConfig bufwritepost .vimrc,*.rc.vim
"       \ source $MYVIMRC | filetype detect | redraw | echo $MYVIMRC "autoloaded"

" mapping jj to esc on insert/command/operator-pending mode
noremap! jj <c-c>
onoremap jj <ESC>

" mapping c-a to the beginning of command line to align with bash
cnoremap <c-a> <c-b>

" remap vim 0 to first non-blank character
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_

" treat long lines as break lines
nnoremap j gj
nnoremap k gk
" easy move around in insert and command mode
inoremap <expr><c-j>    pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr><c-k>    pumvisible() ? "\<c-p>" : "\<up>"
inoremap <expr><Enter>  pumvisible() ? "\<c-y>" : "\<Enter>"
inoremap <c-o> <c-o>D
inoremap <expr><c-l>    pumvisible() ? "\<c-y>"  : "\<right>"
cnoremap <c-l> <right>
noremap! <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>

" delete a char backward/forward in insert and command mode
noremap! <c-b> <del>
noremap! <c-f> <bs>
snoremap <c-f> <bs>i
" kill line from the current position to the last
cnoremap <c-o> <c-\>e getcmdpos() == 1 ? '' : getcmdline()[:getcmdpos()-2]<cr>
" kill the whole line
cnoremap <c-x> <c-\>e ''<cr>

" consistent with readline
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
inoremap <c-n> <esc>o
" delete the whole line in insert mode, however <c-x> is used to trigger
" insert-completion
" inoremap <c-x> <esc>0C

" backspace to delete character
nnoremap <bs> X

" uniform copy
nnoremap Y y$

" select all text in normal mode (we have textobj_entire)
" nnoremap <c-a> ggVG
" utilize '+' register to handle copy and paste on system clipboard
" copy text in visual mode
vnoremap <c-c> "+y
" paste text in insert/command mode
cnoremap <c-v> <c-r>+
inoremap <c-v> <c-r><c-p>+

" format the text in normal and visual mode
nnoremap Q gq
vnoremap Q gq

" keep search matches in the middle of the window.
" zz centers the screen on the cursor, zv unfolds any fold if the cursor
" suddenly appears inside a fold.
" replaced by the incsearch/anzu plugins
" nnoremap * *zzzv
" nnoremap # #zzzv
" nnoremap n nzzzv
" nnoremap N Nzzzv

" keep jump point in central position of the screen
nnoremap <silent> <c-]> <c-]>zzzv
nnoremap <silent> <c-i> <c-i>zzzv
nnoremap <silent> <c-o> <c-o>zzzv

" these create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j
nnoremap <silent> zh X
nnoremap <silent> zl i <Esc>

" open quickfix windows and list the errors
" skip to next item in qf list
nnoremap <silent>]e :cn<cr>
" skip to previous item in qf list
nnoremap <silent>[e :cp<cr>

" swap jump command
nnoremap ]] ][
nnoremap ][ ]]

" reload the file(log files may be changed outside)
nnoremap <leader>rr :edit<cr> \|
                  \ :execute "echo '<c-r>% reloaded'"<cr>

" compile source code
nnoremap <F5> :w<cr> \|
            \ :make<cr>

" write the file to disk even if we forget to 'sudo'
nnoremap <silent> <leader>so :w !sudo tee % >/dev/null<cr>

" autoload man.vim
" autocmd VimConfig bufreadpost,bufnewfile *.c,*.h,*.cpp,*.sh runtime! ftplugin/man.vim
runtime! ftplugin/man.vim
nnoremap <silent> K :Man <cword><cr>

" autoload matchit.vim
runtime! macros/matchit.vim

" mapping to vimgrep
nnoremap <leader><space> :vimgrep /

" mapping to shell
if executable('gnome-terminal')
  nnoremap <leader>sh :!gnome-terminal&<cr>
else
  nnoremap <leader>sh :shell<cr>
endif

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
