"""""""""""""""""""""vundle"""""""""""""""""""
set nocompatible              " be iMproved
filetype off                  " required!

"the path of vundle
set rtp+=$VIM/vimfiles/bundle/vundle/
"the path where plugin install
call vundle#rc('$VIM/vimfiles/bundle/')

" let Vundle manage Vundle,vundle is in "https://github.com/gmarik/vundle"
" required! 
Bundle 'gmarik/vundle'

" My bundles here:

"""""""1: original repos on GitHub
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'

""""""""2: vim-scripts repos
"Bundle 'L9'


""""""""3: non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'

""""""""4: Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
"""""""""""""""""""""vundle end""""""""""""""""""""""""""""""""""

set nu!
syntax enable
syntax on
filetype on 

set tabstop=4
set shiftwidth=4

set showmatch

set tags=tags; 
set autochdir

set autoindent
set cindent

let Tlist_Show_One_File=1 
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList' 
nmap wm :WMToggle<cr>

let g:miniBufExplMapCTabSwitchBufs=1 
let g:miniBufExplMapWindowsNavVim=1 
let g:miniBufExplMapWindowNavArrows=1

nnoremap <silent> <F3> :Grep<CR>

nnoremap <silent> <F12> :A<CR> 

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

colors evening
set nobackup

"""""""""""""""""""""NeoComplCache"""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1

let g:neocomplcache_enable_smart_case = 1
" 启用大写字母补全.
let g:neocomplcache_enable_camel_case_completion = 1
" 启用下划线补全.
let g:neocomplcache_enable_underbar_completion = 1
" 设定最小语法关键词长度.
let g:neocomplcache_min_syntax_length = 2

let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 定义字典.
let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions',
        \ 'php' : $HOME.'/.vim/dict/php.dic',
        \ }
"        \ 'css' : $HOME.'.vim/dict/css.dic',
"        \ 'javascript' : $HOME.'.vim/dict/javascript.dic'

"include_complete be abled
let g:neocomplcache_ctags_program = '/usr/local/bin/ctags'

" 定义关键词.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" 插件键映射.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" 类似于SuperTab用法 .
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" 推荐的键映射.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion. NO USE with snipmate
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-Y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"inoremap <expr><Enter>  pumvisible() ? neocomplcache#close_popup()."\<C-n>" : "\<Enter>"
"inoremap <expr><Enter>  pumvisible() ? "\<C-Y>" : "\<Enter>"

" 类似于AutoComplPop用法 .
"let g:neocomplcache_enable_auto_select = 1
" 类似于 Shell 用法(不推荐).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" 启用 omni 补全.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP "vim默认
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" 启用 heavy omni 补全.
if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
endif
if !exists('g:neocomplcache_omni_functions')
        let g:neocomplcache_omni_functions = {}
endif
if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
endif

"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" 兼容clang_complete
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" 兼容jedi
let g:neocomplcache_force_omni_patterns.python = '[^. \t]\.\w*'
let g:neocomplcache_omni_functions.python = 'jedi#complete'

" rank sourch list
let g:neocomplcache_source_rank = {
        \ 'buffer_complete'     : 6,
        \ 'dictionary_complete' : 5,
        \ 'syntax_complete'     : 4,
        \ }

""""""""""""""""""""""NeoSnippet""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin key-mappings.
imap <C-k>        <Plug>(neosnippet_expand_or_jump)
smap <C-k>        <Plug>(neosnippet_expand_or_jump)
xmap <C-k>        <Plug>(neosnippet_expand_target)

"SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

"For snippet_complete marker.
if has('conceal')
        set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
