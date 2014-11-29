" GUI

" Menu:"{{{1

" hide toolbar and menus.
set guioptions-=tT
set guioptions-=m
set guioptions-=g
" scrollbar is always off.
set guioptions-=rL
" not guitablabel.
set guioptions-=e
" not vim icon
set guioptions-=i

" confirm without window.
set guioptions+=c

" Views:"{{{1

" don't highlight search result.
set nohlsearch

" don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

" font&color
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
" set guifont=Inconsolata-dz\ for\ Powerline\ 10.5
highlight PmenuSel        guifg=red guibg=black gui=bold
highlight Comment                               gui=italic

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
