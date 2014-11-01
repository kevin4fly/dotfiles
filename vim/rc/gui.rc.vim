" GUI

" Menu:"{{{1

" hide toolbar and menus.
set guioptions-=tT
set guioptions-=m
" scrollbar is always off.
set guioptions-=rL
" not guitablabel.
set guioptions-=e

" confirm without window.
set guioptions+=c

" Views:"{{{

" don't highlight search result.
set nohlsearch

" don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

" font&color
highlight PmenuSel        guifg=red guibg=black gui=bold
highlight Comment                               gui=italic

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
