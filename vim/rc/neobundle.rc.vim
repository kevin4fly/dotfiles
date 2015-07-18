" neobundle

" neobundle related{{{1

" let neobundle manage plugins{{{2
NeoBundleFetch 'Shougo/neobundle.vim', {
            \ 'name' : 'neobundle',
            \ }

" colorscheme related{{{1

" manage colorscheme with unite{{{2
" NeoBundleLazy 'ujihisa/unite-colorscheme', {
"             \ 'name'    : 'unite-colorscheme',
"             \ 'depends' : 'unite',
"             \ }

" manage font with unite
" NeoBundleLazy 'ujihisa/unite-font', {
"             \ 'name' : 'unite-font',
"             \ 'depends' : 'unite',
"             \ }

" add molokai colorscheme(default)
NeoBundle 'tomasr/molokai', {
            \ 'name' : 'molokai-colorscheme',
            \ }

" waiting for https://github.com/chriskempson/base16-builder/issues/179{{{2
" add base16-vim colorscheme
" NeoBundle 'chriskempson/base16-vim', {
"             \ 'name' : 'base16-colorscheme',
"             \ }

" add more vim colorscheme
" NeoBundle 'flazz/vim-colorschemes', {
"             \ 'name' : 'flazz-colorschemes',
"             \ }

" version-controlling related{{{1

" set the git wrapper{{{2
NeoBundleLazy 'tpope/vim-fugitive', {
            \ 'name'     : 'fugitive',
            \ 'mappings' : ',gg',
            \ 'augroup'  : 'fugitive',
            \ 'commands' : [
            \               { 'name' : ['Git', 'Gcd', 'Glcd', 'Gstatus',
            \                           'Gcommit', 'Ggrep', 'Glgrep', 'Glog',
            \                           'Gllog', 'Gedit', 'Gsplit', 'Gvsplit',
            \                           'Gtabedit', 'Gpedit', 'Gread',
            \                           'Gwrite', 'Gwq', 'Gdiff', 'Gsdiff',
            \                           'Gvdiff', 'Gmove', 'Gremove',
            \                           'Gblame', 'Gbrowse'],
            \               }
            \              ],
            \ }

" show git log nice way{{{2
NeoBundleLazy 'gregsexton/gitv', {
            \ 'name'     : 'gitv',
            \ 'depends'  : 'fugitive',
            \ 'commands' : [
            \               { 'name': ['Gitv']},
            \              ],
            \ }

" gather candidates from your git repository
NeoBundleLazy 'yuku-t/unite-git', {
            \ 'name'    : 'unite-git',
            \ 'depends' : 'unite',
            \ }

" view single or mutilple patch
NeoBundleLazy 'junkblocker/patchreview-vim', {
            \ 'name'     : 'patch-review',
            \ 'commands' : [
            \               { 'name': ['DiffReview', 'PatchReview',
            \                          'ReversePatchReview' ],
            \               }
            \              ],
            \ }

" use signs to indicate added, modified and removed lines{{{2
NeoBundle 'mhinz/vim-signify', {
            \ 'name' : 'signify',
            \ }
" show git diff in the 'gutter' way{{{2
" NeoBundleLazy 'airblade/vim-gitgutter'

" select your github repos
NeoBundleLazy 'sorah/unite-ghq', {
            \ 'name'    : 'unite-ghq',
            \ 'depends' : 'unite',
            \ }

" manipulate gists{{{2
NeoBundleLazy 'lambdalisue/vim-gista', {
            \ 'name'     : 'gista',
            \ 'depends'  : ['unite', 'open-browser'],
            \ 'autoload' : {
            \	              'commands'      : ['Gista'],
            \	              'mappings'      : '<plug>(gista-',
            \	              'unite_sources' : 'gista',
            \              },
            \ }


" c family related{{{1

" complete identifier for all, semantic completion for c-family language{{{2
" and language specific completeion, such as python, c#. and more
NeoBundle 'Valloric/YouCompleteMe', {
            \ 'name' : 'YouCompleteMe',
            \ }

" complete function parameters{{{2
NeoBundleLazy 'kevin4fly/code_complete', {
            \ 'name'   : 'c-code-complete',
            \ 'insert' : 1,
            \ }

" swtich between source files and header files quickly{{{2
NeoBundleLazy 'derekwyatt/vim-fswitch', {
            \ 'name'      : 'fswitch',
            \ 'filetypes' : ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ }

" enhanced highlight cpp systax{{{2
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight', {
            \ 'name'      : 'cpp-enhanced-highlight',
            \ 'filetypes' : ['c', 'cpp', 'cxx', 'C', 'h', 'hpp'],
            \ }

" vim script related{{{1

" provide commands for working with vim script easily{{{2
NeoBundleLazy 'tpope/vim-scriptease', {
            \ 'name'      : 'vim-scriptease',
            \ 'filetypes' : ['vim'],
            \ }

NeoBundleLazy 'ynkdir/vim-vimlparser', {
            \ 'name' : 'vim-viml-parser',
            \ }

NeoBundleLazy 'osyo-manga/shabadou.vim', {
            \ 'name'  : 'shadadou',
            \ }

NeoBundleLazy 'osyo-manga/vim-watchdogs', {
            \ 'name'    : 'vim-watchdogs',
            \ 'depends' : ['quickrun', 'vimproc', 'shadadou'],
            \ }

" check vim syntax{{{2
NeoBundleLazy 'syngan/vim-vimlint', {
            \ 'name'      : 'vim-vimlint',
            \ 'filetypes' : ['vim'],
            \ 'depends'   : ['vim-watchdogs', 'vim-viml-parser'],
            \ }

" provide vim script libraries for break-points plugin below{{{2
" NeoBundleLazy 'vim-scripts/genutils', {
"             \ 'name' : 'genutils',
"             \ }

" set/view Vim breakpoints and browse functions visually{{{2
" NeoBundleLazy 'vim-scripts/BreakPts', {
"             \ 'name'      : 'break-points',
"             \ 'filetypes' : ['vim'],
"             \ 'depends'   : 'genutils',
"             \ }

" python related{{{1

" complete python class, function and function's parameters and more{{{2
NeoBundleLazy 'davidhalter/jedi-vim', {
            \ 'name'      : 'jedi',
            \ 'filetypes' : 'python',
            \ }

" change python version along with pyenv (conflict with ycm){{{2
" NeoBundleLazy 'lambdalisue/vim-pyenv', {
"             \ 'name': 'pyenv',
"             \ 'depends': 'jedi',
"             \ 'autoload': {
"             \   'filetypes': ['python', 'python3'],
"             \ }}

" integrate between Vim and IPython{{{2
NeoBundleLazy 'ivanov/vim-ipython', {
            \ 'name'     : 'ipython',
            \ 'commands' : [
            \               {'name' : ['IPython', 'IPythonClipboard',
            \                          'IPythonXSelection', 'IPythonNew',
            \                          'IPythonInterrupt', 'IPythonTerminate'],
            \               },
            \              ],
            \ }

" show python documantation{{{2
NeoBundleLazy 'fs111/pydoc.vim', {
            \ 'name'      : 'pydoc',
            \ 'filetypes' : 'python',
            \ }

" fold for python{{{2
NeoBundleLazy 'tmhedberg/SimpylFold', {
            \ 'name'      : 'simply-fold',
            \ 'filetypes' : 'python',
            \ }

" enhanced highlight python systax{{{2
NeoBundleLazy 'hdima/python-syntax', {
            \ 'name'      : 'python-syntax',
            \ 'filetypes' : 'python',
            \ }

" xml/html related{{{1

" highlight the XML/HTML tags that enclose your cursor location{{{2
NeoBundleLazy 'valloric/MatchTagAlways', {
            \ 'name'      : 'match-tag-always',
            \ 'filetypes' : ['html', 'xml'],
            \ }

NeoBundleLazy 'whatyouhide/vim-textobj-xmlattr', {
            \ 'name'     : 'textobj-xml-attribute',
            \ 'filetypes': ['html', 'xml', 'xhtml', 'php'],
            \ 'depends'  : 'textobj-user',
            \ }

" NeoBundleLazy 'sukima/xmledit', {
"             \ 'name'      : 'xml-edit',
"             \ 'filetypes' : ['html', 'xml', 'xhtml', 'php'],
"             \ }

" lisp related{{{1

" lisp env{{{2
NeoBundleLazy 'kovisoft/slimv', {
            \ 'name'      : 'slimv',
            \ 'filetypes' : 'lisp',
            \ }

" rainbow{{{2
" NeoBundleLazy 'amdt/vim-niji', {
"             \ 'filetypes' : ['lisp', 'ruby', 'python'],
"             \ 'name'      : 'niji',
"             \ }

" highlight syntax{{{2
" NeoBundleLazy 'newlisp'

" tags related{{{1

" show project tags{{{2
NeoBundleLazy 'majutsushi/tagbar', {
            \ 'name'     : 'tagbar',
            \ 'commands' : [
            \               {'name': ['Tagbar', 'TagbarToggle', 'TagbarOpen',
            \                         'TagbarOpenAutoClose', 'TagbarClose',
            \                         'TagbarSetFoldlevel', 'TagbarShowTag',
            \                         'TagbarCurrentTag', 'TagbarTogglePause',
            \                         'TagbarDebug', 'TagbarDebugEnd',
            \                         'TagbarGetTypeConfig'],
            \               }
            \              ],
            \ }

" auto update your tags{{{2
NeoBundleLazy 'craigemery/vim-autotag', {
            \ 'name'   : 'autotag',
            \ 'insert' : 1,
            \ }

" markdown related{{{1

" instantly preview markdown file in web browser while editing inside vim{{{2
NeoBundleLazy 'suan/vim-instant-markdown', {
            \ 'name'      : 'instant-markdown',
            \ 'filetypes' : ['markdown', 'md'],
            \ }

" sytax highlight for markdown file{{{2
NeoBundleLazy 'plasticboy/vim-markdown', {
            \ 'name'      : 'plasticboy-markdown-syntax',
            \ 'depends'   : 'tabular',
            \ 'filetypes' : ['markdown', 'md'],
            \ }

" file, buffer related{{{1

" provide asynchronous execution library for vim{{{2
NeoBundleLazy 'Shougo/vimproc.vim', {
            \ 'name'  : 'vimproc',
            \ 'build' : {
            \             'linux' : 'make',
            \           },
            \ }

" search and display lists of infomation(the file, buffer, mru, {{{2
" tag and more)
NeoBundleLazy 'Shougo/unite.vim', {
            \ 'name'     : 'unite',
            \ 'depends'  : 'vimproc',
            \ 'commands' : [
            \               { 'name'    : 'Unite',
            \                 'complete': 'customlist,unite#complete_source',
            \               },
            \              ],
            \ }

" show most recently used files{{{2
NeoBundle 'Shougo/neomru.vim', {
            \ 'name'    : 'unite-neomru',
            \ }

" show outputs of all kinds of tag files{{{2
NeoBundleLazy 'tsukkee/unite-tag', {
            \ 'name'    : 'unite-tag',
            \ 'depends' : 'unite',
            \ }

" show outputs of quickfix and location-list{{{2
NeoBundleLazy 'osyo-manga/unite-quickfix', {
            \ 'name'    : 'unite-quickfix',
            \ 'depends' : 'unite',
            \ }

" show command line history{{{2
NeoBundleLazy 'thinca/vim-unite-history', {
            \ 'name'    : 'unite-history',
            \ 'depends' : 'unite',
            \ }

" show outline of the buffers{{{2
NeoBundleLazy 'Shougo/unite-outline', {
            \ 'name'    : 'unite-outline',
            \ 'depends' : 'unite',
            \ }

" show marks{{{2
NeoBundleLazy 'tacroe/unite-mark', {
            \ 'name'    : 'unite-mark',
            \ 'depends' : 'unite',
            \ }

" show available sessions{{{2
NeoBundleLazy 'Shougo/unite-session', {
            \ 'name'     : 'unite-session',
            \ 'depends'  : 'unite',
            \ 'commands' : [
            \               { 'name': ['UniteSessionSave', 'UniteSessionLoad',
            \                          'Unite'],
            \               },
            \              ],
            \ }

" show help{{{2
NeoBundleLazy 'Shougo/unite-help', {
            \ 'name'    : 'unite-help',
            \ 'depends' : 'unite',
            \ }

" change directory of the currect tab
NeoBundle 'kana/vim-tabpagecd', {
            \ 'name'          : 'tabpage-cd',
            \ 'unite_sources' : 'tab',
            \ }

" explore filesysterm{{{2
NeoBundleLazy 'Shougo/vimfiler.vim', {
            \ 'name'     : 'vimfiler',
            \ 'depends'  : 'unite',
            \ 'mappings' : '<plug>',
            \ 'explorer' : 1,
            \ 'commands' : [
            \               { 'name': ['VimFiler', 'VimFilerCreate',
            \                          'VimFilerSimple', 'VimFilerSplit',
            \                          'VimFilerTab', 'VimFilerDouble',
            \                          'VimFilerCurrentDir', 'VimFilerClose',
            \                          'VimFilerExplorer', 'VimFilerBufferDir',
            \                         ],
            \                 'complete' : 'customlist,vimfiler#complete',
            \               },
            \               'Read',
            \               'Source',
            \              ],
            \ }

" resize the focused windown to a proper size{{{2
NeoBundle 'zhaocai/GoldenView.Vim', {
            \ 'name' : 'golden-view',
            \ }

" kill the active buffer without close the window{{{2
NeoBundleLazy 'moll/vim-bbye', {
            \ 'name'     : 'bbye',
            \ 'commands' : [
            \               { 'name': ['Bdelete']},
            \              ],
            \ }

" emulates a two-pane text outliner{{{2
NeoBundle 'vim-voom/VOoM', {
            \ 'name' : 'VOom',
            \ }

" text handling related{{{1

" complete code snippets{{{2
NeoBundle 'SirVer/ultisnips', {
            \ 'name' : 'ulti-snippets',
            \ }
NeoBundle 'honza/vim-snippets', {
            \ 'name' : 'vim-snippets',
            \ }

" insert or delete brackets, parens, quotes in pair{{{2
" NeoBundleLazy 'Raimondi/delimitMate'
NeoBundle 'jiangmiao/auto-pairs', {
            \ 'name' : 'auto-pairs',
            \ }

" set the undotree visually{{{2
NeoBundleLazy 'sjl/gundo.vim', {
            \ 'name'     : 'gundo',
            \ 'commands' : [
            \               { 'name': ['GundoToggle']},
            \              ],
            \ }

" manage the yanked text{{{2
NeoBundle 'vim-scripts/YankRing.vim', {
            \ 'name' : 'yank-ring',
            \ }

" toggle comment{{{2
NeoBundle 'tomtom/tcomment_vim', {
            \ 'name' : 'tcomment',
            \ }
" NeoBundleLazy 'tpope/vim-commentary'

" align text{{{2
NeoBundleLazy 'godlygeek/tabular', {
            \ 'name'     : 'tabular',
            \ 'commands' : [
            \               { 'name': ['Tabularize']},
            \              ],
            \ }
NeoBundleLazy 'junegunn/vim-easy-align', {
            \ 'name'     : 'easy-align',
            \ 'mappings' : '<plug>(EasyAlign)',
            \ 'commands' : [
            \               { 'name' : ['EasyAlign']},
            \              ],
            \ }

" focuss on a region and make the rest inaccessible (narrow region){{{2
NeoBundle 'chrisbra/NrrwRgn', {
            \ 'name' : 'narrow-region',
            \ }

" edit code embedded in other code, through a temp buffer{{{2
NeoBundleLazy 'AndrewRadev/inline_edit.vim', {
            \ 'name'     : 'inline-edit',
            \ 'commands' : [
            \               { 'name': ['InlineEdit']},
            \              ],
            \ }

" highlight text while running substitute{{{2
NeoBundleLazy 'osyo-manga/vim-over', {
            \ 'name'     : 'over',
            \ 'commands' : [
            \               { 'name': ['OverCommandLine']},
            \              ],
            \ }

" multiple selection{{{2
NeoBundleLazy 'terryma/vim-multiple-cursors', {
            \ 'name'     : 'multiple-cursors',
            \ 'mappings' : '<c-n>',
            \ }

" exchange text in two places{{{2
NeoBundleLazy 'tommcdo/vim-exchange', {
            \ 'name'     : 'exchange',
            \ 'mappings' : [
            \               ['nxo', 'cx', 'cxx', 'cxc', 'X'],
            \              ],
            \ }

" substitute specific pattern under the cursor{{{2
NeoBundleLazy 'AndrewRadev/switch.vim', {
            \ 'name'     : 'switch',
            \ 'commands' : [
            \               { 'name': ['Switch']},
            \              ],
            \ }

" show differeces of the two part{{{2
NeoBundleLazy 'AndrewRadev/linediff.vim', {
            \ 'name'     : 'line-diff',
            \ 'commands' : [
            \               { 'name': ['Linediff', 'LinediffReset']},
            \              ],
            \ }

" split and joint lines{{{2
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
            \ 'name'     : 'split-join',
            \ 'commands' : [
            \               { 'name': ['SplitjoinJoin', 'SplitjoinSplit']},
            \              ],
            \ }

" insert and append in visual-block mode more useful
NeoBundleLazy 'kana/vim-niceblock', {
            \ 'name'     : 'niceblock',
            \ 'mappings' : '<plug>(niceblock-',
            \ }

" create your own text objects{{{2
NeoBundleLazy 'kana/vim-textobj-user', {
            \ 'name' : 'textobj-user',
            \ }
NeoBundleLazy 'kana/vim-textobj-indent', {
            \ 'name'     : 'textobj-indent',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-indent-'],
            \              ],
            \ }
NeoBundleLazy 'kana/vim-textobj-function', {
            \ 'name'     : 'textobj-function',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-function-'],
            \              ],
            \ }
NeoBundleLazy 'machakann/vim-textobj-functioncall', {
            \ 'name'     : 'textobj-functioncall',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-functioncall-'],
            \              ],
            \ }
NeoBundleLazy 'rhysd/vim-textobj-anyblock', {
            \ 'name'     : 'textobj-anyblock',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-anyblock-'],
            \              ],
            \ }
NeoBundleLazy 'sgur/vim-textobj-parameter', {
            \ 'name'     : 'textobj-parameter',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-parameter-'],
            \              ],
            \ }
NeoBundleLazy 'machakann/vim-textobj-delimited', {
            \ 'name'     : 'textobj-delimited',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-delimited-'],
            \              ],
            \ }
NeoBundleLazy 'rhysd/vim-textobj-continuous-line', {
            \ 'name'     : 'textobj-continuous-line',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', 'iv', 'av'],
            \              ],
            \ }
NeoBundleLazy 'kevin4fly/vim-textobj-brace', {
            \ 'name'     : 'textobj-brace',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-brace-'],
            \              ],
            \ }
NeoBundleLazy 'beloglazov/vim-textobj-quotes', {
            \ 'name'     : 'textobj-quotes',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', 'iq', 'aq'],
            \              ],
            \ }
NeoBundleLazy 'bps/vim-textobj-python', {
            \ 'name'     : 'textobj-python',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-python-'],
            \              ],
            \ }
NeoBundleLazy 'thinca/vim-textobj-comment', {
            \ 'name'     : 'textobj-comment',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-comment-'],
            \              ],
            \ }
NeoBundleLazy 'kana/vim-textobj-line', {
            \ 'name'     : 'textobj-line',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-line-'],
            \              ],
            \ }
NeoBundleLazy 'kana/vim-textobj-entire', {
            \ 'name'     : 'textobj-entire',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-entire-'],
            \              ],
            \ }
NeoBundleLazy 'mattn/vim-textobj-url', {
            \ 'name'     : 'textobj-url',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-url-'],
            \              ],
            \ }
NeoBundleLazy 'kana/vim-textobj-fold', {
            \ 'name'     : 'textobj-fold',
            \ 'depends'  : 'textobj-user',
            \ 'mappings' : [
            \               ['ox', '<plug>(textobj-fold-'],
            \              ],
            \ }

NeoBundleLazy 'kana/vim-operator-user', {
            \ 'name'      : 'operator-user',
            \ 'functions' : 'operator#user#define',
            \ }
NeoBundleLazy 'kana/vim-operator-replace', {
            \ 'name'     : 'operator-replace',
            \ 'depends'  : 'operator-user',
            \ 'mappings' : [
            \               ['nx', '<plug>(operator-replace)'],
            \              ],
            \ }
" NeoBundleLazy 'rhysd/vim-operator-surround', {
"             \ 'depends' : 'operator-user',
"             \ 'autoload': {'mappings' : ['<plug>(operator-surround-']},
"             \ 'name': 'operator-surround',
"             \ }

" leverage the power of vim's compiler system without being constrained by{{{2
" synchronicity.
NeoBundleLazy 'tpope/vim-dispatch', {
            \ 'name'     : 'dispatch',
            \ 'commands' : [
            \               { 'name': ['Make', 'Dispatch', 'FocusDispatch',
            \                          'Start']
            \               }
            \              ],
            \ }

" abbreviate, substitute and search several variations of a word{{{2
NeoBundle 'tpope/vim-abolish', {
            \ 'name' : 'abolish'
            \ }

" deal with pairs of 'surroudings'{{{2
NeoBundleLazy 'tpope/vim-surround', {
            \ 'name'     : 'surround',
            \ 'mappings' : ['<plug>Dsurround', '<plug>Csurround',
            \               '<plug>Ysurround', '<plug>YSurround',
            \               '<plug>Yssurround','<plug>YSsurround',
            \               '<plug>SurroundRepeat',
            \               ['sx', '<plug>VSurround', '<plug>VgSurround'],
            \               ['i', '<plug>Isurround', '<plug>ISurround'],
            \              ],
            \ }

" format text{{{2
" NeoBundle 'reedes/vim-pencil', {
"             \ 'name'     : 'pencil',
"             \ }

" repeat your mapping in normal mode{{{2
NeoBundleLazy 'tpope/vim-repeat', {
            \ 'name'     : 'repeat',
            \ 'mappings' : '.',
            \ }
" repeat your mapping in visual mode{{{2
" NeoBundle 'vim-scripts/visualrepeat', {
"             \ 'name': 'visual-repeat',
"             \ }

" mark, marker and highlight{{{1

" auto check syntax as you save files{{{2
NeoBundle 'scrooloose/syntastic', {
            \ 'name' : 'syntastic',
            \ }

" Lean & mean status/tabline for vim{{{2
NeoBundle 'bling/vim-airline', {
            \ 'name' : 'airline',
            \ }

" set the status line{{{2
" NeoBundleLazy 'Lokaltog/vim-powerline'

" show vertical lines at indentation{{{2
NeoBundle 'Yggdroot/indentLine', {
            \ 'name' : 'indent-line',
            \ }

" manage marks{{{2
NeoBundle 'kshenoy/vim-signature', {
            \ 'name' : 'signature',
            \ }

" provide incremental highlighting for all pattern matches{{{2
NeoBundleLazy 'haya14busa/incsearch.vim', {
            \ 'name'     : 'incsearch',
            \ 'mappings' : ['<plug>(incsearch-'],
            \ }

" show the index of the matched searching results
NeoBundleLazy 'osyo-manga/vim-anzu', {
            \ 'name'     : 'vim-anzu',
            \ 'mappings' : ['<plug>(anzu-'],
            \ }

" improve star motions
NeoBundleLazy 'haya14busa/vim-asterisk', {
            \ 'name'     : 'asterisk',
            \ 'mappings' : ['<plug>(asterisk-'],
            \ }

" sytax highlight for nginx{{{2
NeoBundleLazy 'evanmiller/nginx-vim-syntax', {
            \ 'name'      : 'nginx-syntax',
            \ 'filetypes' : 'nginx',
            \ }

" sytax highlight for getmailrc/msmtprc{{{2
NeoBundleLazy 'vim-scripts/getmail.vim', {
            \ 'name'      : 'getmail-syntax',
            \ 'filetypes' : 'getmailrc',
            \ }
NeoBundleLazy 'wogong/msmtp.vim', {
            \ 'name'      : 'msmtp-syntax',
            \ 'filetypes' : 'msmtp',
            \ }

" misc{{{1

" provides a much simpler way to use some motions{{{2
NeoBundleLazy 'Lokaltog/vim-easymotion', {
            \ 'name'     : 'easy-motion',
            \ 'mappings' : '<plug>(easymotion-',
            \ }

NeoBundleLazy 'bkad/CamelCaseMotion', {
            \ 'name'     : 'camelcase-motion',
            \ 'mappings' : '<plug>CamelCaseMotion_',
            \ }

" accelerate j/k motion{{{2
NeoBundleLazy 'rhysd/accelerated-jk', {
            \ 'name'     : 'accelerated-jk',
            \ 'mappings' : '<plug>(accelerated_jk_',
            \ }

" open URI with your favorite browser{{{2
NeoBundleLazy 'tyru/open-browser.vim', {
            \ 'name'     : 'open-browser',
            \	'mappings' : '<plug>(openbrowser-',
            \ }

" manage your notes{{{2
NeoBundleLazy 'xolox/vim-misc', {
            \ 'name' : 'xolox-misc',
            \ }
NeoBundle 'xolox/vim-notes', {
            \ 'name'    : 'notes',
            \ 'depends' : 'xolox-misc',
            \ }

" handle paste mode{{{2
NeoBundle 'ConradIrwin/vim-bracketed-paste', {
            \ 'name' : 'bracketed-paste',
            \ }

" NeoBundle 'thinca/vim-ref', {
"             \ 'name' : 'vim-ref',
"             \ }

" change the content of quickfix{{{2
NeoBundleLazy 'thinca/vim-qfreplace', {
            \ 'name'     : 'quickfix-replace',
            \ 'commands' : [
            \               { 'name': 'Qfreplace'},
            \              ],
            \ }

" execute whole or part of the editing file{{{2
NeoBundleLazy 'thinca/vim-quickrun', {
            \ 'name'     : 'quickrun',
            \ 'mappings' : '<plug>(quickrun',
            \ 'commands' : [
            \               { 'name': ['QuickRun']},
            \              ],
            \ }

" shell implemented by pure vim script{{{2
NeoBundle 'Shougo/vimshell.vim', {
            \ 'name'     : 'vimshell',
            \ 'commands' : [
            \               { 'name'     : 'VimShell',
            \                 'complete' : 'customlist,vimshell#complete',
            \               },
            \              ],
            \ 'mappings' : '<plug>'
            \ }

" turn a Vim buffer into a terminal emulator{{{2
NeoBundle 'rosenfeld/conque-term', {
            \ 'name' : 'conque-terminal',
            \ }

" complete words in adjacent tmux panes
NeoBundle 'wellle/tmux-complete.vim', {
            \ 'name' : 'tmux-complete',
            \ }

" NeoBundle 'vim-scripts/cecutil'
NeoBundle 'vim-scripts/vis', {
            \ 'name' : 'vis',
            \ }

NeoBundle 'navicore/vissort.vim', {
            \ 'name' : 'vis-sort',
            \ }

" NeoBundle 'powerman/vim-plugin-viewdoc', {
"             \ 'name' : 'view-doc',
"             \ }

" show ascii table
NeoBundleLazy 'vim-scripts/CharTab', {
            \ 'filetypes' : 'all',
            \ 'name'      : 'ascii-table',
            \ }

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
