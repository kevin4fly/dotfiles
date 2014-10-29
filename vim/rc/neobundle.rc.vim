" neobundle

" neobundle related{{{1

" let neobundle manage plugins{{{2
NeoBundleFetch 'Shougo/neobundle.vim', {
            \ 'name': 'neobundle',
            \ }

" c family related{{{1

" complete identifier for all, semantic completion for c-family language{{{2
" and language specific completeion, such as python, c#. and more
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'name': 'YouCompleteMe',
            \ }

" complete function parameters{{{2
NeoBundleLazy 'kevin4fly/code_complete', {
            \ 'insert': 1,
            \ 'name': 'c-code-complete',
            \ }

" swtich between source files and header files quickly{{{2
NeoBundleLazy 'derekwyatt/vim-fswitch', {
            \ 'filetypes': ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ 'name': 'fswitch',
            \ }

" enhanced highlight cpp systax{{{2
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {
            \ 'filetypes': ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ 'name': 'cpp-enhanced-highlight',
            \ }

" python related{{{1

" complete python class, function and function's parameters and more{{{2
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'filetypes': 'python',
            \ 'name': 'jedi',
            \ }

" change python version along with pyenv (conflict with ycm){{{2
" NeoBundleLazy 'lambdalisue/vim-pyenv', {
"             \ 'depends': 'jedi',
"             \ 'autoload': {
"             \   'filetypes': ['python', 'python3'],
"             \ 'name': 'pyenv',
"             \ }}

" integrate between Vim and IPython{{{2
NeoBundleLazy 'ivanov/vim-ipython', {
            \ 'commands': [
            \   {'name': ['IPython', 'IPythonClipboard', 'IPythonXSelection',
            \          'IPythonNew', 'IPythonInterrupt', 'IPythonTerminate']
            \   } ],
            \ 'name': 'ipython',
            \ }

" show python documantation{{{2
NeoBundleLazy 'fs111/pydoc.vim', {
            \ 'filetypes': 'python',
            \ 'name': 'pydoc',
            \ }

" fold for python{{{2
NeoBundleLazy 'tmhedberg/SimpylFold', {
            \ 'filetypes': 'python',
            \ 'name': 'simply-fold',
            \ }

" enhanced highlight python systax{{{2
NeoBundleLazy 'hdima/python-syntax', {
            \ 'filetypes': 'python',
            \ 'name': 'python-syntax',
            \ }

" lisp related{{{1

" lisp env{{{2
NeoBundleLazy 'kovisoft/slimv', {
            \ 'filetypes': 'lisp',
            \ 'direcotry': 'slimv',
            \ }

" rainbow{{{2
NeoBundleLazy 'amdt/vim-niji', {
            \ 'filetypes': ['lisp', 'ruby', 'python'],
            \ 'name': 'niji',
            \ }

" highlight syntax{{{2
" NeoBundleLazy 'newlisp'

" tags related{{{1

" show project tags{{{2
NeoBundleLazy 'majutsushi/tagbar', {
            \ 'commands': [
            \   {'name': ['Tagbar', 'TagbarToggle', 'TagbarOpen',
            \    'TagbarOpenAutoClose', 'TagbarClose', 'TagbarSetFoldlevel',
            \    'TagbarShowTag', 'TagbarCurrentTag', 'TagbarGetTypeConfig',
            \    'TagbarDebug', 'TagbarDebugEnd', 'TagbarTogglePause',]
            \   } ],
            \ 'name': 'tagbar',
            \ }

" auto update your tags{{{2
NeoBundleLazy 'craigemery/vim-autotag', {
            \ 'insert': 1,
            \ 'name': 'autotag',
            \ }

" markdown related{{{1

" instantly preview markdown file in web browser while editing inside vim{{{2
NeoBundleLazy 'suan/vim-instant-markdown', {
            \ 'filetypes': ['markdown', 'md'],
            \ 'name': 'instant-markdown',
            \ }

" sytax highlight for markdown file{{{2
NeoBundleLazy 'plasticboy/vim-markdown', {
            \ 'filetypes': ['markdown', 'md'],
            \ 'name': 'markdown-syntax',
            \ }

" file, buffer related{{{1

" provide asynchronous execution library for vim{{{2
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'linux' : 'make',
            \   },
            \ 'name': 'vimproc',
            \ }

" search and display lists of infomation(the file, buffer, mru, {{{2
" tag and more)
NeoBundleLazy 'Shougo/unite.vim', {
            \ 'commands': [
            \   { 'name'    : 'Unite',
            \     'complete': 'customlist,unite#complete_source'
            \   } ],
            \ 'depends': 'vimproc',
            \ 'name': 'unite',
            \ }

" show most recently used files{{{2
NeoBundle 'Shougo/neomru.vim', {
            \ 'depends': 'unite',
            \ 'name': 'unite-neomru',
            \ }

" show outputs of all kinds of tag files{{{2
NeoBundleLazy 'tsukkee/unite-tag', {
            \ 'depends': 'unite',
            \ 'name': 'unite-tag',
            \ }

" show outputs of quickfix and location-list{{{2
NeoBundleLazy 'osyo-manga/unite-quickfix', {
            \ 'depends': 'unite',
            \ 'name': 'unite-quickfix',
            \ }

" show command line history{{{2
NeoBundleLazy 'thinca/vim-unite-history', {
            \ 'depends': 'unite',
            \ 'name': 'unite-history',
            \ }

" show outline of the buffers{{{2
NeoBundleLazy 'Shougo/unite-outline', {
            \ 'depends': 'unite',
            \ 'name': 'unite-outline',
            \ }

" show marks{{{2
NeoBundleLazy 'tacroe/unite-mark', {
            \ 'depends': 'unite',
            \ 'name': 'unite-mark',
            \ }

" show available sessions{{{2
NeoBundleLazy 'Shougo/unite-session', {
            \ 'depends': 'unite',
            \ 'commands': [
            \   { 'name': ['UniteSessionSave', 'UniteSessionLoad', 'Unite'] },
            \   ],
            \ 'name': 'unite-session',
            \ }

" show help{{{2
NeoBundleLazy 'Shougo/unite-help', {
            \ 'depends': 'unite',
            \ 'name': 'unite-help',
            \ }

" explore filesysterm{{{2
NeoBundleLazy 'Shougo/vimfiler.vim', {
            \ 'depends': 'unite',
            \ 'commands': [
            \   { 'name': ['VimFiler', 'VimFilerCreate', 'VimFilerSimple',
            \       'VimFilerSplit', 'VimFilerTab', 'VimFilerDouble',
            \       'VimFilerCurrentDir', 'VimFilerBufferDir',
            \       'VimFilerExplorer', 'VimFilerClose',],
            \      'complete' : 'customlist,vimfiler#complete' },
            \      'Read', 'Source'],
            \ 'mappings': '<plug>',
            \ 'explorer': 1,
            \ 'name': 'vimfiler',
            \ }

" resize the focused windown to a proper size{{{2
NeoBundle 'zhaocai/GoldenView.Vim', {
            \ 'name': 'golden-view',
            \ }

" kill the active buffer without close the window{{{2
NeoBundleLazy 'moll/vim-bbye', {
            \ 'commands': [{'name': ['Bdelete']}],
            \ 'name': 'bbye',
            \ }

" emulates a two-pane text outliner{{{2
NeoBundle 'vim-voom/VOoM', {
            \ 'name': 'VOom',
            \ }

" text handling related{{{1

" complete code snippets{{{2
NeoBundle 'SirVer/ultisnips', {
            \ 'name': 'ulti-snippets',
            \ }
NeoBundle 'honza/vim-snippets', {
            \ 'name': 'snippets',
            \ }

" insert or delete brackets, parens, quotes in pair{{{2
" NeoBundleLazy 'Raimondi/delimitMate'
NeoBundle 'jiangmiao/auto-pairs', {
            \ 'name': 'auto-pairs',
            \ }

" set the undotree visually{{{2
NeoBundleLazy 'sjl/gundo.vim', {
            \ 'commands': [{'name': ['GundoToggle']}],
            \ 'name': 'gundo',
            \ }

" provides a much simpler way to use some motions{{{2
NeoBundleLazy 'Lokaltog/vim-easymotion', {
            \ 'mappings': '<plug>',
            \ 'name': 'easy-motion',
            \ }

" manage the yanked text{{{2
NeoBundle 'vim-scripts/YankRing.vim', {
            \ 'name': 'yank-ring',
            \ }

" toggle comment{{{2
NeoBundle 'tomtom/tcomment_vim', {
            \ 'name': 'tcomment',
            \ }
" NeoBundleLazy 'tpope/vim-commentary'

" align text{{{2
NeoBundleLazy 'godlygeek/tabular', {
            \ 'commands': [{'name': ['Tabularize']}],
            \ 'name': 'tabular',
            \ }
NeoBundleLazy 'junegunn/vim-easy-align', {
            \ 'mappings': '<plug>(EasyAlign)',
            \ 'name': 'easy-align',
            \ }

" focuss on a region and make the rest inaccessible (narrow region){{{2
NeoBundle 'chrisbra/NrrwRgn', {
            \ 'name': 'narrow-region',
            \ }

" edit code embedded in other code, through a temp buffer{{{2
NeoBundleLazy 'AndrewRadev/inline_edit.vim', {
            \ 'commands': [{'name': ['InlineEdit']}],
            \ 'name': 'inline-edit',
            \ }

" highlight text while running substitute{{{2
NeoBundleLazy 'osyo-manga/vim-over', {
            \ 'commands': [{'name': ['OverCommandLine']}],
            \ 'name': 'over',
            \ }

" multiple selection{{{2
NeoBundleLazy 'terryma/vim-multiple-cursors', {
            \ 'mappings': '<c-n>',
            \ 'name': 'multiple-cursors',
            \ }

" exchange text in two places{{{2
NeoBundleLazy 'tommcdo/vim-exchange', {
            \ 'mappings' : [['nxo', 'cx', 'cxx', 'cxc', 'X']],
            \ 'name': 'exchange',
            \ }

" substitute specific pattern under the cursor{{{2
NeoBundleLazy 'AndrewRadev/switch.vim', {
            \ 'commands': [{'name': ['Switch']}],
            \ 'name': 'switch',
            \ }

" show differeces of the two part{{{2
NeoBundleLazy 'AndrewRadev/linediff.vim', {
            \ 'commands': [{'name': ['Linediff', 'LinediffReset']}],
            \ 'name': 'line-diff',
            \ }

" split and joint lines{{{2
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
            \ 'commands': [{'name': ['SplitjoinJoin', 'SplitjoinSplit']}],
            \ 'name': 'split-join',
            \ }

" create your own text objects{{{2
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

" leverage the power of vim's compiler system without being constrained by{{{2
" synchronicity.
NeoBundleLazy 'tpope/vim-dispatch', {
            \ 'commands': [{'name': ['Make', 'Dispatch', 'FocusDispatch',
            \     'Start']}],
            \ 'name': 'dispatch',
            \ }

" set the git wrapper{{{2
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
" abbreviate, substitute and search several variations of a word{{{2
NeoBundle 'tpope/vim-abolish', {
            \ 'name': 'abolish'
            \ }

" deal with pairs of 'surroudings'{{{2
NeoBundleLazy 'tpope/vim-surround', {
            \ 'autoload': {'mappings': ['<plug>Dsurround', '<plug>Csurround',
            \     '<plug>Ysurround', '<plug>YSurround', '<plug>Yssurround',
            \     '<plug>YSsurround', '<plug>SurroundRepeat',
            \     ['sx', '<plug>VSurround', '<plug>VgSurround'],
            \     ['i', '<plug>Isurround', '<plug>ISurround']]},
            \ 'name': 'surround',
            \ }

" repeat your mapping in normal mode{{{2
NeoBundleLazy 'tpope/vim-repeat', {
            \ 'mappings': '.',
            \ 'name': 'repeat',
            \ }
" repeat your mapping in visual mode{{{2
" NeoBundle 'vim-scripts/visualrepeat', {
"             \ 'name': 'visual-repeat',
"             \ }

" mark, marker and highlight{{{1

" auto check syntax as you save files{{{2
NeoBundle 'scrooloose/syntastic', {
            \ 'name': 'syntastic',
            \ }

" Lean & mean status/tabline for vim{{{2
NeoBundle 'bling/vim-airline', {
            \ 'name': 'airline',
            \ }

" set the status line{{{2
" NeoBundleLazy 'Lokaltog/vim-powerline'

" highlight the XML/HTML tags that enclose your cursor location{{{2
NeoBundleLazy 'valloric/MatchTagAlways', {
            \ 'filetypes': ['html', 'xml'],
            \ 'name': 'match-tag-always',
            \ }

" set the color scheme{{{2
NeoBundle 'tomasr/molokai', {
            \ 'name': 'molokai',
            \ }

" use signs to indicate added, modified and removed lines{{{2
NeoBundle 'mhinz/vim-signify', {
            \ 'name': 'signify',
            \ }

" show git diff in the 'gutter' way{{{2
" NeoBundleLazy 'airblade/vim-gitgutter'

" show vertical lines at indentation{{{2
NeoBundle 'Yggdroot/indentLine', {
            \ 'name': 'indent-line'
            \ }

" manage marks{{{2
NeoBundle 'kshenoy/vim-signature', {
            \ 'name': 'signature',
            \ }

" provide incremental highlighting for all pattern matches{{{2
NeoBundleLazy 'haya14busa/incsearch.vim', {
            \ 'autoload' : {
            \     'mappings' : ['<plug>(incsearch-']
            \  },
            \ 'name': 'incsearch',
            \ }

" provide star feature in visual-mode{{{2
NeoBundleLazy 'thinca/vim-visualstar', {
            \ 'mappings': '<plug>(visualstar-',
            \ 'name': 'visual-star',
            \ }

" sytax highlight for nginx{{{2
NeoBundleLazy 'evanmiller/nginx-vim-syntax', {
            \ 'filetypes': 'nginx',
            \ 'name': 'nginx-syntax',
            \ }

" sytax highlight for getmailrc/msmtprc{{{2
NeoBundleLazy 'vim-scripts/getmail.vim', {
            \ 'filetypes': 'getmailrc',
            \ 'name': 'getmail-syntax',
            \ }
NeoBundleLazy 'wogong/msmtp.vim', {
            \ 'filetypes': 'msmtp',
            \ 'name': 'msmtp-syntax',
            \ }

" misc{{{1

" open URI with your favorite browser{{{2
NeoBundleLazy 'tyru/open-browser.vim', {
            \ 'autoload': {
            \	    'mappings': '<plug>(openbrowser-',
            \ },
            \ 'name': 'open-browser',
            \ }

" manipulate gists{{{2
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

" show git log nice way{{{2
NeoBundleLazy 'gregsexton/gitv', {
            \ 'commands': [{'name': ['Gitv']}],
            \ 'name': 'gitv',
            \ }

" manage your notes{{{2
NeoBundleLazy 'xolox/vim-misc', {
            \ 'name': 'xolox-misc',
            \ }
NeoBundle 'xolox/vim-notes', {
            \ 'depends': 'xolox-misc',
            \ 'name': 'notes',
            \ }

" handle paste mode{{{2
NeoBundle 'ConradIrwin/vim-bracketed-paste', {
            \ 'name': 'bracketed-paste',
            \ }

NeoBundle 'thinca/vim-ref', {
            \ 'name': 'vim-ref',
            \ }

" change the content of quickfix{{{2
NeoBundleLazy 'thinca/vim-qfreplace', {
            \ 'commands': [{'name': 'Qfreplace'}],
            \ 'name': 'quickfix-replace',
            \ }

" execute whole or part of the editing file{{{2
NeoBundleLazy 'thinca/vim-quickrun', {
            \ 'commands': [{'name': ['QuickRun']}],
            \ 'mappings': '<plug>(quickrun',
            \ 'name': 'quickrun',
            \ }

" turn a Vim buffer into a terminal emulator{{{2
NeoBundleLazy 'rosenfeld/conque-term', {
            \ 'name': 'conque-terminal',
            \ }

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
