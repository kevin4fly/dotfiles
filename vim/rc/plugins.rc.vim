" plugins

scriptencoding utf-8

" neobundle related{{{1

" settings for neobundle {{{2
if neobundle#tap('neobundle')
  " utilize 8 processes for installing/updating async
  let g:neobundle#install_max_processes   = 8
  " set timeout seconds for updating and installing to 300s due to
  " YouCompleteme, there are many submodules for it
  let g:neobundle#install_process_timeout = 1500

  " run :NeoBundleClearCache after writing buffer
  autocmd VimConfig bufwritepost neobundle.rc.vim NeoBundleClearCache

  call neobundle#untap()
endif

" version-controlling related{{{1

" settings for fugitive{{{2
if neobundle#tap('fugitive')
  function! neobundle#tapped.hooks.on_post_source(bundle)
    nnoremap <silent> <leader>gg :Gstatus<cr>
    doautoall fugitive BufNewFile
  endfunction

  call neobundle#untap()
endif

" settings for signify{{{2
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

  " set colors for signify
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

" settings for gista{{{2
if neobundle#tap('gista')
  " help: ~/.vim/bundle/vim-gista/autoload/gista/interface.vim
  " line 170: ? line 177: * line: 235 comment out
  let g:gista#github_user              = 'kevin4fly'
  let g:gista#directory                = '~/.vimtmp/gista/'
  let g:gista#default_yank_method      = 'gistid'
  " let g:gista#close_list_after_open = 1

  call neobundle#untap()
endif

" c family related{{{1

" settings for YouCompleteme plugin{{{2

" the python module used to compile the editing file
let g:ycm_global_ycm_extra_conf               =
  \ '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars  = 4
" let g:ycm_seed_identifiers_with_syntax        = 1
let g:ycm_complete_in_comments                = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax        = 1

nnoremap [g :YcmCompleter GoTo<cr>
nnoremap [d :YcmCompleter GoToDefinition<cr>
nnoremap [D :YcmCompleter GoToDeclaration<cr>
" set a absolute path to path for ycmd server since we use pyenv to change the
" version of python causing it crash
" let g:ycm_path_to_python_interpreter = '~/.pyenv/versions/2.7.8/bin/python2.7'
let g:ycm_path_to_python_interpreter = '/usr/bin/python2.7'
let g:ycm_filetype_blacklist         = {
                                      \ 'tagbar'  : 1,
                                      \ 'qf'      : 1,
                                      \ 'unite'   : 1,
                                      \ 'vimwiki' : 1,
                                      \ 'pandoc'  : 1,
                                      \ 'infolog' : 1,
                                      \ 'mail'    : 1,
                                      \ }

" set <tab> to trigger snippet, code completion and more
let g:UltiSnipsExpandTrigger         = "<tab>"
let g:UltiSnipsJumpForwardTrigger    = "<tab>"
let g:UltiSnipsJumpBackwardTrigger   = "<s-tab>"
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

autocmd VimConfig bufenter *
      \ execute "inoremap <buffer> <silent> " . g:UltiSnipsExpandTrigger .
      \ " <c-r>=g:UltiSnips_Complete()<cr>"

" setting for fswitch{{{2
if neobundle#tap('fswitch')
  nmap <silent> <leader>jj :FSRight<cr>
  nmap <silent> <leader>jl :FSSplitRight<cr>
  nmap <silent> <leader>jh :FSSplitLeft<cr>

  call neobundle#untap()
endif

" settings for cpp-enhenced-highlight{{{2
if neobundle#tap('cpp-enhanced-highlight')
  let g:cpp_class_scope_highlight           = 1
  let g:cpp_experimental_template_highlight = 1

  call neobundle#untap()
endif

" python related{{{1

" settings for jedi{{{2
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

" settings for ipython{{{2
if neobundle#tap('ipython')
  autocmd VimConfig filetype python
        \ if bufname("%")=="vim-ipython" |
        \   wincmd L                     |
        \ endif

  call neobundle#untap()
endif

" settings for pydoc{{{2
" man: ~/.vim/bundle/pydoc/ftplugin/python_pydoc.vim s:ShowPyDoc
" line 174: setlocal filetype=man
if neobundle#tap('pydoc')
  let g:pydoc_open_cmd  = 'vsplit'
  let g:pydoc_highlight = 0

  autocmd VimConfig bufenter *
        \ if bufname("%")=="__doc__" |
        \     setlocal filetype=man  |
        \ endif

  call neobundle#untap()
endif

" settings for simply-fold{{{2
if neobundle#tap('simply-fold')
  " let g:SimpylFold_docstring_preview = 1
  let g:SimpylFold_fold_docstring    = 0

  call neobundle#untap()
endif

" xml/html related{{{1

" settings for xml-edit
" if neobundle#tap('xml-edit')
"   let g:xml_tag_completion_map = "/"
"   let g:xmledit_enable_html    = 1
"
"   call neobundle#untap()
" endif
" tags related{{{1

" settings for tagbar{{{2
if neobundle#tap('tagbar')
  function! neobundle#hooks.on_source(bundle)
    " omitting the short help
    let g:tagbar_compact          = 1
    " show line numbers
    let g:tagbar_show_linenumbers = 1
    " auto focus when opening tagbar
    let g:tagbar_autofocus        = 1
    let g:tagbar_autoshowtag      = 1
  endfunction
  " toggle tagbar
  nnoremap <silent> <leader>ta :TagbarToggle<cr>

  call neobundle#untap()
endif

" settings for autotag{{{2
" ctags: ~/.vim/bundle/autotag/plugin/autotag.py
" change line 25 to:
"   CtagsCmd = "ctags -R --sort=foldcase --c++-kinds=+p --fields=+iaS --extra=+q"
" }}}
" markdown related{{{1

" settings for instant-markdown{{{2
if neobundle#tap('instant-markdown')
  " slow the instant markdown
  "let g:instant_markdown_slow = 1
  let g:instant_markdown_autostart = 0
  nnoremap <silent> <leader>md :InstantMarkdownPreview<cr>

  call neobundle#untap()
endif

" settings for markdown-syntax{{{2
if neobundle#tap('markdown-syntax')
  " diable the folding of markdown
  let g:vim_markdown_folding_disabled = 1

  call neobundle#untap()
endif

" file, buffer related{{{1

" settings for unite{{{2
if neobundle#tap('unite')
  " enable yank history
  let g:unite_source_history_yank_enable         = 1
  let g:unite_source_history_yank_save_clipboard = 1
  let g:unite_source_mark_marks = "abcdefghijklmnopqrstuvwxyz"
        \ . "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.'`^<>[]{}()\""
  let g:yankring_replace_n_pkey                  = 'tp'
  let g:yankring_replace_n_nkey                  = 'tn'
  let g:unite_marked_icon                        = '✓'
  " use ag in unite grep source
  if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
      \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
      \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
  endif
  " change prompt and start NOT in insert mode
  call unite#custom#profile('default', 'context',
                          \ { 'prompt'       : '➤ ',
                          \   'start_insert' : '0',
                          \ },
                          \)
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  nnoremap [unite]   <nop>
  nmap     <leader>f [unite]
  nnoremap <silent>  [unite]a :<c-u>Unite -toggle -buffer-name=files
                                        \ file_rec/async<cr><c-u>
  nnoremap <silent>  [unite]b :<c-u>Unite -toggle -buffer-name=file
                                        \ file<cr><c-u>
  nnoremap <silent>  [unite]c :<c-u>Unite -toggle -buffer-name=command\ history
                                        \ history/command history/search<cr>
  nnoremap <silent>  [unite]d :<c-u>Unite -toggle -buffer-name=mru\ directory
                                        \ neomru/directory<cr><c-u>
  nnoremap <silent>  [unite]f :<c-u>Unite -toggle -buffer-name=buffer
                                        \ buffer<cr><c-u>
  nnoremap <silent>  [unite]g :<c-u>Unite -toggle -buffer-name=grep
                                        \ grep:<cr>
  nnoremap <silent>  [unite]h :<c-u>Unite -toggle -buffer-name=yank\ history
                                        \ history/yank register<cr><c-u>
  nnoremap <silent>  [unite]l :<c-u>Unite -toggle -buffer-name=line
                                        \ line<cr><c-u>
  nnoremap <silent>  [unite]m :<c-u>Unite -toggle -buffer-name=mark
                                        \ mark<cr><c-u>
  nnoremap <silent>  [unite]o :<c-u>Unite -toggle -buffer-name=outline
                                        \ outline<cr><c-u>
  nnoremap <silent>  [unite]p :<c-u>Unite -toggle -buffer-name=help
                                        \ help<cr><c-u>
  nnoremap <silent>  [unite]k :<c-u>Unite -quick-match -buffer-name=quick\ match
                                        \ -no-split buffer<cr><c-u>
  nnoremap <silent>  [unite]r :<c-u>Unite -toggle -buffer-name=register
                                        \ register<cr><c-u>
  nnoremap <silent>  [unite]s :<c-u>Unite -toggle -buffer-name=session
                                        \ session<cr><c-u>
  nnoremap <silent>  [unite]t :<c-u>Unite -toggle -buffer-name=tag
                                        \ tag<cr><c-u>
  nnoremap <silent>  [unite]u :<c-u>Unite -toggle -buffer-name=mru\ file
                                        \ neomru/file<cr><c-u>
  " add more handy actions
  autocmd VimConfig filetype unite call s:unite_settings()

  function! s:unite_settings()
    nnoremap <silent> <buffer><expr> v unite#do_action('right')
    inoremap <silent> <buffer><expr> <c-v> unite#do_action('right')
    nnoremap <silent> <buffer><expr> s unite#do_action('below')
    inoremap <silent> <buffer><expr> <c-s> unite#do_action('below')
    nnoremap <silent> <buffer><expr> l     unite#do_action('default')
    inoremap <silent> <buffer><expr> <c-l>
          \ getcurpos()[1]==1 ? "\<right>" : unite#do_action('default')
    inoremap <silent> <buffer>       <c-h> <left>
    inoremap <silent> <buffer>       <c-f> <bs>
    inoremap <silent> <buffer>       <c-e> <end>
    inoremap <silent> <buffer>       <c-a> <home>
    imap <silent> <buffer> ;         <plug>(unite_choose_action)
    nmap <silent> <buffer> ;         <plug>(unite_choose_action)
    nmap <silent> <buffer> h         <plug>(unite_exit)
    nmap <silent> <buffer> H         <plug>(unite_all_exit)
    nmap <silent> <buffer> <c-p>     <plug>(unite_redraw)
    imap <silent> <buffer> <c-p>     <plug>(unite_redraw)
    imap <silent> <buffer> <c-j>     <plug>(unite_select_next_line)
    imap <silent> <buffer> <c-k>     <plug>(unite_select_previous_line)
    imap <silent> <buffer> <tab>     <plug>(unite_complete)

    let unite = unite#get_current_unite()
    if unite.profile_name ==# 'search'
      nnoremap <silent> <buffer><expr> r unite#do_action('replace')
    else
      nnoremap <silent> <buffer><expr> r unite#do_action('rename')
    endif
    setlocal number
  endfunction

  call neobundle#untap()
endif

" settings for unite-session{{{2
if neobundle#tap('unite-session')
  " save session automatically.
  let g:unite_source_session_enable_auto_save = 1
  " load session automatically.
  " autocmd VimConfig VimEnter * UniteSessionLoad

  call neobundle#untap()
endif

" settings for vimfiler{{{2
if neobundle#tap('vimfiler')
  " like textmate icons.
  let g:vimfiler_tree_leaf_icon             = ' '
  let g:vimfiler_tree_opened_icon           = '▾'
  let g:vimfiler_tree_closed_icon           = '▸'
  let g:vimfiler_file_icon                  = ' '
  let g:vimfiler_readonly_file_icon         = ''
  let g:vimfiler_marked_file_icon           = '✓'
  let g:vimfiler_safe_mode_by_default       = 0
  " show airline's statusline
	let g:vimfiler_force_overwrite_statusline = 0
  " toggle vimfiler and vimfilerexplorer
  nnoremap <silent> <leader>ts   :<c-u>VimFilerSplit<cr>
  nnoremap <silent> <leader>tt   :<c-u>VimFilerCurrentDir -explorer<cr>
  " change mappings <c-j> <c-l> to avoid confliction
  function! neobundle#hooks.on_post_source(bundle)
    function! s:vimfiler_settings()
      " nmap <silent><buffer> <c-j> <nop>
      nmap <silent><buffer> <c-k> <nop>
      nmap <silent><buffer> <c-l> :tabnext<cr>
      nmap <silent><buffer> <c-p> <plug>(vimfiler_redraw_screen)
    endfunction
    autocmd VimConfig filetype vimfiler call s:vimfiler_settings()
  endfunction

  call neobundle#untap()
endif

" settings for golden-view{{{2
if neobundle#tap('golden-view')
  let g:goldenview__enable_default_mapping = 0
  let g:goldenview__enable_at_startup      = 0
  nmap <silent> <c-w>i     <plug>GoldenViewSplit
  nmap <silent> <c-w>u     <plug>GoldenViewSwitchMain
  nmap <silent> <c-w><c-u> <plug>GoldenViewSwitchToggle

  nmap <silent> <c-w><c-e> :EnableGoldenViewAutoResize<cr>
  nmap <silent> <c-w><c-d> :DisableGoldenViewAutoResize<cr>
  nmap <silent> <c-w><c-g> :ToggleGoldenViewAutoResize<cr>

  call neobundle#untap()
endif

" settings for bbye{{{2
if neobundle#tap('bbye')
  " close the current buffer
  nnoremap <silent> <leader>dd :Bdelete!<cr>
  " close all the buffers
  nnoremap <silent> <leader>da :bufdo :Bdelete<cr>

  call neobundle#untap()
endif

" text handling related{{{1

" settings for neosnippet{{{2
if neobundle#tap('neosnippet')
  let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }

  let g:neosnippet#snippets_directory  = '~/.vim/bundle/snippets/UltiSnips'
  call neobundle#untap()
endif

" settings for auto-pairs{{{2
if neobundle#tap('auto-pairs')
  let g:AutoPairsShortcutToggle = '<F3>'
  let g:AutoPairsMapBS          = 0
  let g:AutoPairs               = {
                                 \ '<':'>', '(':')', '[':']', '{':'}',
                                 \ "'":"'", '"':'"', '`':'`',
                                 \ }
  inoremap <buffer> <silent> <c-f> <c-r>=AutoPairsDelete()<cr>
  autocmd VimConfig filetype c,cpp,python
        \ let b:AutoPairs = { '[':']', '{':'}', "'":"'", '"':'"', '`':'`'}

  call neobundle#untap()
endif

" settings for gundo{{{2
if neobundle#tap('gundo')
  nnoremap <silent> <leader>uu :GundoToggle<cr>
  let g:gundo_help                  = 0
  let g:gundo_width                 = 60

  call neobundle#untap()
endif

" settings for yank-ring{{{2
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

" settings for tcomment{{{2
if neobundle#tap('tcomment')
  let g:tcommentTextObjectInlineComment = ''
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

" settings for tabular{{{2
if neobundle#tap('tabular')
  nnoremap <leader>ll :Tabularize /
  vnoremap <leader>ll :Tabularize /

  call neobundle#untap()
endif
" settings for easy-align{{{2
if neobundle#tap('easy-align')
  vmap <enter>   <plug>(EasyAlign)
  nmap <leader>a <plug>(EasyAlign)

  call neobundle#untap()
endif

" settings for narrow region{{{2
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

" settings for inline edit{{{2
if neobundle#tap('inline-edit')
  " normal mode:
  nnoremap <silent> <c-e> :InlineEdit<cr>
  " visual mode:
  vnoremap <silent> <c-e> :InlineEdit<cr>

  call neobundle#untap()
endif

" settings for vim-over{{{2
if neobundle#tap('over')
  let g:over_command_line_prompt                  = "➤ "
  " escape characters
  let g:over#command_line#paste_escape_chars      = '/.*$^~'
  " set the key mapping used on the command line
  let g:over_command_line_key_mappings            = {
          \	"\<c-l>" : "\<right>",
          \	"\<c-h>" : "\<left>",
          \	"\<c-j>" : "\<down>",
          \	"\<c-k>" : "\<up>",
          \ "\<c-f>" : "\<bs>",
          \ }
  " escape "\n" and "\r" automatically.
  let g:over#command_line#paste_filters           = {
          \	"\n" : '\\n',
          \	"\r" : '\\r',
          \ }
  nnoremap <silent> S :OverCommandLine<cr>
  vnoremap <silent> S :OverCommandLine<cr>

  call neobundle#untap()
endif

" settings for switch{{{2
if neobundle#tap('switch')
  nnoremap <silent> - :Switch<cr>

  call neobundle#untap()
endif

" settings for line-diff{{{2
if neobundle#tap('line-diff')
  vnoremap <silent> <c-l> :Linediff<cr>

  call neobundle#untap()
endif

" settings for join&split lines{{{2
if neobundle#tap('split-join')
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_join_mapping  = ''
  nmap gk :SplitjoinSplit<cr>
  nmap gj :SplitjoinJoin<cr>

  call neobundle#untap()
endif

" for niceblock
if neobundle#tap('niceblock')
  xmap I  <plug>(niceblock-I)
  xmap A  <plug>(niceblock-A)

  call neobundle#untap()
endif

" settings for text-object-user{{{2
" for text-object-indent
if neobundle#tap('textobj-indent')
  let g:textobj_indent_no_default_key_mappings   = 1
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

" for text-object-functioncall
if neobundle#tap('textobj-functioncall')
  let g:textobj_functioncall_no_default_key_mappings = 1
	omap aF	<plug>(textobj-functioncall-a)
	omap iF	<plug>(textobj-functioncall-i)
	xmap aF	<plug>(textobj-functioncall-a)
	xmap iF	<plug>(textobj-functioncall-i)

  call neobundle#untap()
endif

" for text-object-anyblock
if neobundle#tap('textobj-anyblock')
  let g:textobj_anyblock_no_default_key_mappings = 1
	omap aj	<plug>(textobj-anyblock-a)
	omap ij	<plug>(textobj-anyblock-i)
	xmap aj	<plug>(textobj-anyblock-a)
	xmap ij	<plug>(textobj-anyblock-i)

  call neobundle#untap()
endif

" for text-object-parameter
if neobundle#tap('textobj-parameter')
  let g:textobj_parameter_no_default_key_mappings = 1
	omap a,	<plug>(textobj-parameter-a)
	omap i,	<plug>(textobj-parameter-i)
	xmap a,	<plug>(textobj-parameter-a)
	xmap i,	<plug>(textobj-parameter-i)

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
  let g:textobj_delimited_patterns = [
    \ ['[#_-]', '\<\%([#_-]\k\+\|\k\+[#_-]\)\%(\k*[#_-]\?\)*\>'],
    \ ['[/|]', '\<\%([/|]\k\+\|\k\+[/|]\)\%(\k*[/|]\?\)*\>'],
    \ ['[\:;,.]', '\<\%([\:;,.]\k\+\|\k\+[\:;,.]\)\%(\k*[\:;,.]\?\)*\>'],
    \ ['\C\ze[A-Z]', '\C\<[A-Z]\?\k\+[A-Z]\%(\k*[A-Z]\?\)*\>'],
    \ ]
	omap ad	<plug>(textobj-delimited-forward-a)
	omap id	<plug>(textobj-delimited-forward-i)
	xmap ad	<plug>(textobj-delimited-forward-a)
	xmap id	<plug>(textobj-delimited-forward-i)

  call neobundle#untap()
endif

" for text-object-python
if neobundle#tap('textobj-python')
  " python Method
  xmap am <plug>(textobj-python-function-a)
  omap am <plug>(textobj-python-function-a)
  xmap im <plug>(textobj-python-function-i)
  omap im <plug>(textobj-python-function-i)
  " pyton Class
  xmap ac <plug>(textobj-python-class-a)
  omap ac <plug>(textobj-python-class-a)
  xmap ic <plug>(textobj-python-class-i)
  omap ic <plug>(textobj-python-class-i)

  call neobundle#untap()
endif

" for text-object-brace
if neobundle#tap('textobj-brace')
  xmap ak <plug>(textobj-brace-a)
  xmap ik <plug>(textobj-brace-i)
  omap ak <plug>(textobj-brace-a)
  omap ik <plug>(textobj-brace-i)
endif

" for text-object-comment
if neobundle#tap('textobj-comment')
  let g:textobj_comment_no_default_key_mappings = 1
  " comment Out
  omap ao <plug>(textobj-comment-a)
  omap io <plug>(textobj-comment-i)
  xmap ao <plug>(textobj-comment-a)
  xmap io <plug>(textobj-comment-i)

  call neobundle#untap()
endif

" for text-object-line
if neobundle#tap('textobj-line')
  let g:textobj_line_no_default_key_mappings    = 1
  omap al <plug>(textobj-line-a)
  omap il <plug>(textobj-line-i)
  xmap al <plug>(textobj-line-a)
  xmap il <plug>(textobj-line-i)

  call neobundle#untap()
endif

" for text-object-entire
if neobundle#tap('textobj-entire')
  let g:textobj_entire_no_default_key_mappings  = 1
  omap ae <plug>(textobj-entire-a)
  omap ie <plug>(textobj-entire-i)
  xmap ae <plug>(textobj-entire-a)
  xmap ie <plug>(textobj-entire-i)

  call neobundle#untap()
endif

" for text-object-url
if neobundle#tap('textobj-url')
  let g:textobj_url_no_default_key_mappings  = 1
  omap au <plug>(textobj-url-a)
  omap iu <plug>(textobj-url-i)
  xmap au <plug>(textobj-url-a)
  xmap iu <plug>(textobj-url-i)

  call neobundle#untap()
endif

" for text-obj-fold
if neobundle#tap('textobj-fold')
  let g:textobj_fold_no_default_key_mappings = 1
  omap az <plug>(textobj-fold-a)
  omap iz <plug>(textobj-fold-i)
  xmap az <plug>(textobj-fold-a)
  xmap iz <plug>(textobj-fold-i)

  call neobundle#untap()
endif

" settings for operator-user{{{2
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

" settings for surround{{{2
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
  xmap gs     <plug>VgSurround
  imap <c-s>  <plug>Isurround
  imap <c-g>s <plug>Isurround
  imap <c-g>S <plug>ISurround

  call neobundle#untap()
endif

" settings for drag-visual{{{2
vmap  <expr>  <left>   DVB_Drag('left')
vmap  <expr>  <c-h>    DVB_Drag('left')
vmap  <expr>  <right>  DVB_Drag('right')
vmap  <expr>  <c-l>    DVB_Drag('right')
vmap  <expr>  <down>   DVB_Drag('down')
vmap  <expr>  <c-j>    DVB_Drag('down')
vmap  <expr>  <up>     DVB_Drag('up')
vmap  <expr>  <c-k>    DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" settings for table-cell-selection{{{2
vnoremap <silent><expr>  b  VTC_select()

" mark, marker and highlight{{{1

" settings for syntastic{{{2
if neobundle#tap('syntastic')
  let g:syntastic_error_symbol               = '✗'
  let g:syntastic_style_error_symbol         = '✠'
  let g:syntastic_warning_symbol             = '∆'
  let g:syntastic_style_warning_symbol       = '≈'

  call neobundle#untap()
endif

" settings for airline{{{2
if neobundle#tap('airline')
  let g:airline#extensions#tabline#enabled   = 1
  let g:airline#extensions#tabline#fnamemod  = ':t'
  let g:airline_powerline_fonts              = 1
  let g:airline_section_c                    = '%F'
  let g:airline_section_z                    =
    \'%3p%% %{g:airline_symbols.linenr}%#__accent_bold#%l/%L' .
    \'%#__restore__# col:%2c%V'

  call neobundle#untap()
endif

" settings for indentline{{{2
if neobundle#tap('indent-line')
  let g:indentLine_faster   = 1
  let g:indentLine_fileType = ['c', 'cpp', 'java', 'python', 'php', 'perl',
        \ 'ruby']
  nnoremap <silent> <leader>ii :IndentLinesToggle<cr>

  call neobundle#untap()
endif

" settings for incsearch{{{2
if neobundle#tap('incsearch')

  function! neobundle#tapped.hooks.on_post_source(bundle)
    IncSearchNoreMap <c-a> <home>
    IncSearchNoreMap <c-e> <end>
    IncSearchNoreMap <c-l> <right>
    IncSearchNoreMap <c-h> <left>
    IncSearchNoreMap <c-j> <down>
    IncSearchNoreMap <c-k> <up>
    IncSearchNoreMap <c-f> <bs>
    IncSearchNoreMap <tab>   <Over>(buffer-complete)
    IncSearchNoreMap <S-Tab> <Over>(buffer-complete-prev)
  endfunction

  " let g:incsearch#auto_nohlsearch = 1
  nmap /  <plug>(incsearch-forward)
  nmap ?  <plug>(incsearch-backward)
  nmap g/ <plug>(incsearch-stay)
  nmap n  <plug>(incsearch-nohl)<plug>(anzu-n-with-echo)zzzv
  nmap N  <plug>(incsearch-nohl)<plug>(anzu-N-with-echo)zzzv

  map *   <plug>(incsearch-nohl)<plug>(asterisk-*)zzzv
  map g*  <plug>(incsearch-nohl)<plug>(asterisk-g*)zzzv
  map #   <plug>(incsearch-nohl)<plug>(asterisk-#)zzzv
  map g#  <plug>(incsearch-nohl)<plug>(asterisk-g#)zzzv

  map z*  <plug>(incsearch-nohl0)<plug>(asterisk-z*)
  map gz* <plug>(incsearch-nohl0)<plug>(asterisk-gz*)
  map z#  <plug>(incsearch-nohl0)<plug>(asterisk-z#)
  map gz# <plug>(incsearch-nohl0)<plug>(asterisk-gz#)

  " customize highlight
  highlight IncSearchCursor ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000
  " highlight IncSearchUnderline ctermfg=0 ctermbg=9 guifg=#000000 guibg=#FF0000

  call neobundle#untap()
endif

" misc {{{1

" settings for easy-motion{{{2
if neobundle#tap('easy-motion')
  let g:EasyMotion_smartcase        = 1
  let g:EasyMotion_leader_key       = ""
  nmap <silent> f   <plug>(easymotion-f)
  vmap <silent> f   <plug>(easymotion-f)
  nmap <silent> F   <plug>(easymotion-F)
  vmap <silent> F   <plug>(easymotion-F)
  nmap <silent> ss  <plug>(easymotion-s)
  nmap <silent> sj  <plug>(easymotion-j)
  nmap <silent> sk  <plug>(easymotion-k)
  nmap <silent> si  <plug>(easymotion-bd-jk)
  omap <silent> z   <plug>(easymotion-f)
  omap <silent> Z   <plug>(easymotion-F)
  nmap ;            <plug>(easymotion-next)
  nmap ,            <plug>(easymotion-prev)

  call neobundle#untap()
endif

" settings for sneak-motion{{{2
" if neobundle#tap('sneak-motion')
"   nmap f <Plug>Sneak_f
"   nmap F <Plug>Sneak_F
"   xmap f <Plug>Sneak_f
"   xmap F <Plug>Sneak_F
"   omap f <Plug>Sneak_f
"   omap F <Plug>Sneak_F
"
"   call neobundle#untap()
" endif

" settings for camelcase-motion{{{2
if neobundle#tap('camelcase-motion')
  nmap <silent> w <plug>CamelCaseMotion_w
  xmap <silent> w <plug>CamelCaseMotion_w
  omap <silent> w <plug>CamelCaseMotion_w
  nmap <silent> b <plug>CamelCaseMotion_b
  " xmap <silent> b <plug>CamelCaseMotion_b
  omap <silent> b <plug>CamelCaseMotion_b
  nmap <silent> e <plug>CamelCaseMotion_e
  xmap <silent> e <plug>CamelCaseMotion_e
  omap <silent> e <plug>CamelCaseMotion_e

  call neobundle#untap()
endif

" settings for accelerated-jk{{{2
if neobundle#tap('accelerated-jk') "{{{
  nmap <silent>j <Plug>(accelerated_jk_gj)
  nmap <silent>k <Plug>(accelerated_jk_gk)

  call neobundle#untap()
endif "}}}

" settings for openbrowser{{{2
if neobundle#tap('open-browser')
  nmap <silent> [b <plug>(openbrowser-open)\|
          \:call repeat#set("\<plug>(openbrowser-open)", v:count)<cr>
  " vmap <silent> [b <plug>(openbrowser-open)\|
  "         \:call visualrepeat#set("\<plug>(openbrowser-open)", v:count)<cr>

  call neobundle#untap()
endif

" settings for notes{{{2
if neobundle#tap('notes')
  let g:notes_directories = ['~/work/Notes']

  call neobundle#untap()
endif

" settings for quickrun{{{2
if neobundle#tap('quickrun')
	let g:quickrun_config = {
        \ 'outputter/buffer/append': 1,
        \ }
  nmap <silent> <c-x> <plug>(quickrun)
  vmap <silent> <c-x> <plug>(quickrun)

  call neobundle#untap()
endif

" settings for vimshell{{{2
" if neobundle#tap('vimshell')
"
"   imap <buffer> <cr> <plug>(vimshell_int_execute_line)
"   nmap <buffer> <cr> <plug>(vimshell_int_execute_line)
" 	let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
" 	"let g:vimshell_right_prompt = 'vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
"
" 	if has('win32') || has('win64')
" 	  " Display user name on Windows.
" 	  let g:vimshell_prompt = $USERNAME."% "
" 	else
" 	  " Display user name on Linux.
" 	  let g:vimshell_prompt = $USER."% "
" 	endif
"
" 	" Initialize execute file list.
" 	let g:vimshell_execute_file_list = {}
" 	call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java', 'vim')
" 	let g:vimshell_execute_file_list['rb'] = 'ruby'
" 	let g:vimshell_execute_file_list['pl'] = 'perl'
" 	let g:vimshell_execute_file_list['py'] = 'python'
" 	call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
"
" 	autocmd VimConfig FileType vimshell
" 	\ call vimshell#altercmd#define('g', 'git')
" 	\| call vimshell#altercmd#define('i', 'iexe')
" 	\| call vimshell#altercmd#define('l', 'll')
" 	\| call vimshell#altercmd#define('ll', 'ls -l')
" 	\| call vimshell#hook#add('chpwd', 'my_chpwd', 'MyChpwd')
"
" 	function! MyChpwd(args, context)
" 	  call vimshell#execute('ls')
" 	endfunction
"
" 	autocmd VimConfig FileType int-* call s:interactive_settings()
" 	function! s:interactive_settings()
" 	endfunction
"
"   call neobundle#untap()
" endif

" settings for tmux-complete{{{2
if neobundle#tap('tmux-complete')
  let g:tmuxcomplete#trigger = 'omnifunc'

  call neobundle#untap()
endif

" settings for view-doc{{{2
if neobundle#tap('view-doc')
  let g:viewdoc_open = "belowright vnew"

  call neobundle#untap()
endif

" settings for vimpager{{{2
if exists('vimpager')
  " launch vimpager in vim mode instead of less mode
  let g:vimpager_less_mode = 0

  " set no colorcolomn for vimpager
  set colorcolumn=0

  " disable internal mapping of z conflicted with incsearch and anzu
  unmap z
endif

" vim:tw=78:ts=2:sw=2:sts=2:et:fdm=marker
