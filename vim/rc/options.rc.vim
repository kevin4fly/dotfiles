" options

" Unicode support (taken from http://vim.wikia.com/wiki/Working_with_Unicode)
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
endif

" set the file format
set fileformat=unix

" auto detect to determin the end-of-file<EOL> formats
set fileformats=unix,dos,mac

" enable syntax highlighting
set background=dark
syntax enable
set t_Co=256

" set timeout for map leader
set timeout timeoutlen=1000 ttimeoutlen=50

" color: ~/.vim/bundle/molokai/colors/molokai.vim
" change line 187 to: hi PmenuSel        ctermfg=red ctermbg=16    cterm=bold
colorscheme molokai
let base16colorspace=256
" popup menu for terminal: red frontgroud and black backgroud
highlight PmenuSel ctermfg=red ctermbg=16 cterm=bold
" set comment font to italic
highlight Comment                         cterm=italic

" make a backup before overwriting a file
set writebackup
" leave it around even after the file has been successfully writen
" set backup
set backup
" set directory for backup files
set backupdir=~/.vimtmp/backup/
" save swap file in case of crash
set swapfile
" set directory for swap file
set dir=~/.vimtmp/swap/

" keep undo file
set undofile
set undolevels=1000
" set directory for undo file
set undodir=~/.vimtmp/undo/

" keep the history of command line
set history=1000

" set viminfo
set viminfo='50,<500,s20,h,n~/.vimtmp/viminfo/viminfo

" show lines number
set number

" enable mouse if needed
if has('mouse')
  set mouse=a
endif

" use spaces instead of tabs, which mean tabs will expand to spaces
set expandtab

" don't expand <tab> in .snippets file
autocmd bufenter *.snippets set noexpandtab

" be smart when using tabs
set smarttab
" set 1 tab moves the cusor 4 columns right when loading the file
set tabstop=4
" set indent value when reindent operation (<<, >>)
set shiftwidth=4
" set 1 tab moves the cusor 4 columns right in insert mode
set softtabstop=4

" specify the behavior when switching between buffers
set switchbuf=useopen,usetab
" show tab page labels always (we have airline tabline)
"set showtabline=2

" put the new split window on the right side
set splitright

" put the new split window on the bottom side
" set splitbelow

" diff buffers in vertical way
set diffopt+=vertical

" hidden buffer when it is abandoned instead of unload from memory
set hidden

" copy indent from current line to new line
set autoindent
" smart indent
set smartindent
" copy indent
set copyindent

" height of the command bar
set cmdheight=2
" always show the status line
set laststatus=2
set showcmd

" tabs and eols
set listchars+=tab:▸\ ,eol:$
" spaces
set listchars+=trail:⋅,nbsp:⋅

" wrap lines to see the whole line instead of truncation or scroll
set wrap
" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" Qap (mapped Q to gq already)
set textwidth=78

" highlight cursor line/colomn
set cursorline
" trigger cursorcolumn line
nnoremap <silent> <leader>co :set cursorcolumn!<cr>

" set vertical line at the end
set colorcolumn=78
" trigger colorcolumn line
nnoremap <silent> <leader>cc :if &colorcolumn             \|
                            \    setlocal colorcolumn=0   \|
                            \ else                        \|
                            \    setlocal colorcolumn=78  \|
                            \ endif<cr>

" don't draw screen while executing macros, registers and commands
set lazyredraw

" auto read if file is changed outside
set autoread
" auto write if file is changed outside
set autowriteall
" auto set change current directory(confilict with vimfiler plugin)
" set autochdir

" set popup menu style, without preview window
set completeopt=menu,menuone,longest

" set minimal number of lines to keep above and below the cursor
set scrolloff=7

" keep the same colume when moving
set nostartofline

" When you type the first tab, it will complete as much as possible, the
" second tab hit will provide a list, the third and subsequent tabs will cycle
" through completion options so you can complete the file without further keys
"set wildmode=longest,list,full
set wildmode=full
" set command line completion with <tab>
set wildmenu

" ignore compiled files, backup files and vcs files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" configure backspace so it acts as it should act
set backspace=eol,start,indent
" allow keys to move to pre/next line if needed
set whichwrap=b,s,<,>,h,l

" ignore case when searching
set ignorecase

" search to be smart about cases
set smartcase

" highlight search results
set hlsearch

" show matched string while typing
set incsearch

" trigger highlight or not after searching
nnoremap <silent> <cr> :set hlsearch!<cr>

" this makes search/replace global by default
set gdefault

" set fold method: marker
" set foldmethod=marker
" all folds open by default
set foldlevelstart=99

" turn magic on for regular expression
set magic

" show matching brackets when text indicator is over them
set showmatch

" chars form pairs
set matchpairs=(:),[:],{:},<:>

" without showing matched brackets
" keep it here since blinking cursor is boring when matched
let loaded_matchparen = 1

" set tenths of a second to blink when matching brackets
set matchtime=1

" set no annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

" square up visual selections
set virtualedit=block

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" remove a comment leader when joining lines
set formatoptions+=j

" don't use alt for menu
set winaltkeys=no

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

" Toggle and untoggle spell checking
noremap <silent> <leader>ss :setlocal spell! spelllang=en_us<cr>
set spellfile=~/.vim/spell/en.utf-8.add

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
