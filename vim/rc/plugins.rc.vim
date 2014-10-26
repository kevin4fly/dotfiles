" plugins

" settings for neobundle {{{

" utilize 8 processes for installing/updating async
let g:neobundle#install_max_processes = 8

" run :NeoBundleClearCache after writing buffer
autocmd bufwritepost neobundle.rc.vim NeoBundleClearCache

" }}}
" c family related{{{
" settings for YouCompleteme plugin
inoremap <expr><Enter> pumvisible() ? "\<c-y>" : "\<Enter>"
" the python module used to compile the editing file
let g:ycm_global_ycm_extra_conf              =
\ '~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_seed_identifiers_with_syntax       = 1
let g:ycm_complete_in_comments               = 1
nnoremap [t :YcmCompleter GoTo<cr>
nnoremap [d :YcmCompleter GoToDefinition<cr>
nnoremap [r :YcmCompleter GoToDeclaration<cr>
" set a absolute path to path for ycmd server since we use pyenv to change the
" version of python causing it crash
" let g:ycm_path_to_python_interpreter = '~/.pyenv/versions/2.7.8/bin/python2.7'
let g:ycm_path_to_python_interpreter         = '/usr/bin/python2.7'

" set <tab> to trigger snippet, code completion and more
let g:UltiSnipsExpandTrigger                 = "<tab>"
let g:UltiSnipsJumpForwardTrigger            = "<tab>"
let g:UltiSnipsJumpBackwardTrigger           = "<s-tab>"
function! g:UltiSnips_Complete()
  if pumvisible()
    return "\<c-n>"
  endif
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    "if pumvisible()
    "    return "\<c-n>"
    "else
    call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return CodeComplete() . "\<c-r>=SwitchRegion()\<cr>"
        "return CodeComplete() . SwitchRegion()
      endif
    "endif
  endif
  return ""
endfunction

autocmd bufenter *
    \ exec "inoremap <buffer> <silent> " . g:UltiSnipsExpandTrigger .
    \ " <c-r>=g:UltiSnips_Complete()<cr>"

" setting for fswitch
if neobundle#tap('fswitch')
  nmap <silent> <Leader>jj :FSRight<cr>
  nmap <silent> <Leader>jl :FSSplitRight<cr>
  nmap <silent> <Leader>jh :FSSplitLeft<cr>

  call neobundle#untap()
endif

" settings for cpp-enhenced-highlight
if neobundle#tap('cpp-enhanced-highlight')
  let g:cpp_class_scope_highlight           = 1
  let g:cpp_experimental_template_highlight = 1

  call neobundle#untap()
endif

" }}}
" python related{{{

" settings for jedi
if neobundle#tap('jedi')
  let g:jedi#auto_vim_configuration         = 0
  let g:jedi#popup_on_dot                   = 0
  let g:jedi#popup_select_first             = 0
  let g:jedi#completions_enabled            = 0
  let g:jedi#completions_command            = ""
  let g:jedi#show_call_signatures           = 1
  let g:jedi#goto_assignments_command       = ""
  let g:jedi#goto_definitions_command       = ""
  let g:jedi#documentation_command          = ""
  let g:jedi#usages_command                 = "<leader>pu"
  let g:jedi#rename_command                 = "<leader>pr"

  call neobundle#untap()
endif

" settings for pydoc
" man: ~/.vim/bundle/pydoc/ftplugin/python_pydoc.vim s:ShowPyDoc
" line 174: setlocal filetype=man
if neobundle#tap('pydoc')
  let g:pydoc_open_cmd  = 'vsplit'
  let g:pydoc_highlight = 0

  autocmd bufenter *  if bufname("%")=="__doc__" |
                    \     setlocal filetype=man  |
                    \ endif

  call neobundle#untap()
endif

" }}}
" tags related{{{

" settings for tagbar
if neobundle#tap('tagbar')
  function! neobundle#hooks.on_source(bundle)
    " omitting the short help
    let g:tagbar_compact     = 1
    " auto focus when opening tagbar
    let g:tagbar_autofocus   = 1
    let g:tagbar_autoshowtag = 1
  endfunction
  " toggle tagbar
  nnoremap <silent> <leader>ta :TagbarToggle<cr>

  call neobundle#untap()
endif

" settings for autotag
" ctags: ~/.vim/bundle/vim-autotag/plugin/autotag.py
" change line 25 to:
"   CtagsCmd = "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q",

" }}}
" markdown related{{{

" settings for instant-markdown
if neobundle#tap('instant-markdown')
  " slow the instant markdown
  "let g:instant_markdown_slow = 1
  let g:instant_markdown_autostart = 0
  autocmd bufnewfile,bufreadpost *.md,*.mkd set filetype=markdown
  nnoremap <silent> <leader>md :InstantMarkdownPreview<cr>

  call neobundle#untap()
endif

" settings for markdown-syntax
if neobundle#tap('markdown-syntax')
  " diable the folding of markdown
  let g:vim_markdown_folding_disabled = 1

  call neobundle#untap()
endif

" }}}
" file, buffer related{{{

" settings for unite
if neobundle#tap('unite')
  " enable yank history
  let g:unite_source_history_yank_enable         = 1
  let g:unite_source_history_yank_save_clipboard = 1
  let g:yankring_replace_n_pkey                  = 'gp'
  let g:yankring_replace_n_nkey                  = 'gn'
  " change prompt and start NOT in insert mode
  call unite#custom#profile('default', 'context',
                          \ { 'prompt': '» ',
                          \   'start_insert' : '0'})
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  nnoremap [unite]   <Nop>
  nmap     <leader>f [unite]
  nnoremap <silent>  [unite]a :<c-u>Unite -toggle -buffer-name=files
                                        \ file_rec/async<cr><c-u>
  nnoremap <silent>  [unite]b :<c-u>Unite -toggle -buffer-name=buffer
                                        \ buffer<cr>
  nnoremap <silent>  [unite]c :<c-u>Unite -toggle -buffer-name=command\ history
                                        \ history/command<cr>
  nnoremap <silent>  [unite]d :<c-u>Unite -toggle -buffer-name=mru\ directory
                                        \ neomru/directory<cr><c-u>
  nnoremap <silent>  [unite]f :<c-u>Unite -toggle -buffer-name=file
                                        \ file<cr><c-u>
  nnoremap <silent>  [unite]g :<c-u>Unite -toggle -buffer-name=grep
                                        \ grep:.<cr>
  nnoremap <silent>  [unite]h :<c-u>Unite -toggle -buffer-name=yank\ history
                                        \ history/yank<cr>
  nnoremap <silent>  [unite]l :<c-u>Unite -toggle -buffer-name=line
                                        \ line<cr>
  nnoremap <silent>  [unite]m :<c-u>Unite -toggle -buffer-name=mark
                                        \ mark<cr>
  nnoremap <silent>  [unite]o :<c-u>Unite -toggle -buffer-name=outline
                                        \ outline<cr>
  nnoremap <silent>  [unite]p :<c-u>Unite -toggle -buffer-name=help
                                        \ help<cr>
  nnoremap <silent>  [unite]k :<c-u>Unite -quick-match -buffer-name=quick\ match
                                        \ -no-split buffer<cr>
  nnoremap <silent>  [unite]r :<c-u>Unite -toggle -buffer-name=register
                                        \ register<cr>
  nnoremap <silent>  [unite]s :<c-u>Unite -toggle -buffer-name=session
                                        \ session<cr>
  nnoremap <silent>  [unite]u :<c-u>Unite -toggle -buffer-name=mru\ file
                                        \ neomru/file<cr>
  " add more handy actions
  autocmd filetype unite call s:unite_settings()

  function! s:unite_settings()
    nnoremap <silent> <buffer><expr> v unite#do_action('right')
    inoremap <silent> <buffer><expr> <c-v> unite#do_action('right')
    nnoremap <silent> <buffer><expr> s unite#do_action('below')
    inoremap <silent> <buffer><expr> <c-s> unite#do_action('below')
    nnoremap <silent> <buffer><expr> l unite#do_action('default')
    inoremap <silent> <buffer><expr> <c-l> unite#do_action('default')
    nnoremap <silent> <buffer><expr> w unite#do_action('mkdir')
    nnoremap <silent> <buffer><expr> c unite#do_action('cd')
    inoremap <silent> <buffer><expr> <c-c> unite#do_action('cd')
    nmap <silent> <buffer> h         <plug>(unite_exit)
    nmap <silent> <buffer> H         <plug>(unite_all_exit)
    nmap <silent> <buffer> <c-o>      <plug>(unite_redraw)
    imap <silent> <buffer> <c-o>      <plug>(unite_redraw)
    imap <silent> <buffer> <c-j>     <plug>(unite_select_next_line)
    imap <silent> <buffer> <c-k>     <plug>(unite_select_previous_line)

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
      nnoremap <silent> <buffer><expr> r unite#do_action('replace')
    else
      nnoremap <silent> <buffer><expr> r unite#do_action('rename')
    endif
  endfunction

  call neobundle#untap()
endif

" settings for unite-session
if neobundle#tap('unite-session')
  " save session automatically.
  let g:unite_source_session_enable_auto_save = 1
  " load session automatically.
  " autocmd VimEnter * UniteSessionLoad

  call neobundle#untap()
endif

" settings for vimfiler
if neobundle#tap('vimfiler')
  " like textmate icons.
  let g:vimfiler_tree_leaf_icon             = ' '
  let g:vimfiler_tree_opened_icon           = '▾'
  let g:vimfiler_tree_closed_icon           = '▸'
  let g:vimfiler_file_icon                  = ' '
  let g:vimfiler_readonly_file_icon         = '✗'
  let g:vimfiler_marked_file_icon           = '✓'
  let g:vimfiler_safe_mode_by_default       = 0
  " show airline's statusline
	let g:vimfiler_force_overwrite_statusline = 0
  " toggle vimfiler and vimfilerexplorer
  nnoremap <silent> <leader>tr   :<C-u>VimFiler<CR>
  nnoremap <silent> <leader>tt   :<C-u>VimFilerExplorer<CR>
  " change mappings <c-j> <c-l> to avoid confliction
  function! neobundle#hooks.on_post_source(bundle)
    function! s:vimfiler_settings()
      nnoremap <silent><buffer> <c-j> :bprevious<cr>
      nnoremap <silent><buffer> <c-l> :tabnext<cr>
      nnoremap <silent><buffer> <c-o> <plug>(vimfiler_redraw_screen)
    endfunction
    autocmd filetype vimfiler call s:vimfiler_settings()
  endfunction

  call neobundle#untap()
endif

" settings for golden-view
if neobundle#tap('golden-view')
  let g:goldenview__enable_default_mapping = 0
  nmap <silent> <c-w>i     <plug>GoldenViewSplit
  nmap <silent> <c-w>u     <plug>GoldenViewSwitchMain
  nmap <silent> <c-w><c-u> <plug>GoldenViewSwitchToggle

  call neobundle#untap()
endif

" settings for bbye
if neobundle#tap('bbye')
  " close the current buffer
  nnoremap <silent> <leader>dd :Bdelete!<cr>
  " close all the buffers: from #1 to #1000
  nnoremap <silent> <leader>da :bufdo :Bdelete<cr>

  call neobundle#untap()
endif
" }}}
" text handling related{{{

" settings for auto-pairs
if neobundle#tap('auto-pairs')
  let g:AutoPairsShortcutToggle        = '<F3>'
  let g:AutoPairsMapBS                 = 0
  let g:AutoPairs                      =
              \ {'<':'>', '(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
  inoremap <buffer> <silent> <c-f> <c-r>=AutoPairsDelete()<cr>
  autocmd filetype c,cpp,python
              \ let b:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

  call neobundle#untap()
endif

" settings for gundo
if neobundle#tap('gundo')
  nnoremap <silent> <leader>uu :GundoToggle<cr>
  let g:gundo_help                  = 0

  call neobundle#untap()
endif

" settings for easy-motion
if neobundle#tap('easy-motion')
  let g:EasyMotion_smartcase        = 1
  let g:EasyMotion_leader_key       = '<space>'
  nmap <silent> s <plug>(easymotion-s)
  nmap <silent> S <plug>(easymotion-f)
  omap <silent> z <plug>(easymotion-s)
  omap <silent> Z <plug>(easymotion-f)

  call neobundle#untap()
endif

" settings for yank-ring
if neobundle#tap('yank-ring')
  let g:yankring_history_dir        = '~/.vimtmp/yankring'
  " this is so that single char deletes don't end up in the yankring
  let g:yankring_min_element_length = 2
  let g:yankring_window_height      = 14
  nmap <silent> <c-y> :YRShow<cr>

  " this makes Y yank from the cursor ts the end of the line, which makes more
  " sense than the default of yanking the whole current line (we can use yy for
  " that)
  function! YRRunAfterMaps()
    nnoremap <silent> Y :<c-u>YRYankCount 'y$'<cr>
  endfunction

  call neobundle#untap()
endif

" settings for tcomment
if neobundle#tap('tcomment')
  " for c language using // instead of /* ... */
  let g:tcomment_types              = {'c':'// %s'}
  "nmap <silent> gc <plug>TComment_<c-_>\|
  "        \:call repeat#set("\<plug>TComment_<c-_>", v:count)<cr>
  "vmap <silent> gc <plug>TComment_<c-_>\|
  "        \:call visualrepeat#set("\<plug>TComment_<c-_>", v:count)<cr>
  "" comment out block and for [repeat]
  nmap <silent> gb <plug>TComment_<c-_>b\|
         \:call repeat#set("\<plug>TComment_<c-_>b", v:count)<cr>
  "vmap <silent> gb <plug>TComment_<c-_>b\|
  "        \:call visualrepeat#set("\<plug>TComment_<c-_>b", v:count)<cr>

  call neobundle#untap()
endif

" settings for tabular
if neobundle#tap('tabular')
  nnoremap <leader>ll :Tabularize /
  vnoremap <leader>ll :Tabularize /

  call neobundle#untap()
endif
" settings for easy-align
if neobundle#tap('easy-align')
  vmap <enter>   <plug>(EasyAlign)
  nmap <leader>a <plug>(EasyAlign)

  call neobundle#untap()
endif

" settings for fugitive
nnoremap <silent> <leader>gg :Gstatus<cr>
if neobundle#tap('fugitive')
  function! neobundle#tapped.hooks.on_post_source(bundle)
    doautoall fugitive BufNewFile
  endfunction

  call neobundle#untap()
endif

" settings for narrow region
if neobundle#tap('narrow-region')
  " split narrow region vertically
  let g:nrrw_rgn_vert         = 1
  " show the splited window above/left side
  let g:nrrw_topbot_leftright = 'botright'
  " set width of the narrow region window
  let g:nrrw_rgn_wdth         = 100
  vmap <silent> <c-r> <plug>NrrwrgnDo
  " vmap <silent> <c-r> <plug>NrrwrgnDo\|
  "         \:call visualrepeat#set("\<plug>NrrwrgnDo", v:count)<cr>

  call neobundle#untap()
endif


" settings for inline edit
if neobundle#tap('inline-edit')
  " normal mode:
  nnoremap <silent> <c-e> :InlineEdit<cr>
  " visual mode:
  vnoremap <silent> <c-e> :InlineEdit<cr>

  call neobundle#untap()
endif

" settings for vim-over
if neobundle#tap('over')
  let g:over_command_line_prompt             = ">> "
  " escape characters
  let g:over#command_line#paste_escape_chars = '/.*$^~'
  " set the key mapping used on the command line
  let g:over_command_line_key_mappings       = {
          \	"\<c-l>" : "\<right>",
          \	"\<c-h>" : "\<left>",
          \ "\<c-f>" : "\<bs>",
          \}
  " escape "\n" and "\r" automatically.
  let g:over#command_line#paste_filters      = {
          \	"\n" : '\\n',
          \	"\r" : '\\r',
          \}
  nnoremap <silent> <c-s> :OverCommandLine<cr>
  vnoremap <silent> <c-s> :OverCommandLine<cr>

  call neobundle#untap()
endif

" settings for switch
if neobundle#tap('switch')
  nnoremap <silent> - :Switch<cr>

  call neobundle#untap()
endif

" settings for line-diff
if neobundle#tap('line-diff')
  vnoremap <silent> <c-l> :Linediff<cr>

  call neobundle#untap()
endif

" settings for join&split lines
if neobundle#tap('split-join')
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_join_mapping  = ''
  nmap gk :SplitjoinSplit<cr>
  nmap gj :SplitjoinJoin<cr>

  call neobundle#untap()
endif

" settings for text-object-user
" for text-object-indent
if neobundle#tap('textobj-indent')
  let g:textobj_indent_no_default_key_mappings = 1
  omap ai <plug>(textobj-indent-a)
  omap ii <plug>(textobj-indent-i)
  xmap ai <plug>(textobj-indent-a)
  xmap ii <plug>(textobj-indent-i)

  call neobundle#untap()
endif

" for text-object-function
if neobundle#tap('textobj-function')
  let g:textobj_function_no_default_key_mappings = 1
	omap af	<plug>(textobj-function-a)
	omap if	<plug>(textobj-function-i)
	xmap af	<plug>(textobj-function-a)
	xmap if	<plug>(textobj-function-i)

  call neobundle#untap()
endif

" for text-object-anyblock
if neobundle#tap('textobj-anyblock')
  let g:textobj_anyblock_no_default_key_mappings = 1
	omap ab	<plug>(textobj-anyblock-a)
	omap ib	<plug>(textobj-anyblock-i)
	xmap ab	<plug>(textobj-anyblock-a)
	xmap ib	<plug>(textobj-anyblock-i)

  call neobundle#untap()
endif

" for niceblock
if neobundle#tap('niceblock') "{{{
  xmap I  <plug>(niceblock-I)
  xmap A  <plug>(niceblock-A)

  call neobundle#untap()
endif

" for text-object-delimited
if neobundle#tap('textobj-delimited')
  let g:textobj_delimited_no_default_key_mappings = 1
  " let g:textobj_delimited_patterns = [
  "   \ ['[@#$%&*]', '\<\%([@#$%&*]\k\+\|\k\+[@#$%&*]\)\%(\k*[@#$%&*]\?\)*\>'],
  "   \ ['[_=+/|-]', '\<\%([_=+/|-]\k\+\|\k\+[_=+/|-]\)\%(\k*[_=+/|-]\?\)*\>'],
  "   \ ['[:;,.\?]', '\<\%([:;,.\?]\k\+\|\k\+[:;,.\?]\)\%(\k*[:;,.\?]\?\)*\>'],
  "   \ ['\C\ze[A-Z]', '\C\<[A-Z]\?\k\+[A-Z]\%(\k*[A-Z]\?\)*\>'],
  "   \ ]
	omap ad	<plug>(textobj-delimited-forward-a)
	omap id	<plug>(textobj-delimited-forward-i)
	xmap ad	<plug>(textobj-delimited-forward-a)
	xmap id	<plug>(textobj-delimited-forward-i)

  call neobundle#untap()
endif

" for text object python
if neobundle#tap('textobj-python')
" '<c-f>' stands for python method
  xmap a<c-f> <plug>(textobj-python-function-a)
  omap a<c-f> <plug>(textobj-python-function-a)
  xmap i<c-f> <plug>(textobj-python-function-i)
  omap i<c-f> <plug>(textobj-python-function-i)
" <c-c> stands for pyton class
  xmap a<c-c> <plug>(textobj-python-class-a)
  omap a<c-c> <plug>(textobj-python-class-a)
  xmap i<c-c> <plug>(textobj-python-class-i)
  omap i<c-c> <plug>(textobj-python-class-i)

  call neobundle#untap()
endif

" settings for operator-user
" for operator-surround
" if neobundle#tap('operator-surround')
"   " operator mappings
"   nmap <silent>ys <plug>(operator-surround-append)
"   nmap <silent>ds <plug>(operator-surround-delete)
"   nmap <silent>cs <plug>(operator-surround-replace)
"   " if you use vim-textobj-anyblock
"   nmap <silent>dss <plug>(operator-surround-delete)<plug>(textobj-anyblock-a)
"   nmap <silent>css <plug>(operator-surround-replace)<plug>(textobj-anyblock-a)
"
"   call neobundle#untap()
" endif

" settings for surround
if neobundle#tap('surround')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:surround_no_mappings        = 1
    let g:surround_no_insert_mappings = 1
  endfunction

  nmap ds     <plug>Dsurround
  nmap cs     <plug>Csurround
  nmap ys     <plug>Ysurround
  nmap yS     <plug>YSurround
  nmap yss    <plug>Yssurround
  nmap ySs    <plug>YSsurround
  nmap ySS    <plug>YSsurround
  xmap s      <plug>VSurround
  xmap gS     <plug>VgSurround
  imap <C-S>  <plug>Isurround
  imap <C-G>s <plug>Isurround
  imap <C-G>S <plug>ISurround

  call neobundle#untap()
endif

" }}}
" mark, marker and highlight{{{

" settings for syntastic
if neobundle#tap('syntastic')
  let g:syntastic_error_symbol               = '✗'
  let g:syntastic_style_error_symbol         = '✠'
  let g:syntastic_warning_symbol             = '∆'
  let g:syntastic_style_warning_symbol       = '≈'

  call neobundle#untap()
endif

" settings for airline
if neobundle#tap('airline')
  let g:airline#extensions#tabline#enabled   = 1
  let g:airline#extensions#tabline#fnamemod  = ':t'
  let g:airline_powerline_fonts              = 1
  let g:airline_section_c                    = '%F'
  let g:airline_section_z                    =
      \'%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%l/%L%#__restore__#:%3c'

  call neobundle#untap()
endif

" settings for signify
if neobundle#tap('signify')
  let g:signify_vcs_list                     = [ 'git', 'hg' ]
  let g:signify_difftool                     = 'vimdiff'
  let g:signify_sign_add                     = '+'
  let g:signify_sign_change                  = '*'
  let g:signify_sign_delete                  = '-'
  let g:signify_sign_delete_first_line       = '^'
  " for [repeat]
  nmap <silent> [c <plug>(signify-prev-hunk)\|
          \:call repeat#set("\<plug>(signify-prev-hunk)", v:count)<cr>
  nmap <silent> ]c <plug>(signify-next-hunk)\|
          \:call repeat#set("\<plug>(signify-next-hunk)", v:count)<cr>

  " set colors for signiry
  " highlight lines in Sy and vimdiff etc.)
  highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
  highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
  highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
  " highlight signs in Sy
  highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
  highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
  highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

  call neobundle#untap()
endif

" settings for indentline
if neobundle#tap('indent-line')
  let g:indentLine_faster   = 1
  let g:indentLine_fileType = ['c', 'cpp', 'java', 'python', 'php', 'perl',
        \ 'ruby']
  nnoremap <silent> <leader>ii :IndentLinesToggle<cr>

  call neobundle#untap()
endif

" settings for notes
if neobundle#tap('notes')
  let g:notes_directories              = ['~/work/Notes']

  call neobundle#untap()
endif

"}}}
" misc {{{

" settings for openbrowser
if neobundle#tap('open-browser')
  nmap <silent> [b <plug>(openbrowser-open)\|
          \:call repeat#set("\<plug>(openbrowser-open)", v:count)<cr>
  " vmap <silent> [b <plug>(openbrowser-open)\|
  "         \:call visualrepeat#set("\<plug>(openbrowser-open)", v:count)<cr>

  call neobundle#untap()
endif

" settings for gista
if neobundle#tap('gista')
  " help: ~/.vim/bundle/vim-gista/autoload/gista/interface.vim
  " line 170: ? line 177: * line: 235 comment out
  let g:gista#github_user              = 'kevin4fly'
  let g:gista#directory                = '~/.vimtmp/gista/'
  let g:gista#default_yank_method      = 'gistid'
  " let g:gista#close_list_after_open = 1

  call neobundle#untap()
endif

" }}}

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
