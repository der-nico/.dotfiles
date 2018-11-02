set nocompatible              " be iMproved, required
filetype off                  " required
set guioptions=M
" set the runtime path to include Vundle and initialize
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
set rtp+=~/.config/nvim/bundle/Vundle.vim
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('tpope/vim-commentary', {'on_map': {'n' : ['gc']}})
 call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ] })
 call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
 call dein#add('tpope/vim-unimpaired')
 call dein#add('tpope/vim-sleuth')
 " call dein#add('tpope/vim-speeddating', {'on_map': {'xo' : ['il', 'al']}})     
 call dein#add('tpope/vim-repeat')
 call dein#add('tpope/vim-rhubarb')
 call dein#add('tpope/vim-markdown')
" Plugin 'tpope/vim-sensible' " I have to check this actually helps me
 call dein#add('airblade/vim-gitgutter')
 call dein#add('vim-scripts/ReplaceWithRegister', {'on_map': {'n' : ['gr']}})
 call dein#add('AndrewRadev/switch.vim', {'on_map': {'n' : ['gs']}})
" Plugin 'parnmatt/vim-root'
 call dein#add('kana/vim-textobj-user')
 call dein#add('kana/vim-textobj-line', {'on_map': {'xo' : ['il', 'al']}})
 call dein#add('tkhren/vim-textobj-numeral', {'on_map': {'xo' : ['in', 'an']}})
 call dein#add('kana/vim-textobj-entire', {'on_map': {'xo' : ['ie', 'ae']}})
 call dein#add('Julian/vim-textobj-variable-segment', {'on_map': {'xo' : ['iv', 'av']}})
 call dein#add('michaeljsmith/vim-indent-object')
 call dein#add('sgur/vim-textobj-parameter', {'on_map': {'xo' : ['ib', 'ab']}})
 call dein#add('ervandew/supertab')
" Plugin 'neomake/neomake'
 call dein#add('bronson/vim-visual-star-search')
 " call dein#add('bronson/vim-visual-star-search', {'on_map': {'n' : ['*']}})
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('zchee/deoplete-jedi')
" Plugin 'davidhalter/jedi-vim'
" Plugin 'zchee/deoplete-clang'
" Plugin 'tweekmonster/deoplete-clang2'
 call dein#add('Shougo/echodoc.vim')
 call dein#add('tweekmonster/startuptime.vim', {'on_cmd': ['StartupTime']})
 call dein#add('junegunn/fzf.vim')
 call dein#add('mileszs/ack.vim')
 call dein#add('AndrewRadev/linediff.vim', {'on_cmd': ['Linediff']})
 call dein#add('vim-scripts/AnsiEsc.vim')
" Plugin 'chrisbra/vim-zsh'
 call dein#add('ntpeters/vim-better-whitespace')
 call dein#add('tmhedberg/SimpylFold')
 call dein#add('wsdjeg/vim-fetch')
 call dein#add('mbbill/undotree', {'on_cmd': ['UndotreeToggle']})
 call dein#add('chrisbra/Recover.vim')
" Plugin 'vim-syntastic/syntastic'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'nvie/vim-flake8'
 call dein#add('airblade/vim-rooter')
 call dein#add('vim-airline/vim-airline')
 call dein#add('vim-airline/vim-airline-themes')

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
syntax on

" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" Plugin 'tpope/vim-commentary'
" Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'tpope/vim-sleuth'
" Plugin 'tpope/vim-speeddating'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-rhubarb'
" Plugin 'tpope/vim-markdown'
" " Plugin 'tpope/vim-sensible' " I have to check this actually helps me
" Plugin 'airblade/vim-gitgutter'
" Plugin 'vim-scripts/ReplaceWithRegister'
" Plugin 'AndrewRadev/switch.vim'
" " Plugin 'parnmatt/vim-root'
" Plugin 'kana/vim-textobj-user'
"     Plugin 'kana/vim-textobj-line'
"     " Plugin 'tkhren/vim-textobj-numeral'
"     Plugin 'Julian/vim-textobj-variable-segment'
"     Plugin 'michaeljsmith/vim-indent-object'
"     Plugin 'sgur/vim-textobj-parameter'
" Plugin 'ervandew/supertab'
" " Plugin 'neomake/neomake'
" Plugin 'bronson/vim-visual-star-search'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'zchee/deoplete-jedi'
" " Plugin 'davidhalter/jedi-vim'
" " Plugin 'zchee/deoplete-clang'
" " Plugin 'tweekmonster/deoplete-clang2'
" Plugin 'Shougo/echodoc.vim'
" Plugin 'tweekmonster/startuptime.vim'
" Plugin 'junegunn/fzf.vim'
" Plugin 'mileszs/ack.vim'
" Plugin 'AndrewRadev/linediff.vim'
" Plugin 'vim-scripts/AnsiEsc.vim'
" " Plugin 'chrisbra/vim-zsh'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'wsdjeg/vim-fetch'
" Plugin 'mbbill/undotree'
" Plugin 'chrisbra/Recover.vim'
" " Plugin 'vim-syntastic/syntastic'
" " Plugin 'tell-k/vim-autopep8'
" " Plugin 'nvie/vim-flake8'
" Plugin 'airblade/vim-rooter'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
" call vundle#end()            " required



let g:SuperTabDefaultCompletionType = "<c-n>"
" filetype plugin indent on    " required

let g:syntastic_python_checkers=['flake8']
let g:syntastic_always_populate_loc_list=1
" let g:syntastic_python_flake8_args='--ignore=E501,E225'

let g:deoplete#enable_at_startup = 1
let g:python3_host_prog = $ConndaPYTHON3PATH
let g:python_host_prog = $ConndaPYTHON2PATH
let g:deoplete#sources#jedi#python_path = $ConndaPYTHONPATHMAIN
let g:deoplete#sources#jedi#extra_path = '/afs/cern.ch/user/n/nscharmb/private/python'
let g:deoplete#sources#jedi#server_timeout = 120
" let g:deoplete#sources#clang#libclang_path = ''
let g:deoplete#auto_completion_start_length = 2
let g:echodoc#enable_at_startup = 1

"""""""""""""""""""""""""
"
"   General settings
"
"""""""""""""""""""""""""

" " ignore Whitespace in diff
" set diffopt+=iwhite

set diffexpr=""
nnoremap ; :
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
let mapleader=','
inoremap jj <ESC>
inoremap jk <ESC>
set viminfo='20,<50,s10
" Ignore compiled files
 set wildignore=*.o,*~,*.pyc,*.so,*.d
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,mac,dos
set mouse=a
" Set to auto read when a file is changed from the outside
set autoread
" Height of the command bar
set hid
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
"Match System clipboard with vim (and server)
" command CV execute "echo serverlist()"
command Form execute "normal gaii*d"
set scrolloff=3
set complete+=kspell
autocmd FileType tex setlocal spell
set wildmenu
set wildmode=list:longest,full

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

nnoremap <leader>: :History:<CR>
nnoremap <leader>; :History:<CR>
nnoremap <leader>/ :History/<CR>
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>T :Files<Space>
nnoremap <leader>h :let @/ = expand("<cword>")<CR>
nnoremap <leader>r :call fzf#run(fzf#wrap({'source': 'cat ~/private/.root_info_data.txt', 'sink': {a -> execute("execute Yank_to_register('".a."')", "")}}))<CR>

function! Yank_to_register(data)
  let @" = a:data
  silent! let @* = a:data
  silent! let @+ = a:data
endfunction

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" fugitive git bindings
nnoremap <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gw :Gwrite<CR><CR>

set tags=./tags;,tags;,/afs/cern.ch/user/n/nscharmb/private/python/tags;

"""""""""""""""""""""""""
"
"   Format settings
"
"""""""""""""""""""""""""
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType text setlocal commentstring=#\ %s
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
set shiftwidth=4
set tabstop=4
set tabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"



"""""""""""""""""""""""""
"
"   Visual settings
"
"""""""""""""""""""""""""
set background=dark
set relativenumber
set number
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" Show matching brackets when text indicator is over them
set showmatch
hi DiffText   cterm=none ctermfg=Black ctermbg=Red gui=none guifg=Black guibg=Red
hi DiffChange cterm=none ctermfg=Black ctermbg=LightMagenta gui=none guifg=Black guibg=LightMagenta
highlight ColorColumn ctermbg=magenta
autocmd FileType python call matchadd('ColorColumn', '\%80v', 100)
set noshowmode


"""""""""""""""""""
"   airline
"""""""""""""""""""
let g:airline#extensions#branch#format = 2
let g:airline_theme='test'
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ }
" let g:airline#extensions#branch#format = 2
let g:airline#extensions#default#section_truncate_width = {
      \ 'a': 4,
      \ 'b': 50,
      \ 'c': 10,
      \ 'x': 150,
      \ 'y': 88,
      \ 'z': 30,
      \ 'warning': 150,
      \ 'error': 150,
      \ }
" airline symbols
let g:airline_symbols = {}
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_section_a       = '%#__accent_bold#%{airline#util#wrap(airline#parts#mode(),0)}%#__restore__#%{airline#util#append(airline#parts#crypt(),0)}%{airline#util#append(airline#parts#paste(),0)}%{airline#util#append(airline#extensions#keymap#status(),0)}%{airline#util#append(airline#parts#spell(),0)}%{airline#util#append("",0)}%{airline#util#append("",0)}%{airline#util#append(airline#parts#iminsert(),0)}'
let g:airline_section_b = '%{airline#util#wrap(airline#extensions#branch#get_head(),0)}'
" let g:airline_section_c       = '%<%<%{airline#extensions#fugitiveline#bufname()}%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
" let g:airline_section_gutter  = '%='
" let g:airline_section_x       = '%{airline#util#prepend("",0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_y       = '%{airline#util#wrap(airline#extensions#hunks#get_hunks(),0)}%{airline#util#wrap(airline#parts#ffenc(),0)}'
let g:airline_section_z       = '%3l/%L:%3v'
" let g:airline_section_z       = 'f_r(40/1008)%3l/%L:%3v'
" let g:airline_section_z       = '%{g:airline_symbols.linenr}%4l%#__restore__#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3v'
" let g:airline_section_error   = '%{airline#util#wrap(airline#extensions#neomake#get_errors(),0)}<Paste>'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#neomake#get_warnings(),0)}%{airline#util#wrap(airline#extensions#whitespace#check(),0)}'



"""""""""""""""""""""""""
"
"   Movements
"
"""""""""""""""""""""""""

"""""""""""""""""""
"   Search setup
"""""""""""""""""""
set ignorecase
set smartcase
set hlsearch
set incsearch

map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"""""""""""""""""""
" Between splits
"""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
set splitbelow
set splitright

"""""""""""""""""""""""""
"
"   Additional Setups
"
"""""""""""""""""""""""""

"""""""""""""""""""
"   GoAppend
"""""""""""""""""""
nnoremap <silent> <Plug>GoAppend :set opfunc=<SID>SpecialChange<CR>g@
silent! call repeat#set("\<Plug>GoAppend", v:val)
d
function! s:SpecialChange(type,...) abort
    silent exec 'normal! `]'
    while getline('.')[col('.')-1] == ' '
            silent exec 'normal! h'
        endwhile
    if col('.') == col('$') - 1
        startinsert! " `A`
    else
        silent exec 'normal! l'
        startinsert  " `i`
    endif
endfunction

"""""""""""""""""""
"   Switch cases
"""""""""""""""""""

let g:switch_custom_definitions =
    \ [
    \   ['>=', '<='],
    \   ['and', 'or'],
    \   ['==', '!='],
    \   ['+=', '-='],
    \   ['>', '<'],
    \   ['/', '*'],
    \   ['-', '+'],
    \   ['max', 'min'],
    \   ['maximum', 'minimum'],
    \   ['high', 'low'],
    \   ['upper', 'lower'],
    \   ['up', 'down'],
    \   ['left', 'right'],
    \   ['top', 'bottom'],
    \   ['height', 'width'],
    \   ['before', 'after'],
    \   ['TRUE', 'FALSE'],
    \   ['sin', 'cos'],
    \ ]

"""""""""""""""""""
"   textobj-user
"""""""""""""""""""
set nrformats-=octal
" Name of parameter object is b
let g:vim_textobj_parameter_mapping = 'b'

"""""""""""""""""""
"   textobj-numeral
"""""""""""""""""""

function! Increment(motion, step)
    let inc_key = a:step > 0 ? "\<C-a>" : "\<C-x>"
    let @z = '"zyad' . a:motion . 'vad"zp'. abs(a:step) . inc_key
    return '@z'
endfunction

nnoremap <expr> + Increment('j', 1)
nnoremap <expr> - Increment('j', -1)
nnoremap <expr> ) Increment('gNd', 1)
nnoremap <expr> ( Increment('gNd', -1)

set foldlevel=99
function! NeatFoldText()
    let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
    let lines_count = v:foldend - v:foldstart + 1
    let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
    let foldchar = matchstr(&fillchars, 'fold:\zs.')
    let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
    let foldtextend = lines_count_text . repeat(foldchar, 8)
    let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
    return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()

function! Fold_all()
set foldmethod=indent
set foldlevel=1
set foldclose=all
endfunction
command Fold execute "Fold_all()"
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '14%'})

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --path-to-ignore ~/.ignore --vimgrep'
endif

command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw('--color-path 35 ' . <q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
\ {'options': "--preview 'coderay $(cut -d: -f1 <<< {}) | sed -n $(cut -d: -f2 <<< {}),\\$p | head -".&lines."'"}))
nmap K    :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag "<C-R>=CWORD<CR>" <CR>
autocmd FileType python nmap K :let DIR = getcwd() <CR> :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag --python "<C-R>=CWORD<CR>" <C-R>=DIR<CR> ~/private/python-tools ~/private/python <CR>
autocmd FileType cpp nmap K :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag --cpp "<C-R>=CWORD<CR>" <CR>

nnoremap <silent> cr :<C-U><C-R><C-R>='let @' . v:register . ' = ' . string(getreg())<CR><C-F><Left>
