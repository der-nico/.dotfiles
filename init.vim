set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'AndrewRadev/switch.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'parnmatt/vim-root'
Plugin 'kana/vim-textobj-user'
    Plugin 'kana/vim-textobj-entire'
    Plugin 'kana/vim-textobj-line'
    Plugin 'tkhren/vim-textobj-numeral'
    Plugin 'lucapette/vim-textobj-underscore'
    Plugin 'Julian/vim-textobj-variable-segment'
    Plugin 'michaeljsmith/vim-indent-object'
Plugin 'ervandew/supertab'
Plugin 'haya14busa/vim-easyoperator-line'
Plugin 'neomake/neomake'
" Plugin 'vim-syntastic/syntastic'
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


"""""""""""""""""""""""""
"   
"   General settings
"
"""""""""""""""""""""""""
let mapleader=',' 
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
set complete+=kspell
autocmd FileType tex setlocal spell



"""""""""""""""""""""""""
"   
"   Format settings
"
"""""""""""""""""""""""""
autocmd FileType cpp setlocal commentstring=//\ %s
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
set shiftwidth=4
set tabstop=4
set tabstop=4
autocmd Filetype cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2



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

"""""""""""""""""""
" Between splits
"""""""""""""""""""
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

"""""""""""""""""""
"   easy-motion
"""""""""""""""""""
map  <Leader>j <Plug>(easymotion-j)
map  <Leader>k <Plug>(easymotion-k)
map  <Leader>t <Plug>(easymotion-bd-t)
nmap <Leader>t <Plug>(easymotion-overwin-t)

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)



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
    \ ]
