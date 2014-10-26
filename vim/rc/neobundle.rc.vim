" neobundle

" let neobundle manage plugins{{{
NeoBundleFetch 'Shougo/neobundle.vim', {
            \ 'name': 'neobundle',
            \ }

" }}}
" c family related{{{

" complete identifier for all, semantic completion for c-family language and
" language specific completeion, such as python, c#. and more
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'name': 'YouCompleteMe',
            \ }

" complete function parameters
NeoBundleLazy 'kevin4fly/code_complete', {
            \ 'insert': 1,
            \ 'name': 'c-code-complete',
            \ }

" swtich between source files and header files quickly
NeoBundleLazy 'derekwyatt/vim-fswitch', {
            \ 'filetypes': ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ 'name': 'fswitch',
            \ }

" enhanced highlight cpp systax
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {
            \ 'filetypes': ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ 'name': 'cpp-enhanced-highlight',
            \ }

" }}}
" python related{{{

" complete python class, function and function's parameters and more
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'filetypes': 'python',
            \ 'name': 'jedi',
            \ }

" change python version along with pyenv
" NeoBundleLazy 'lambdalisue/vim-pyenv', {
"             \ 'depends': 'jedi',
"             \ 'autoload': {
"             \   'filetypes': ['python', 'python3'],
"             \ 'name': 'pyenv',
"             \ }}

" integrate between Vim and IPython
" NeoBundleLazy 'ivanov/vim-ipython'

" show python documantation
NeoBundleLazy 'fs111/pydoc.vim', {
            \ 'filetypes': 'python',
            \ 'name': 'pydoc',
            \ }

" fold for python
NeoBundleLazy 'tmhedberg/SimpylFold', {
            \ 'filetypes': 'python',
            \ 'name': 'simply-fold',
            \ }

" enhanced highlight python systax
NeoBundleLazy 'hdima/python-syntax', {
            \ 'filetypes': 'python',
            \ 'name': 'python-syntax',
            \ }

" }}}
" lisp related{{{

" lisp env
NeoBundleLazy 'kovisoft/slimv', {
            \ 'filetypes': 'lisp',
            \ 'direcotry': 'slimv',
            \ }

" rainbow
NeoBundleLazy 'amdt/vim-niji', {
            \ 'filetypes': ['lisp', 'ruby', 'python'],
            \ 'name': 'niji',
            \ }
" highlight syntax
" NeoBundleLazy 'newlisp'

" }}}
" tags related{{{

" show project tags
NeoBundleLazy 'majutsushi/tagbar', {
            \ 'commands': [
            \   {'name': ['Tagbar', 'TagbarToggle', 'TagbarOpen',
            \    'TagbarOpenAutoClose', 'TagbarClose', 'TagbarSetFoldlevel',
            \    'TagbarShowTag', 'TagbarCurrentTag', 'TagbarGetTypeConfig',
            \    'TagbarDebug', 'TagbarDebugEnd', 'TagbarTogglePause',]
            \   } ],
            \ 'name': 'tagbar',
            \ }

" auto update your tags
NeoBundleLazy 'craigemery/vim-autotag', {
            \ 'insert': 1,
            \ 'name': 'autotag',
            \ }

" }}}
" markdown related{{{

" instantly preview markdown file in web browser while editing inside vim
NeoBundleLazy 'suan/vim-instant-markdown', {
            \ 'filetypes': ['markdown', 'md'],
            \ 'name': 'instant-markdown',
            \ }

" sytax highlight for markdown file
NeoBundleLazy 'plasticboy/vim-markdown', {
            \ 'filetypes': ['markdown', 'md'],
            \ 'name': 'markdown-syntax',
            \ }

" }}}
" file, buffer related{{{

" provide asynchronous execution library for vim
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'linux' : 'make',
            \   },
            \ 'name': 'vimproc',
            \ }

" search and display lists of infomation(the file, buffer, mru, tag and more)
NeoBundleLazy 'Shougo/unite.vim', {
            \ 'commands': [
            \   { 'name'    : 'Unite',
            \     'complete': 'customlist,unite#complete_source'
            \   } ],
            \ 'depends': 'vimproc',
            \ 'name': 'unite',
            \ }

" show most recently used files
NeoBundle 'Shougo/neomru.vim', {
            \ 'depends': 'unite',
            \ 'name': 'unite-neomru',
            \ }

" show outputs of all kinds of tag files
" pretty slow due to /usr/include/tags approx 37M
" NeoBundleLazy 'tsukkee/unite-tag'

" show outputs of quickfix and location-list
NeoBundleLazy 'osyo-manga/unite-quickfix', {
            \ 'depends': 'unite',
            \ 'name': 'unite-quickfix',
            \ }

" show command line history
NeoBundleLazy 'thinca/vim-unite-history', {
            \ 'depends': 'unite',
            \ 'name': 'unite-history',
            \ }

" show outline of the buffers
NeoBundleLazy 'Shougo/unite-outline', {
            \ 'depends': 'unite',
            \ 'name': 'unite-outline',
            \ }

" show marks
NeoBundleLazy 'tacroe/unite-mark', {
            \ 'depends': 'unite',
            \ 'name': 'unite-mark',
            \ }

" show available sessions
NeoBundleLazy 'Shougo/unite-session', {
            \ 'depends': 'unite',
            \ 'commands': [
            \   { 'name': ['UniteSessionSave', 'UniteSessionLoad', 'Unite'] },
            \   ],
            \ 'name': 'unite-session',
            \ }

" show help
NeoBundleLazy 'Shougo/unite-help', {
            \ 'depends': 'unite',
            \ 'name': 'unite-help',
            \ }

" explore filesysterm
NeoBundleLazy 'Shougo/vimfiler.vim', {
            \ 'depends': 'unite',
            \ 'commands': [
            \   { 'name': ['VimFiler', 'VimFilerCreate', 'VimFilerSimple',
            \       'VimFilerSplit', 'VimFilerTab', 'VimFilerDouble',
            \       'VimFilerCurrentDir', 'VimFilerBufferDir',
            \       'VimFilerExplorer', 'VimFilerClose',],
            \      'complete' : 'customlist,vimfiler#complete' },
            \      'Read', 'Source'],
            \ 'mappings': '<Plug>',
            \ 'explorer': 1,
            \ 'name': 'vimfiler',
            \ }

" resize the focused windown to a proper size
NeoBundle 'zhaocai/GoldenView.Vim', {
            \ 'name': 'golden-view',
            \ }

" dynamic manage windows
" NeoBundle 'spolu/dwm.vim', {
"             \ 'name': 'dynamic-window-manager',
"             \ }

" kill the active buffer without close the window
NeoBundleLazy 'moll/vim-bbye', {
            \ 'commands': [{'name': ['Bdelete']}],
            \ 'name': 'bbye',
            \ }
" }}}
" text handling related{{{

" complete code snippets
NeoBundle 'SirVer/ultisnips', {
            \ 'name': 'ulti-snippets',
            \ }
NeoBundle 'honza/vim-snippets', {
            \ 'name': 'snippets',
            \ }

" insert or delete brackets, parens, quotes in pair
" NeoBundleLazy 'Raimondi/delimitMate'
NeoBundle 'jiangmiao/auto-pairs', {
            \ 'name': 'auto-pairs',
            \ }

" set the undotree visually
NeoBundleLazy 'sjl/gundo.vim', {
            \ 'commands': [{'name': ['GundoToggle']}],
            \ 'name': 'gundo',
            \ }

" provides a much simpler way to use some motions
NeoBundleLazy 'Lokaltog/vim-easymotion', {
            \ 'mappings': '<plug>',
            \ 'name': 'easy-motion',
            \ }

" manage the yanked text
NeoBundle 'vim-scripts/YankRing.vim', {
            \ 'name': 'yank-ring',
            \ }

" toggle comment
NeoBundle 'tomtom/tcomment_vim', {
            \ 'name': 'tcomment',
            \ }
" NeoBundleLazy 'tpope/vim-commentary'

" align text
NeoBundleLazy 'godlygeek/tabular', {
            \ 'commands': [{'name': ['Tabularize']}],
            \ 'name': 'tabular',
            \ }
NeoBundleLazy 'junegunn/vim-easy-align', {
            \ 'mappings': '<plug>',
            \ 'name': 'easy-align',
            \ }

" focuss on a region and make the rest inaccessible (narrow region)
NeoBundle 'chrisbra/NrrwRgn', {
            \ 'name': 'narrow-region',
            \ }

" edit code embedded in other code, through a temp buffer
NeoBundleLazy 'AndrewRadev/inline_edit.vim', {
            \ 'commands': [{'name': ['InlineEdit']}],
            \ 'name': 'inline-edit',
            \ }

" highlight text while running substitute
NeoBundleLazy 'osyo-manga/vim-over', {
            \ 'commands': [{'name': ['OverCommandLine']}],
            \ 'name': 'over',
            \ }

" multiple selection
NeoBundleLazy 'terryma/vim-multiple-cursors', {
            \ 'mappings': '<c-n>',
            \ 'name': 'multiple-cursors',
            \ }

" exchange text in two places
NeoBundleLazy 'tommcdo/vim-exchange', {
            \ 'mappings' : [['nxo', 'cx', 'cxx', 'cxc', 'X']],
            \ 'name': 'exchange',
            \ }

" substitute specific pattern under the cursor
NeoBundleLazy 'AndrewRadev/switch.vim', {
            \ 'commands': [{'name': ['Switch']}],
            \ 'name': 'switch',
            \ }

" show differeces of the two part
NeoBundleLazy 'AndrewRadev/linediff.vim', {
            \ 'commands': [{'name': ['Linediff', 'LinediffReset']}],
            \ 'name': 'line-diff',
            \ }

" split and joint lines
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
            \ 'commands': [{'name': ['SplitjoinJoin', 'SplitjoinSplit']}],
            \ 'name': 'split-join',
            \ }

" create your own text objects
NeoBundleLazy 'kana/vim-textobj-user', {
            \ 'name': 'textobj-user',
            \ }
NeoBundleLazy 'kana/vim-textobj-indent', {
            \ 'depends': 'textobj-user',
            \ 'autoload': {'mappings': [['ox', '<plug>(textobj-indent-']]},
            \ 'name': 'textobj-indent',
            \ }
NeoBundleLazy 'kana/vim-textobj-function', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', '<plug>(textobj-function-']]},
            \ 'name': 'textobj-function',
            \ }
NeoBundleLazy 'rhysd/vim-textobj-anyblock', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', '<plug>(textobj-anyblock-']]},
            \ 'name': 'textobj-anyblock',
            \ }
NeoBundleLazy 'kana/vim-niceblock', {
            \ 'mappings': '<plug>(niceblock-',
            \ 'name': 'niceblock',
            \ }
NeoBundleLazy 'sgur/vim-textobj-parameter', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', 'i,', 'a,']]},
            \ 'name': 'textobj-parameter',
            \ }
NeoBundleLazy 'machakann/vim-textobj-delimited', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', '<plug>(textobj-delimited-']]},
            \ 'name': 'textobj-delimited',
            \ }
NeoBundleLazy 'rhysd/vim-textobj-continuous-line', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', 'iv', 'av']]},
            \ 'name': 'textobj-continuous-line',
            \ }
NeoBundleLazy 'kevin4fly/vim-textobj-brace', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', 'ij', 'aj']]},
            \ 'name': 'textobj-brace',
            \ }
NeoBundleLazy 'beloglazov/vim-textobj-quotes', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', 'iq', 'aq']]},
            \ 'name': 'textobj-quotes',
            \ }
NeoBundleLazy 'bps/vim-textobj-python', {
            \ 'depends' : 'textobj-user',
            \ 'autoload': {'mappings': [['ox', '<plug>(textobj-python-']]},
            \ 'name': 'textobj-python',
            \ }

NeoBundleLazy 'kana/vim-operator-user', {
            \ 'functions': 'operator#user#define',
            \ 'name': 'operator-user',
            \ }
NeoBundleLazy 'kana/vim-operator-replace', {
            \ 'depends': 'operator-user',
            \ 'autoload': {'mappings' : [['nx', '<plug>(operator-replace)']]},
            \ 'name': 'operator-replace',
            \ }
" NeoBundleLazy 'rhysd/vim-operator-surround', {
"             \ 'depends' : 'operator-user',
"             \ 'autoload': {'mappings' : ['<plug>(operator-surround-']},
"             \ 'name': 'operator-surround',
"             \ }

NeoBundleLazy 'tpope/vim-dispatch', {
            \ 'commands': [{'name': ['Make', 'Dispatch', 'FocusDispatch',
            \     'Start']}],
            \ 'name': 'dispatch',
            \ }

" set the git wrapper
NeoBundleLazy 'tpope/vim-fugitive', {
            \ 'augroup': 'fugitive',
            \ 'commands': [{'name': ['Git', 'Gcd', 'Glcd', 'Gstatus',
            \     'Gcommit', 'Ggrep', 'Glgrep', 'Glog', 'Gllog', 'Gedit',
            \     'Gsplit', 'Gvsplit', 'Gtabedit', 'Gpedit', 'Gread',
            \     'Gwrite', 'Gwq', 'Gdiff', 'Gsdiff', 'Gvdiff', 'Gmove',
            \     'Gremove', 'Gblame', 'Gbrowse']}],
            \ 'mappings': ',gg',
            \ 'name': 'fugitive',
            \ }
" abbreviate, substitute and search several variations of a word
NeoBundleLazy 'tpope/vim-abolish', {
            \ 'name': 'abolish'
            \ }

" deal with pairs of 'surroudings'
NeoBundleLazy 'tpope/vim-surround', {
            \ 'autoload': {'mappings': ['<plug>Dsurround', '<plug>Csurround',
            \     '<plug>Ysurround', '<plug>YSurround', '<plug>Yssurround',
            \     '<plug>YSsurround', '<plug>SurroundRepeat',
            \     ['sx', '<plug>VSurround', '<plug>VgSurround'],
            \     ['i', '<plug>Isurround', '<plug>ISurround']]},
            \ 'name': 'surround',
            \ }

" repeat your mapping in normal mode
NeoBundleLazy 'tpope/vim-repeat', {
            \ 'mappings': '.',
            \ 'name': 'repeat',
            \ }
" repeat your mapping in visual mode
" NeoBundle 'vim-scripts/visualrepeat', {
"             \ 'name': 'visual-repeat',
"             \ }

" }}}
" mark, marker and highlight{{{

" auto check syntax as you save files
NeoBundle 'scrooloose/syntastic', {
            \ 'name': 'syntastic',
            \ }

" Lean & mean status/tabline for vim
NeoBundle 'bling/vim-airline', {
            \ 'name': 'airline',
            \ }
" set the status line
"NeoBundleLazy 'Lokaltog/vim-powerline'

" highlight the XML/HTML tags that enclose your cursor location
NeoBundleLazy 'valloric/MatchTagAlways', {
            \ 'filetypes': ['html', 'xml'],
            \ 'name': 'match-tag-always',
            \ }

" set the color scheme
NeoBundle 'tomasr/molokai', {
            \ 'name': 'molokai',
            \ }

" use signs to indicate added, modified and removed lines
NeoBundle 'mhinz/vim-signify', {
            \ 'name': 'signify',
            \ }

" show git diff in the 'gutter' way
" NeoBundleLazy 'airblade/vim-gitgutter'

" show vertical lines at indentation
NeoBundle 'Yggdroot/indentLine', {
            \ 'name': 'indent-line'
            \ }

" manage marks
NeoBundle 'kshenoy/vim-signature', {
            \ 'name': 'signature',
            \ }

" sytax highlight for nginx
NeoBundleLazy 'evanmiller/nginx-vim-syntax', {
            \ 'filetypes': 'nginx',
            \ 'name': 'nginx-syntax',
            \ }

" sytax highlight for getmailrc/msmtprc
NeoBundleLazy 'vim-scripts/getmail.vim', {
            \ 'filetypes': 'getmailrc',
            \ 'name': 'getmail-syntax',
            \ }
NeoBundleLazy 'wogong/msmtp.vim', {
            \ 'filetypes': 'msmtp',
            \ 'name': 'msmtp-syntax',
            \ }

" }}}
" misc{{{

" open URI with your favorite browser
NeoBundleLazy 'tyru/open-browser.vim', {
            \ 'autoload': {
            \	    'mappings': '<plug>(openbrowser-',
            \ },
            \ 'name': 'open-browser',
            \ }

" manipulate gists
NeoBundleLazy 'lambdalisue/vim-gista', {
            \ 'depends': [
            \	    'unite',
            \	    'tyru/open-browser.vim',
            \ ],
            \ 'autoload': {
            \	    'commands': ['Gista'],
            \	    'mappings': '<plug>(gista-',
            \	    'unite_sources': 'gista',
            \ },
            \ 'name': 'gista',
            \ }

" show git log nice way
NeoBundleLazy 'gregsexton/gitv', {
            \ 'commands': [{'name': ['Gitv']}],
            \ 'name': 'gitv',
            \ }

" manage your notes
NeoBundleLazy 'xolox/vim-misc', {
            \ 'name': 'xolox-misc',
            \ }
NeoBundle 'xolox/vim-notes', {
            \ 'depends': 'xolox-misc',
            \ 'name': 'notes',
            \ }

" }}}

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
