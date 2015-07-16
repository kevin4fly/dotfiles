" GUI

" list of font names to be used in the GUI
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
" set guifont=Inconsolata-dz\ for\ Powerline\ 10.5
highlight PmenuSel        guifg=red guibg=black gui=bold,italic
highlight Comment                               gui=italic
highlight MatchParen      guifg=bg  guibg=red   gui=bold,italic

" list of font names to be used for double-wide characters
" set guifontwide=

" list of flags that specify how the GUI works
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

" "icons", "text" and/or "tooltips"; how to show the toolbar
" set toolbar=

" size of toolbar icons
" set toolbariconsize=

" room (in pixels) left above/below the window
" set guiheadroom=

" use a pseudo-tty for I/O to external commands
" set guipty

" language to be used for the menus
" set langmenu=

" maximum number of items in one menu
" set menuitems=

" "no", "yes" or "menu"; how to use the ALT key
" set winaltkeys=

" number of pixel lines to use between characters
" set linespace=

" delay in milliseconds before a balloon may pop up
" set balloondelay=

" whether the balloon evaluation is to be used
" set noballooneval

" expression to show in balloon eval
" set balloonexpr=

" don't flick cursor.
set guicursor&
set guicursor+=a:blinkon0

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
