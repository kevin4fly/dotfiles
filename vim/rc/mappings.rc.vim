" mappings

" set map leader for easy combination
let mapleader   = ","
let g:mapleader = ","

" fast saving
nnoremap <leader>w :w!<cr>
" fast reloading the .vimrc
nnoremap <silent> <leader>vv :source ~/.vimrc<cr> \|
                           \ :filetype detect<cr> \|
                           \ :execute ":echo 'vimrc reloaded'"<cr>
" fast editing the .vimr
nnoremap <silent> <leader>v :e ~/.vimrc<cr>
" reload the .vimrc automatically if it is modified
autocmd! bufwritepost .vimrc source ~/.vimrc

" goto command line mode
nnoremap <leader><leader> :
vnoremap <leader><leader> :

" mapping jj to esc on insert/command/operator-pending mode
noremap! jj <c-c>
onoremap jj <ESC>

" mapping c-a to the beginning of command line to align with bash
cnoremap <c-a> <c-b>

" remap vim 0 to first non-blank character
nnoremap 0 ^
nnoremap H ^
nnoremap L $

" treat long lines as break lines
nnoremap j gj
nnoremap k gk
" easy move around in insert and command mode
inoremap <expr><c-j>    pumvisible() ? "\<c-n>" : "\<down>"
inoremap <expr><c-k>    pumvisible() ? "\<c-p>" : "\<up>"
inoremap <expr><c-l>    pumvisible() ? "\<c-y>" : "\<right>"
inoremap <expr><Enter>  pumvisible() ? "\<c-y>" : "\<Enter>"
cnoremap <c-l> <right>
inoremap <c-h> <left>
cnoremap <c-h> <left>

" move word backward like normal mode
inoremap <c-b> <esc>bi
" delete a char in insert and command mode
noremap! <c-f> <bs>
" kill line
cnoremap <c-k> <c-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<cr>

" consistent with readline
inoremap <c-a> <ESC>I
inoremap <c-e> <ESC>A
inoremap <c-o> <ESC>o

" for easy search
nnoremap <leader>/ ?

" uniform copy
nnoremap Y y$

" select all text in normal mode
nnoremap <c-a> ggVG
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
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap n nzzzv
nnoremap N Nzzzv

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

" reload the file(log files may be changed outside)
nnoremap <leader>rr :edit<cr> \|
                 \  :exe ":echo '<c-r>% reloaded'"<cr>

" compile source code
nnoremap <F5> :w<cr> \|
            \ :make<cr>

" write the file to disk even if we forget to 'sudo'
nnoremap <silent> <leader>so :w !sudo tee % >/dev/null<cr>

" autoload man.vim
"autocmd bufreadpost,bufnewfile *.c,*.h,*.cpp,*.sh runtime! ftplugin/man.vim
runtime! ftplugin/man.vim
autocmd filetype * nnoremap <silent> K :Man <cword><cr>

" new vertical split file put to right
"set splitright
" show this kinds of file on the right side
" set the local buftype to help to golden view plugin
autocmd filetype help,man,qf wincmd L       |
                  \ if &filetype=='man'     |
                  \   setlocal buftype=help |
                  \ endif

" show grep result
autocmd QuickFixCmdPost *grep* cwindow

" cindent is a bit too smart for its own good and triggers in text files when
" you're typing inside parens and then hit enter; it aligns the text with the
" opening paren and we do NOT want this in text files!
autocmd filetype text,markdown,gitcommit set nocindent
autocmd filetype markdown,gitcommit setlocal spell! spelllang=en_us

" set the filetype to sh for bash file
autocmd filetype bash set filetype=sh

" prevent vim from interpreting Makefile as a modeline
autocmd filetype make set modelines=0

" mapping to vimgrep
nnoremap <leader><space> :vimgrep /

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
