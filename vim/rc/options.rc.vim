" options

" run :options to compare the result and take it as a reference

" 1 important{{{1

" please refer to ~/.vimrc for important options

" 2 move around, searching and patterns{{{1

" list of flags specifying which commands wrap to another line
" commands: <bs>, <space>, <left>, <right>, h and l keys
set whichwrap=b,s,<,>,h,l

" many jump commands move the cursor to the first non-blank
" character of a line
set nostartofline

" nroff macro names that separate paragraphs
" set paragraphs=

" nroff macro names that separate sections
" set sections=

" list of directory names used for file searching
" search relative to the directory of the current file, use
" :set path=.
" search c library files
" :set path=/usr/include
" search in the current directory use an empty string between two commas
" :set path=,,
set path=.,/usr/include,,

" list of directory names used for :cd
" set cdpath=$CDPATH

" change to directory of file in buffer
set noautochdir

" search commands wrap around the end of the buffer
set wrapscan

" show match for partly typed search command
" I have installed 'haya14busa/incsearch.vim' vim plugins to enhance it
set incsearch

" change the way backslashes are used in search patterns
set magic

" select the default regexp engine used
" set regexpengine=

" ignore case when using a search pattern
set ignorecase

" override 'ignorecase' when pattern has upper case characters
set smartcase

" what method to use for changing case of letters
" set casemap=

" maximum amount of memory in Kbyte used for pattern matching
" set maxmempattern=

" pattern for a macro definition line
" set define=

" pattern for an include-file line
" set include=

" expression used to transform an include line to a file name
" set includeexpr=

" 3 tags{{{1

" please refer to tags.rc.vim for tags options

" 4 displaying text{{{1

" number of lines to scroll for CTRL-U and CTRL-D
" set scroll=

" number of screen lines to show around the cursor
set scrolloff=7

" long lines wrap
set wrap

" wrap long lines at a character in 'breakat'
set linebreak

" preserve indentation in wrapped text
set breakindent

" adjust breakindent behaviour
" set breakindentopt=

" which characters might cause a line break
" set breakat=

" string to put before wrapped screen lines
" set showbreak=

" minimal number of columns to scroll horizontally
" set sidescroll=

" minimal number of columns to keep left and right of the cursor
set sidescrolloff=7

" include "lastline" to show the last line even if it doesn't fit
" include "uhex" to show unprintable characters as a hex number
" set display=

" characters to use for the status line, folds and filler lines
" set fillchars=

" number of lines used for the command-line
set cmdheight=2

" width of the display
" set columns=

" number of lines in the display
" set lines=

" number of lines to scroll for CTRL-F and CTRL-B
" set window=

" don't redraw while executing macros
set lazyredraw

" timeout for 'hlsearch' and :match highlighting in msec
" set redrawtime=

" delay in msec for each char written to the display
" set writedelay=

" show <Tab> as ^I and end-of-line as $
" set nolist

" list of strings used for list mode
set listchars=eol:$,tab:▸.,trail:-,extends:»,precedes:«,nbsp:%

" show the line number for each line
set number

" show the relative line number for each line
set norelativenumber

" number of columns to use for the line number
" set numberwidth=

" controls whether concealable text is hidden
" set conceallevel=

" modes in which text in the cursor line can be concealed
" set concealcursor=

" 5 syntax, highlighting and spelling{{{1

" number of terminal colors
set t_Co=256

" "dark" or "light"; the background color brightness
set background=dark

" type of file; triggers the FileType event when set
" set filetype=

" name of syntax highlighting used
syntax enable

" color: ~/.vim/bundle/molokai/colors/molokai.vim
" change line 187 to: hi PmenuSel        ctermfg=red ctermbg=16    cterm=bold
colorscheme molokai
let base16colorspace=256
" popup menu for terminal: red frontgroud and black backgroud
highlight PmenuSel ctermfg=red ctermbg=16 cterm=bold
" set comment font to italic
highlight Comment                         cterm=italic

"see also: http://superuser.com/questions/399296/256-color-support-for-vim-background-in-tmux/562423#562423
set t_ut=

" maximum column to look for syntax items
" set synmaxcol=

" which highlighting to use for various occasionshighlight
" set highlight=

" highlight all matches for the last used search pattern
set hlsearch

" trigger highlight or not after searching
nnoremap <silent> <leader><cr> :setlocal hlsearch!<cr>

" highlight the screen column of the cursor
" set cursorcolumn

" trigger cursorcolumn line
nnoremap <silent> <leader>co :setlocal cursorcolumn!<cr>

" highlight the screen line of the cursor
set cursorline

" columns to highlight
set colorcolumn=78

" trigger colorcolumn line
nnoremap <silent> <leader>cc :if &colorcolumn             \|
                            \    setlocal colorcolumn=0   \|
                            \ else                        \|
                            \    setlocal colorcolumn=78  \|
                            \ endif<cr>

" spell	highlight spelling mistakes
set nospell

" list of accepted languages
set spelllang=en_us

" Toggle and untoggle spell checking
noremap <silent> <leader>ss :setlocal spell! spelllang=en_us<cr>

" file that "zg" adds good words to
set spellfile=~/.vim/spell/en.utf-8.add

" pattern to locate the end of a sentence
" set spellcapcheck=

" methods used to suggest corrections
" set spellsuggest=

" amount of memory used by :mkspell before compressing
" set mkspellmem=

" 6 multiple windows{{{1

" when to use a status line for the last window
" 0: never
" 1: only if there are at least two windows
" 2: always
set laststatus=2

" alternate format to be used for a status line
" I have installed 'bling/vim-airline' vim plugins to enhance it
" set statusline=

" make all windows the same size when adding/removing windows
" set equalalways

" in which direction 'equalalways' works: "ver", "hor" or "both"
" set eadirection=ver

" minimal number of lines used for the current window
" set winheight=

" minimal number of lines used for any window
" set winminheight=

" keep the height of the window
" set nowinfixheight

" keep the width of the window
" set nowinfixwidth

" minimal number of columns used for the current window
" set winwidth=

" minimal number of columns used for any window
" set winminwidth=

" initial height of the help window
" set helpheight=

" default height for the preview window
" set previewheight=

" identifies the preview window
" set nopreviewwindow

" don't unload a buffer when no longer shown in a window
set hidden

"  which window to use when jumping to a buffer
set switchbuf=useopen,usetab

" a new window is put below the current one
" set splitbelow

" a new window is put right of the current one
set splitright

" this window scrolls together with other bound windows
" set noscrollbind

" "ver", "hor" and/or "jump"; list of options for 'scrollbind'
" set scrollopt=

" this window's cursor moves together with other bound windows
" set nocursorbind

" 7 multiple tab pages{{{1

" when to use a tab pages line
" 0: never
" 1: only if there are at least two tab pages
" 2: always
set showtabline=2

" maximum number of tab pages to open for -p and "tab all"
" set tabpagemax=

" custom tab pages line
" I have installed 'bling/vim-airline' vim plugins to enhance it
" set tabline=

" 8 terminal{{{1

" name of the used terminal
" set term=

" alias for 'term'
" set ttytype=

" check built-in termcaps first
" set ttybuiltin

" terminal connection is fast
" set ttyfast

" terminal that requires extra redrawing
" set noweirdinvert

" recognize keys that start with <Esc> in Insert mode
" set esckeys

" minimal number of lines to scroll at a time
" set scrolljump=

" maximum number of lines to use scrolling instead of redrawing
" set ttyscroll=

" show info in the window title
" set title

" percentage of 'columns' used for the window title
" set titlelen=

" when not empty, string to be used for the window title
" set titlestring=

" string to restore the title to when exiting Vim
" set titleold=

" set the text of the icon for this window
" set icon

" when not empty, text for the icon of this window
" set iconstring=

" 9 using the mouse{{{1

" list of flags for using the mouse
if has('mouse')
  set mouse=a
endif

" the window with the mouse pointer becomes the current one
" set mousefocus

" hide the mouse pointer while typing
" set mousehide

" "extend", "popup" or "popup_setpos"; what the right mouse button is used for
" set mousem=

" maximum time in msec to recognize a double-click
" set mousetime=500

" "xterm", "xterm2", "dec" or "netterm"; type of mouse
" set ttymouse=

" what the mouse pointer looks like in different modes
" set mouseshape=

" 10 GUI{{{1

" please refer to gui.rc.vim for GUI options

" 11 printing{{{1

" list of items that control the format of :hardcopy output
" set printoptions=

" name of the printer to be used for :hardcopy
" set printdevice=

" expression used to print the PostScript file for :hardcopy
" set printexpr=

" name of the font to be used for :hardcopy
" set printfont=

" format of the header used for :hardcopy
" set printheader=

" encoding used to print the PostScript file for :hardcopy
" set printencoding=

" the CJK character set to be used for CJK output from :hardcopy
" set printmbcharset=

" list of font names to be used for CJK output from :hardcopy
" set printmbfont=

" 12 messages and info{{{1

" add 's' flag in 'shortmess' (don't show search message)
" set noterse

" list of flags to make messages shorter
" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" show (partial) command keys in the status line
set showcmd

" display the current mode in the status line
set showmode

" show cursor position below each window
" I have installed 'bling/vim-airline' vim plugins to enhance it
set noruler

" alternate format to be used for the ruler
" set rulerformat=

" threshold for reporting number of changed lines
" set report=2

" the higher the more messages are given
" set verbose=

" file to write messages in
" set verbosefile=

" pause listings when the screen is full
" set more

" start a dialog when a command fails
" set noconfirm

" ring the bell for error messages
set noerrorbells

" use a visual bell instead of beeping
set novisualbell

" visual bell
set t_vb=

" list of preferred languages for finding help
" set helplang=

" 13 selecting text{{{1

" "old", "inclusive" or "exclusive"; how selecting text behaves
" set selection=

" "mouse", "key" and/or "cmd"; when to start Select mode instead of Visual mode
" set selectmode=

"unnamed" to use the * register like unnamed register
"autoselect" to always put selected text on the clipboard
if has('unnamedplus')
" By default, Vim will not use the system clipboard when yanking/pasting to
" the default register. This option makes Vim use the system default
" clipboard.
" Note that on X11, there are _two_ system clipboards: the "standard" one, and
" the selection/mouse-middle-click one. Vim sees the standard one as register
" '+' (and this option makes Vim use it by default) and the selection one as
" '*'.
" See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
" Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

"startsel" and/or "stopsel"; what special keys can do
set keymodel=

" 14 editing text{{{1

" maximum number of changes that can be undone
set undolevels=1000

" maximum number lines to save for undo on a buffer reload
" set undoreload=10000

" changes have been made and not written to a file
" set modified

" buffer is not to be written
" set readonly

" changes to the text are not possible
" set modifiable

" line length above which to break a line
set textwidth=78

" margin from the right in which to break a line
" set wrapmargin=

" specifies what <BS>, CTRL-W, etc. can do in Insert mode
set backspace=eol,start,indent

" definition of what comment lines look like
" set comments=

" list of flags that tell how automatic formatting works
" remove a comment leader when joining lines
set formatoptions+=j
" recognize numbered lists
set formatoptions+=n

" pattern to recognize a numbered list
" set formatlistpat=

" expression used for "gq" to format lines
" set formatexpr=

" specifies how Insert mode completion works for CTRL-N and CTRL-P
" set complete=

" whether to use a popup menu for Insert mode completion
" menu:     use a popup menu to show the possible completion
" menuone:  use a popup menu to show the possible completion even if there is
"           only one
" longeset: only insert the longest common text of the matches
" preview:  show extra information about the currectly selected completion in
"           the preview window
set completeopt=menu,menuone,longest

" maximum height of the popup menu
" set pumheight=

" user defined function for Insert mode completion
" set completefunc=

" function for filetype-specific Insert mode completion
" this is used for file type specific completion
" set omnifunc=

" list of dictionary files for keyword completion
" this is used for file type specific dictionary
" set dictionary=

" list of thesaurus files for keyword completion
" set thesaurus=

" adjust case of a keyword completion match
" set noinfercase

" enable entering digraps with c1 <BS> c2
" set nodigraph

" the "~" command behaves like an operator
" set notildeop

" function called for the"g@"  operator
" set operatorfunc=

" when inserting a bracket, briefly jump to its match
set showmatch

" tenth of a second to show a match for 'showmatch'
" set matchtime=

" list of pairs that match for the "%" command
set matchpairs=(:),[:],{:},<:>

" don't showing matched pairs
" keep it here since blinking cursor is quite annoying when matched
" let loaded_matchparen = 1

" use two spaces after '.' when joining a line
" set joinspaces

" "alpha", "octal" and/or "hex"; number formats recognized for CTRL-A and
" CTRL-X commands
" set nrformats=

" 15 tabs and indenting{{{1

" number of spaces a <Tab> in the text stands for
set tabstop=8

" number of spaces used for each step of (auto)indent
set shiftwidth=4

" a <Tab> in an indent inserts 'shiftwidth' spaces
set smarttab

" if non-zero, number of spaces to insert for a <Tab>
set softtabstop=4

" round to 'shiftwidth' for "<<" and ">>"
" set noshiftround

" expand <Tab> to spaces in Insert mode
set expandtab

" don't expand <tab> in .snippets file
autocmd VimConfig bufenter *.snippets setlocal noexpandtab

" automatically set the indent of a new line
set autoindent

" do clever autoindenting
set smartindent

" enable specific indenting for C code
" it will be enabled automatically for C-family files
" set nocindent

" options for C-indenting
" set cinoptions=

" keys that trigger C-indenting in Insert mode
" set cinkeys=

" list of words that cause more C-indent
" set cinwords=

" expression used to obtain the indent of a line
" set indentexpr=

" keys that trigger indenting with 'indentexpr' in Insert mode
" set indentkeys=

" copy whitespace for indenting from previous line
set copyindent

" preserve kind of whitespace when changing indent
" set nopreserveindent

" enable lisp mode
" set nolisp

" words that change how lisp indenting works
" set lispwords=

" 16 folding{{{1

" set to display all folds open
" set foldenable

" folds with a level higher than this number will be closed
set foldlevel=0

" due to incompatible with simply-fold plugin if set foldlevel to 0
autocmd VimConfig filetype python setlocal foldlevel=99

" value for 'foldlevel' when starting to edit a file
" set foldlevelstart=

" width of the column used to indicate folds
" set foldcolumn=

" expression used to display the text of a closed fold
" set foldtext=

" set to "all" to close a fold when the cursor leaves it
" set foldclose=

" specifies for which commands a fold will be opened
" set foldopen=

" minimum number of screen lines for a fold to be closed
" set foldminlines=

" template for comments; used to put the marker in
" set commentstring=

" folding type: "manual", "indent", "expr", "marker" or "syntax"
" set foldmethod=

" expression used when 'foldmethod' is "expr"
" set foldexpr=

" used to ignore lines when 'foldmethod' is "indent"
" set foldignore=

" markers used when 'foldmethod' is "marker"
" set foldmarker=

" maximum fold depth for when 'foldmethod is "indent" or "syntax"
" set foldnestmax=

" 17 diff mode{{{1

" use diff mode for the current window
" set nodiff

" options for using diff mode
" diff buffers in vertical way
set diffopt+=vertical

" expression used to patch a file
" set patchexpr=

" 18 mapping{{{1

" maximum depth of mapping
" set maxmapdepth=

" recognize mappings in mapped keys
" set remap

" allow timing out halfway into a mapping
set timeout

" allow timing out halfway into a key code
" set nottimeout

" time in msec for 'timeout'
" time out on mapping after 1 second
set timeoutlen=1000

" time in msec for 'ttimeout'
" time out on key codes after 50 milliseconds
" set ttimeoutlen=


" 19 reading and writing files{{{1

" enable using settings from modelines when reading a file
" set modeline

" number of lines to check for modelines
" set modelines=

" binary file editing
" set nobinary

" last line in the file has an end-of-line
" set endofline

" prepend a Byte Order Mark to the file
" set nobomb

" end-of-line format: "dos", "unix" or "mac"
" set fileformat=

" list of file formats to look for when editing a file
set fileformats=unix,dos,mac

" obsolete, use 'fileformat'
" set notextmode

" obsolete, use 'fileformats'
" set textauto

" writing files is allowed
" set write

" write a backup file before overwriting a file
set writebackup

" keep a backup after overwriting a file
set backup

" patterns that specify for which files a backup is not made
" set backupskip=

" whether to make the backup as a copy or rename the existing file
" set backupcopy=

" list of directories to put backup files in
set backupdir=~/.vimtmp/backup/

" file name extension for the backup file
" set backupext=

" automatically write a file when leaving a modified buffer
set autowrite

" as 'autowrite', but works with more commands
set autowriteall

" always write without asking for confirmation
set writeany

" automatically read a file when it was modified outside of Vim
set autoread

" keep oldest version of a file; specifies file name extension
" set patchmode=

" forcibly sync the file to disk after writing it
" set fsync

" use 8.3 file names
" set shortname

" encryption method for file writing: zip or blowfish
" set cryptmethod=

" 20 the swap file{{{1

" list of directories for the swap file
set directory=~/.vimtmp/swap/

" use a swap file for this buffer
set swapfile

" "sync", "fsync" or empty; how to flush a swap file to disk
" set swapsync=

" number of characters typed to cause a swap file update
" set updatecount=

" time in msec after which the swap file will be updated
" set updatetime=

" maximum amount of memory in Kbyte used for one buffer
" set maxmem=

" maximum amount of memory in Kbyte used for all buffers
" set maxmemtot=

" 21 command line editing{{{1

" how many command lines are remembered
set history=1000

" key that triggers command-line expansion
" set wildchar=

" like 'wildchar' but can also be used in a mapping
" set wildcharm=

" specifies how command line completion works
set wildmode=full

" list of file name extensions that have a lower priority
" set suffixes=

" list of file name extensions added when searching for a file
" set suffixesadd=

" list of patterns to ignore files for file name completion
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" ignore case when using file names
" set nofileignorecase

" ignore case when completing file names
set wildignorecase

" command-line completion shows a list of matches
set wildmenu

" key used to open the command-line window in command-line mode
set cedit=<c-q>

" height of the command-line window
" set cmdwinheight

" automatically save and restore undo history
set undofile

" list of directories for undo files
set undodir=~/.vimtmp/undo/

" 22 executing external commands{{{1

" name of the shell program used for external commands
" set shell=/bin/bash

" character(s) to enclose a shell command in
" set shellquote=

" like 'shellquote' but include the redirection
" set shellxquote=

" characters to escape when 'shellxquote' is (
" set shellxescape=

" argument for 'shell' to execute a command
" set shellcmdflag=

" used to redirect command output to a file
" set shellredir=

" use a temp file for shell commands instead of using a pipe
" set shelltemp

" program used for "=" command
" set equalprg=

" program used to format lines with "gq" command
" set formatprg=

" program used for the "K" command
" set keywordprg=

" warn when using a shell command and a buffer has changes
" set warn

" 23 running make and jumping to errors{{{1

" name of the file that contains error messages
" set errorfile=

" list of formats for error messages
" set errorformat=

" program used for the ":make" command
" set makeprg=

" string used to put the output of ":make" in the error file
" set shellpipe=

" name of the errorfile for the 'makeprg' command
" set makeef=

" program used for the ":grep" command
" set grepprg=

" list of formats for output of 'grepprg'
" set grepformat=

" 24 language specific{{{1

" specifies the characters in a file name
" set isfname=

" specifies the characters in an identifier
" set isident=

" specifies the characters in a keyword
" set iskeyword=

" specifies printable characters
" set isprint=

" specifies escape characters in a string
" set quoteescape=

" display the buffer right-to-left
" set norightleft

" when to edit the command-line right-to-left
" set rightleftcmd=

" insert characters backwards
" set norevins

" allow CTRL-_ in Insert and Command-line mode to toggle 'revins'
" set noallowrevins

" the ASCII code for the first letter of the Hebrew alphabet
" set aleph=224

" use Hebrew keyboard mapping
" set nohkmap

" use phonetic Hebrew keyboard mapping
" set nohkmapp

" use Farsi as the second language when 'revins' is set
" set noaltkeymap

" use Farsi keyboard mapping
" set nofkmap

" prepare for editing Arabic text
" set noarabic

" perform shaping of Arabic characters
" set arabicshape

" terminal will perform bidi handling
" set termbidi

" name of a keyboard mappping
" set keymap=

" list of characters that are translated in Normal mode
" set langmap=

" don't apply 'langmap' to mapped characters
" set nolangnoremap

" when set never use IM; overrules following IM options
" set noimdisable

" in Insert mode: 1: use :lmap; 2: use IM; 0: neither
" set iminsert=

" entering a search pattern: 1: use :lmap; 2: use IM; 0: neither
" set imsearch=

" when set always use IM when starting to edit a command line
" set noimcmdline

" function to obtain IME status
" set imstatusfunc=

" function to enable/disable IME
" set imactivatefunc=

" 25 multi-byte characters{{{1

" character encoding used in Vim: "latin1", "utf-8" euc-jp", "big5", etc.
" set encoding=

" character encoding for the current file
" set fileencoding=

" automatically detected character encodings
" set fileencodings=

" character encoding used by the terminal
" set termencoding=

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" expression used for character encoding conversion
" set charconvert=

" delete combining (composing) characters on their own
" set nodelcombine

" maximum number of combining (composing) characters displayed
" set maxcombine=

" key that activates the X input method
" set imactivatekey=

" width of ambiguous width characters
" the CJK characters use twice the width of ASCII width
set ambiwidth="double"

" 26 various{{{1

" when to use virtual editing
" block:   allow virtual editing in Visual block mode.
" insert:  allow virtual editing in Insert mode.
" all:	   allow virtual editing in all modes.
" onemore: allow the cursor to move just past the end of the line
set virtualedit=block

" list of autocommand events which are to be ignored
" set eventignore=

" load plugin scripts when starting up
" set loadplugins

" enable reading .vimrc/.exrc/.gvimrc in the current directory
" set noexrc

" safer working with script files in the current directory
" set nosecure

" use the 'g' flag for ":substitute"
" set nogdefault

" 'g' and 'c' flags of ":substitute" toggle
" set noedcompatible

" maximum depth of function calls
" set maxfuncdepth=

" list of words that specifies what to put in a session file
set sessionoptions=buffers,curdir,folds,localoptions,options,tabpages,winsize

" list of words that specifies what to save for :mkview
" set viewoptions=folds,options,cursor

" directory where to store files with :mkview
" set viewdir=~/.vimtmp/view/

" list that specifies what to write in the viminfo file
" '1000: marks will be remembered for the last 1000 files you edited
" f1: all the marks will be stored
" <3000: registers with more than 3000 lines will be skipped
" s100: registers with more than 100 KB will be skipped
" h: the effect of 'hlsearch' will be disabled
" n: the name(location) of the viminfo file
set viminfo='1000,f1,<3000,s100,h,n~/.vimtmp/viminfo/viminfo

" what happens with a buffer when it's no longer in a window
" set bufhidden=

" "", "nofile", "nowrite" or "quickfix": type of buffer
" set buftype

" whether the buffer shows up in the buffer list
" set buflisted

" set to "msg" to see all error messages
" set debug=

" vim:tw=78:ts=8:sw=2:sts=2:et:fdm=marker
