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
 call dein#add('tpope/vim-fugitive', { 'on_cmd': [ 'Git', 'Gstatus', 'Gwrite', 'Glog', 'Gcommit', 'Gblame', 'Ggrep', 'Gdiff', ], })
 " call dein#add('tpope/vim-fugitive', { 'on_cmd': 'Gdiff'})
 call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
 call dein#add('tpope/vim-unimpaired')
 call dein#add('tpope/vim-sleuth')
 " call dein#add('tpope/vim-speeddating', {'on_map': {'xo' : ['il', 'al']}})
 call dein#add('tpope/vim-repeat')
 call dein#add('tpope/vim-rhubarb')
 call dein#add('tpope/vim-markdown')
" Plugin 'tpope/vim-sensible' " I have to check this actually helps me
" git-gutter and signify do the same but signify might be faster
 " call dein#add('airblade/vim-gitgutter')
 call dein#add('mhinz/vim-signify')
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
 call dein#add('tweekmonster/impsort.vim')
 call dein#add('vim-python/python-syntax')
 call dein#add('junegunn/fzf.vim')
 call dein#add('junegunn/vim-easy-align')
 call dein#add('mileszs/ack.vim')
 call dein#add('AndrewRadev/linediff.vim', {'on_cmd': ['Linediff']})
 call dein#add('vim-scripts/AnsiEsc.vim')
" Plugin 'chrisbra/vim-zsh'
 call dein#add('ntpeters/vim-better-whitespace')
 call dein#add('tmhedberg/SimpylFold')
 call dein#add('wsdjeg/vim-fetch')
 call dein#add('mbbill/undotree', {'on_cmd': ['UndotreeToggle']})
 call dein#add('chrisbra/Recover.vim')
 call dein#add('chrisbra/NrrwRgn')
 call dein#add('lervag/vimtex')
 call dein#add('yuttie/comfortable-motion.vim')

" Plugin 'vim-syntastic/syntastic'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'nvie/vim-flake8'
   call dein#add('airblade/vim-rooter')
   call dein#add('vim-airline/vim-airline')
   call dein#add('vim-airline/vim-airline-themes')

   call dein#end()
   call dein#save_state()
endif

" " Lazy load helper for fugitive
" command! Gstatus call LazyLoadFugitive('Gstatus')
" command! Gdiff call LazyLoadFugitive('Gdiff')
" command! Glog call LazyLoadFugitive('Glog')
" command! Gblame call LazyLoadFugitive('Gblame')
" command! Git call LazyLoadFugitive('Git')
" command! Gwrite call LazyLoadFugitive('Gwrite')
" command! Gcommit call LazyLoadFugitive('Gcommit')
" command! Ggrep call LazyLoadFugitive('Ggrep')


" function! LazyLoadFugitive(cmd)
"   call plug#load('vim-fugitive')
"   call fugitive#detect(expand('%:p'))
"   exe a:cmd
" endfunction


filetype plugin indent on
syntax enable
syntax on


let g:signify_disable_by_default = 1
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
autocmd BufNewFile,BufRead *.xrsl set syntax=config
set wildmenu
set wildmode=list:longest,full

if isdirectory($SECONDHOME)
  let g:home = $SECONDHOME
  set shada='50,<50,s10,n$SECONDHOME/.vim/main.shada
else
  let g:home = $HOME
  set shada='50,<50,s10,n$HOME/.vim/main.shada
endif

if !isdirectory(g:home . "/.vim")
    call mkdir(g:home . "/.vim", "", 0770)
endif
if !isdirectory(g:home . "/.vim/undo-dir")
    call mkdir(g:home . "/.vim/undo-dir", "", 0700)
endif
execute "set undodir=" . g:home . "/.vim/undo-dir"

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
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
" inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)



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
highlight DiffText   cterm=none ctermfg=Black ctermbg=DarkRed gui=none guifg=Black guibg=Red
highlight DiffChange cterm=none ctermfg=Black ctermbg=Grey gui=none guifg=Black guibg=LightMagenta
highlight DiffAdd ctermbg=DarkBlue
highlight DiffDelete ctermbg=DarkBlue
highlight Search ctermbg=green ctermfg=Black
highlight Identifier cterm=none
highlight Comment ctermfg=DarkGrey
highlight ColorColumn ctermbg=DarkRed ctermfg=Black
highlight ColorColumn2 ctermbg=Red ctermfg=Black
autocmd FileType python call matchadd('ColorColumn', '\%80v.', 100)
autocmd FileType python call matchadd('ColorColumn2', '\%120v.', 100)

let g:python_highlight_all = 1
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

" nnoremap <C-J> <C-w>-
" nnoremap <C-K> <C-w>+
" nnoremap <C-H> <C-w><
" nnoremap <C-L> <C-w>>
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
" nnoremap <silent> <Plug>(GoAppend) :set opfunc=<SID>SpecialChange<CR>g@
nnoremap <silent> <Plug>(GoAppend) :set opfunc=<SID>SpecialChange<CR>:silent! call repeat#set("\<Plug>GoAppend", v:count)<CR>g@
" nnoremap <silent> <Plug>(GoAppend) :set opfunc=<SID>SpecialChange<CR>g@:silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)<CR>
nmap  <silent> gw :set opfunc=<SID>SpecialChange<CR>g@
" silent! call repeat#set("\<Plug>GoAppend", v:val)
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
nmap gq <Plug>(GoAppend)

" " replace text with unnamed register (in all modes)
"                 function! ReplaceWithUnamed(type)
"                         let paste_save=&paste
"                         let &paste=1
"                         if a:type == 'line'
"                           silent exe "normal! '[V']"
"                         elseif a:type == 'block'
"                           silent exe "normal! `[\<C-V>`]"
"                         elseif a:type == 'char'
"                           silent exe "normal! `[v`]"
"                         else
"                           silent exe "normal! `<" . a:type . "`>"
"                         endif
"                         " startinsert  " `i`
" 						" call feedkeys('A')
"                         " silent exe "normal! \"_c\<C-R>""\<ESC>"
"                         " let &paste=paste_save 
"                 endfunction
"                 nmap <silent> S :set opfunc=ReplaceWithUnamed<CR>g@
"                 vmap <silent> S :<C-U>call ReplaceWithUnamed(visualmode())<CR>


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

" set foldtext=NeatFoldText()

" function! Fold_all()
"   set foldmethod=indent
"   set foldlevel=1
"   set foldclose=all
" endfunction
" command Fold execute "Fold_all()"
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" " Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

function! GetPythonPaths(DIR_START)
  let new_dict = { a:DIR_START: "" }
  let DIRS = split(substitute($PYTHONPATH, ":", " ", "g"), " ")
  " echo DIRS
  for file in DIRS
    " echo file
    if !empty(glob(file)) && file[:5] != "/cvmfs" && len(file) > 0
      let addfile = "y"
      for file_2 in keys(new_dict)
        if len(file) > len(file_2)
          if file[:len(file_2)-1] == file_2
            let addfile = "n"
          endif
        elseif len(file) < len(file_2)
          if file_2[:len(file)-1] == file
            let new_dict[file] = ""
            unlet new_dict[file_2]
          endif
        endif
      endfor
      if addfile == "y"
        let new_dict[file] = ""
      endif
    endif
  endfor
  let DIR_EXTRA = ""
  for file in keys(new_dict)
    let DIR_EXTRA .= " ".file
  endfor
  return DIR_EXTRA
endfunction
" if executable('rg')
"   set grepprg=rg\ --vimgrep
"   let g:ackprg = 'rg -S --no-heading --vimgrep'
" elseif executable('ag')
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

let g:nrrw_rgn_nohl=1
function! Nr_return(...)
  if !exists("*nrrwrgn#NrrwRgnStatus()") || empty(nrrwrgn#NrrwRgnStatus())
      let bufname=(get(b:, 'orig_buf', 0) ? bufname(b:orig_buf) : substitute(bufname('%'), '^Nrrwrgn_\zs.*\ze_\d\+$', submatch(0), ''))
  else
      let dict=nrrwrgn#NrrwRgnStatus()
      let bufname= dict.fulname
  endif

endfunction

command TEST execute "Nr_return()"

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

command! -bang -nargs=+ -complete=dir Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always ' . <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=+ -complete=dir Ag call fzf#vim#ag_raw('--color-path 35 ' . <q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
\ {'options': "--preview 'coderay $(cut -d: -f1 <<< {}) | sed -n $(cut -d: -f2 <<< {}),\\$p | head -".&lines."'"}))

" grep alternative
" if executable('rg')
"   " Use rg over ag
"   set grepprg=rg\ --nogroup\ --nocolor
"   let g:ackprg = 'rg --ignore-file ~/.ignore --vimgrep'
"   nmap K    :let CWORD = expand("<cword>") <CR> :Rg "<C-R>=CWORD<CR>" <CR>
"   autocmd FileType python nmap K :let DIR = getcwd() <CR> :let DIRS = GetPythonPaths(DIR) <CR> :let CWORD = expand("<cword>") <CR> :Rg -t py <C-R>=CWORD<CR> <C-R>=DIRS<CR> <CR>
"   autocmd FileType cpp nmap K :let CWORD = expand("<cword>") <CR> :Rg -t cpp "<C-R>=CWORD<CR>" <CR>
"   " " Indlcude highlighting
"   " nmap K    :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Rg "<C-R>=CWORD<CR>" <CR>
"   " autocmd FileType python nmap K :let DIR = getcwd() <CR> :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Rg -tpy <C-R>=CWORD<CR> <C-R>=DIR<CR> ~/private/python-tools ~/private/python <CR>
"   " autocmd FileType cpp nmap K :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Rg --cpp "<C-R>=CWORD<CR>" <CR>
" elseif executable('ag')
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = 'ag --path-to-ignore ~/.ignore --vimgrep'
  nmap K    :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag "<C-R>=CWORD<CR>" <CR>
  autocmd FileType python nmap K :let DIR = getcwd() <CR> :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag --python "<C-R>=CWORD<CR>" <C-R>=DIR<CR> ~/private/python-tools ~/private/python <CR>
  autocmd FileType cpp nmap K :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ag --cpp "<C-R>=CWORD<CR>" <CR>
endif

nnoremap <silent> cr :<C-U><C-R><C-R>='let @' . v:register . ' = ' . string(getreg())<CR><C-F><Left>

function! SearchWithSkip(pattern, flags, stopline, timeout, skip)
"
" Returns true if a match is found for {pattern}, but ignores matches
" where {skip} evaluates to false. This allows you to do nifty things
" like, say, only matching outside comments, only on odd-numbered lines,
" or whatever else you like.
"
" Mimics the built-in search() function, but adds a {skip} expression
" like that available in searchpair() and searchpairpos().
" (See the Vim help on search() for details of the other parameters.)
" 
    " Note the current position, so that if there are no unskipped
    " matches, the cursor can be restored to this location.
    "
    let l:matchpos = getpos('.')

    " Loop as long as {pattern} continues to be found.
    "
    let l:guard = []
    while search(a:pattern, a:flags, a:stopline, a:timeout) > 0
        if l:guard == [] | let l:guard = getpos('.') | elseif l:guard == getpos('.') | break | endif

        " If {skip} is true, ignore this match and continue searching.
        "
        if eval(a:skip)
            continue
        endif

        " If we get here, {pattern} was found and {skip} is false,
        " so this is a match we don't want to ignore. Update the
        " match position and stop searching.
        " 
        let l:matchpos = getpos('.')
        break

    endwhile

    " Jump to the position of the unskipped match, or to the original
    " position if there wasn't one.
    "
    call setpos('.', l:matchpos)

endfunction
function! SearchOutside(synName, pattern)
"
" Searches for the specified pattern, but skips matches that
" exist within the specified syntax region.
"
    call SearchWithSkip(a:pattern, '', '', '',
        \ 'synIDattr(synID(line("."), col("."), 0), "name") =~? "' . a:synName . '"' )

endfunction


function! SearchInside(synName, pattern)
"
" Searches for the specified pattern, but skips matches that don't
" exist within the specified syntax region.
"
    call SearchWithSkip(a:pattern, '', '', '',
        \ 'synIDattr(synID(line("."), col("."), 0), "name") !~? "' . a:synName . '"' )

endfunction
command! -nargs=+ -complete=command SearchOutside call SearchOutside(<f-args>)
command! -nargs=+ -complete=command SearchInside  call SearchInside(<f-args>)

function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape($SSH_TTY)
endfunction
command! Osc52CopyYank call Osc52Yank()
augroup Example
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
  augroup END
