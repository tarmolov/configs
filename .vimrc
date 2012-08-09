set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'git://github.com/scrooloose/nerdtree'
Bundle 'git://github.com/jistr/vim-nerdtree-tabs'
Bundle 'git://github.com/scrooloose/nerdcommenter'
Bundle 'git://github.com/corntrace/bufexplorer'
Bundle 'git://github.com/vim-scripts/matchit.zip'
Bundle 'git://github.com/bkad/CamelCaseMotion'
Bundle 'git://github.com/vim-scripts/Marks-Browser'
Bundle 'git://github.com/vim-scripts/JavaScript-syntax'
Bundle 'git://github.com/ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'git://github.com/MarcWeber/vim-addon-mw-utils'
Bundle 'git://github.com/tomtom/tlib_vim'
Bundle 'git://github.com/honza/snipmate-snippets'
Bundle 'git://github.com/garbas/vim-snipmate'
Bundle 'git://github.com/tarmolov/TabLineNumbers.vim'
Bundle 'git://github.com/vim-scripts/MediaWiki-folding-and-syntax-highlight'

let g:TabLineSet_windows = 0
let NERDTreeShowHidden = 1

" Common
syntax on
filetype plugin on
autocmd BufNewFile,BufRead *.wiki set filetype=wiki syntax=wp
set langmenu=none                   " use english menu
set hidden                          " don't unload buffer before switching
set autoread                        " autoread changing of file
set spelllang=ru_ru,en_us           " spellchecker for english and russian
set history=150                     " size of history
set undolevels=1000                 " max count of undo commands
set nobackup                        " don't make backup
set noswapfile                      " and swap
set nowb

" Encoding
set encoding=utf8
set fileencoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251

" Input
set iminsert=0                      " english as default keyboard layout
let mapleader = ","                 " remap <Leader> key
set completeopt=longest,menuone     " autocompletion
set autoindent                      " inherit indent from previous line
"set smartindent
set expandtab                       " convert tab to spaces
set shiftwidth=4                    " size of tab char in spaces
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start      " allow to use backspace instead of "x"
set fo+=cr                          " fix <Enter> for comment
autocmd BufWritePre * :%s/\s\+$//e  " Delete spaces from end on lines
autocmd FocusLost * silent! wh      " Auto save files when focus is lost
autocmd BufLeave * silent! :w       "   or leave buffer
set pastetoggle=<Leader>p           " Invert paste mod

" View
set ruler                           " show cursor position
set mousehide                       " hide mouser corse in typing
set cursorline                      " highlight current position of cursor
set number                          " enable row numeration
let &sbr = nr2char(8618).' '        " show ↪ at the beginning of wrapped lines
set list listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:×

" Command line
set wildmenu                        " show autocompleate words
set showmatch                       " show matched paranthes

" Status bar
set showcmd                         " show unfinished commands
set laststatus=2                    " status bar alwais is visible
set statusline=%<%F\ %2*%y%m%r\
            \ %1*Line:\ %2*%l/%L[%P]\
            \ %1*Col:\ %2*%c\
            \ %=\
            \%0*[#%2*%n%0*]\
            \%3*-%{&fileencoding}-

" View
highlight lCursor guifg=NONE guibg=Cyan
set background=dark

" Folding
set foldlevel=5
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')

" Search
set incsearch                       " search when typing
set nohlsearch                      " disable highligting of found text
set ignorecase                      " search withoug casesensitive

" Sessions
set sessionoptions=curdir,buffers,folds,tabpages,winpos,winsize,resize,help
set sessionoptions+=unix,slash      " comfortable movement files from unix to windows

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" < & > - shift for code blocks
vmap < <gv
vmap > >gv

" remap for CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b

" gf opens file in new tab
map <silent> gf <C-W>gf:tabm 999<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Marks browser
map <leader>mb :MarksBrowser<cr>

" It's 2011. Don't skip wrap lines
noremap j gj
noremap k gk

" Acronyms
ab fucntion function
ab retrun return
