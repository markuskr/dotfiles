execute pathogen#infect()
syntax on
filetype plugin indent on
colorscheme jellybeans
"autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
syntax enable              "Enable syntax hilighting (for programming/etc)
set hlsearch               "Highlight searchs
set title                  "Set xterm title to file vim has open
set ruler                  "show the ruler all the time (ctrl-J)
set tabstop=2
set expandtab
set spelllang=nb
let bclose_multiple = 0
set shiftwidth=2
set number
set ic
"set mouse=a
"#################### IRULE ###########################
so $HOME/.vim/irule/pyfunc.vim
let $irulsyn='~/.vim/syntax/irul.vim' "Syntax file for *.irul files.
let g:irul_location='~/.vim/irule/irul_dict' "Location of the syntax dict.
au BufRead,BufNewFile *.irul set filetype=irul "If you name a file *.irul,set ftype.
au! Syntax irul source $irulsyn

" Use comma as the leader character
let mapleader = ","

" for command mode
nmap <S-Tab> <<
" " " for insert mode
imap <S-Tab> <Esc><<i
