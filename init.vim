set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.fzf
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sleuth'
" Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
" Plugin 'tpope/vim-sensible' " I have to check this actually helps me 
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'AndrewRadev/switch.vim'
Plugin 'parnmatt/vim-root'
Plugin 'kana/vim-textobj-user'
    " Plugin 'kana/vim-textobj-entire'
    Plugin 'kana/vim-textobj-line'
    " Plugin 'tkhren/vim-textobj-numeral'
    " Plugin 'lucapette/vim-textobj-underscore'
    Plugin 'Julian/vim-textobj-variable-segment'
    Plugin 'michaeljsmith/vim-indent-object'
    Plugin 'sgur/vim-textobj-parameter'
" Plugin 'tommcdo/vim-express'
Plugin 'ervandew/supertab'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'neomake/neomake'
Plugin 'bronson/vim-visual-star-search'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-jedi'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'zchee/deoplete-clang'
" Plugin 'tweekmonster/deoplete-clang2'
Plugin 'Shougo/echodoc.vim'
Plugin 'tweekmonster/startuptime.vim'
" Plugin 'junegunn/vim-easy-align'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'vim-scripts/AnsiEsc.vim'
Plugin 'tpope/vim-markdown'
Plugin 'chrisbra/vim-zsh'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tmhedberg/SimpylFold'
" Plugin 'jiangmiao/auto-pairs'
Plugin 'wsdjeg/vim-fetch'
Plugin 'mbbill/undotree'
Plugin 'chrisbra/Recover.vim'
Plugin 'vim-syntastic/syntastic'
" Plugin 'tell-k/vim-autopep8'
" Plugin 'nvie/vim-flake8'
Plugin 'airblade/vim-rooter'

let g:vim_textobj_parameter_mapping = 'b'
let g:SuperTabDefaultCompletionType = "<c-n>"
call vundle#end()            " required
filetype plugin indent on    " required
" syntax on
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

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
set noshowmode

" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" call deoplete#custom#set('jedi', 'debug_enabled', 1)
" call deoplete#enable_logging('DEBUG', '/tmp/deoplete.log')
"""""""""""""""""""""""""
"
"   General settings
"
"""""""""""""""""""""""""

nnoremap ; :
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
let mapleader=','
nmap <silent> ,/ :nohlsearch<CR>
inoremap jj <ESC>
inoremap jk <ESC>
" Split line at cursor position
nnoremap K :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>
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
command CV execute "echo serverlist()"
" nmap ga <Plug>(EasyAlign)
" xmap ga <Plug>(EasyAlign)
" let g:easy_align_delimiters = {
" \ 'd': {
" \     'pattern':       ':\|,',
" \     'left_margin':   0,
" \     'stick_to_left': 1,
" \     'ignore_groups':   ['String']
" \   }
" \ }
" " nmap  gaii*d
" Set the working directory to wherever the open file lives
command Form execute "normal gaii*d"
" " nmap de :execute "normal \<Plug>(EasyAlign)ii*d"
set scrolloff=3

set complete+=kspell
autocmd FileType tex setlocal spell
set wildmenu
set wildmode=list:longest,full


nnoremap <silent> q: :History:<CR>
nnoremap <silent> q; :History:<CR>
nnoremap <silent> q/ :History/<CR>
nnoremap <silent> q. :History<CR>
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>h :let @/ = expand("<cword>")<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

set tags=./tags;,tags;,/afs/cern.ch/user/n/nscharmb/private/python/tags;
" Mapping selecting mappings
" nmap <leader><tab> <plug>(fzf-maps-n)
" xmap <leader><tab> <plug>(fzf-maps-x)
" omap <leader><tab> <plug>(fzf-maps-o)

" " Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)


"""""""""""""""""""""""""
"
"   Format settings
"
"""""""""""""""""""""""""
autocmd FileType config setlocal commentstring=%\ %s
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
""Max out the height of the current split
"ctrl + w _
""Max out the width of the current split
"ctrl + w |
""Normalize all split sizes, which is very handy when resizing terminal
"ctrl + w =
""Swap top/bottom or left/right split
"Ctrl+W R
""Break out current window into a new tabview
"Ctrl+W T
""Close every window in the current tabview but the current one
"Ctrl+W o

"""""""""""""""""""
" Between buffers
"""""""""""""""""""
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>/ :bp<CR>
nnoremap <Leader>. :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

""""""""""""""""""""
""   easy-motion
""""""""""""""""""""

"map  <Leader>j <Plug>(easymotion-j)
"map  <Leader>k <Plug>(easymotion-k)
"map  <Leader>t <Plug>(easymotion-bd-t)
"nmap <Leader>t <Plug>(easymotion-overwin-t)

"map  <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)

"nmap s <Plug>(easymotion-overwin-f2)

"" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

"" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)



"""""""""""""""""""""""""
"
"   Additional Setups
"
"""""""""""""""""""""""""

nnoremap <leader>s /\V<C-R>"<CR>

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
    \ ]

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"""""""""""""""""""
"   textobj-numeral
"""""""""""""""""""

set nrformats-=octal

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
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
if executable('ag')
  let g:ackprg = 'ag --path-to-ignore ~/.ignore --vimgrep'
endif
nmap K    :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack! "\b<cword>\b" <CR>
autocmd FileType python nmap K :let DIR = getcwd() <CR> :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack!  --python "\b<C-R>=CWORD<CR>\b" % <CR> :AckAdd! --ignore-dir=# --python "\b<C-R>=CWORD<CR>\b" <CR> :AckAdd! --ignore-dir={"<C-R>=DIR<CR>","#"} --python "\b<C-R>=CWORD<CR>\b" ~/private/python <CR>
autocmd FileType cpp nmap K :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack! --cpp "\b<cword>\b" <CR>


nmap \    :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack! "<cword>" <CR>
autocmd FileType python nmap \ :let DIR = getcwd() <CR> :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack!  --python "<C-R>=CWORD<CR>" % <CR> :AckAdd! --ignore-dir=# --python "<C-R>=CWORD<CR>" <CR> :AckAdd! --ignore-dir={"<C-R>=DIR<CR>","#"} --python "<C-R>=CWORD<CR>" ~/private/python <CR>
autocmd FileType cpp nmap \ :let CWORD = expand("<cword>") <CR> : let @/ = CWORD <CR> :Ack! --cpp "<cword>" <CR>

nnoremap <silent> cr :<C-U><C-R><C-R>='let @' . v:register . ' = ' . string(getreg())<CR><C-F><Left>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
