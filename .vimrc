" Reload .vimrc without restarting vim
" :so %
" :so $MYVIMRC

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'gcmt/taboo.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Marks-Browser'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/LargeFile'
Plugin 'ervandew/supertab'

Plugin 'altercation/vim-colors-solarized'
Plugin 'ChrisYip/Better-CSS-Syntax-for-Vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'ingydotnet/yaml-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'MediaWiki-folding-and-syntax-highlight'
Plugin 'mxw/vim-jsx'
Plugin 'fatih/vim-go'

Plugin 'corntrace/bufexplorer'
Plugin 'mileszs/ack.vim'
Plugin 'mg979/vim-visual-multi'

call vundle#end()            " required
filetype plugin indent on    " required

" Go
let g:go_fmt_command = "goimports"

" Bundles settings
let NERDTreeShowHidden = 1          " show hidden files and directories
let g:NERDTreeChDirMode=2           " change working directory
let g:taboo_tab_format=' %N:%f%m '  " taboo status line
let g:solarized_termtrans = 1       " fix colors for solarized scheme
set t_Co=256
let g:solarized_termcolors=256
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

" Common
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

set langmenu=none                   " use english menu
set hidden                          " don't unload buffer before switching
set autoread                        " autoread changing of file
set spelllang=ru_ru,en_us           " spellchecker for english and russian
set history=150                     " size of history
set undolevels=1000                 " max count of undo commands
set nobackup                        " don't make backup
set nowb
" NOTE: swapfile is enabled for crash recovery (noswapfile removed)
set confirm                         " provide confirm when you have unsaved changes
set path=.,,**                      " for recursive search
ca w!! w !sudo tee > /dev/null "%"  " sudo save

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
set formatoptions-=o                " dont continue comments when pushing o/O
set expandtab                       " convert tab to spaces
set shiftwidth=4                    " size of tab char in spaces
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start      " allow to use backspace instead of "x"
set fo+=cr                          " fix <Enter> for comment
augroup MyVimrc
  autocmd!
  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
  autocmd BufNewFile,BufRead *.wiki set filetype=wiki syntax=wp
  au BufNewFile,BufRead *.yaml,*.yml setf yaml
  " Delete spaces from end of lines (skip markdown and diff to preserve two-space line breaks)
  autocmd BufWritePre * if &filetype !~# 'markdown\|diff' | :%s/\s\+$//e | endif
  autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$## " Delete trailing lines at the end of file
  autocmd FocusLost * silent! wa      " Auto save files when focus is lost
  autocmd BufLeave * silent! :w       "   or leave buffer
augroup END
set pastetoggle=<Leader>p           " Invert paste mod

" View
set ruler                           " show cursor position
set mousehide                       " hide mouser corse in typing
set cursorline                      " highlight current position of cursor
set number                          " enable row numeration
set list listchars=tab:▸\ ,trail:·,extends:→,precedes:←,nbsp:×
set background=dark
colorscheme solarized

" Command line
set wildmenu                        " show autocompleate words
set showmatch                       " show matched paranthes

" Status bar
set showcmd                         " show unfinished commands
set laststatus=2                    " status bar alwais is visible
set statusline+=%<%F\ %2*%y%m%r\
            \ %1*Line:\ %2*%l/%L[%P]\
            \ %1*Col:\ %2*%c\
            \ %=\
            \%0*[#%2*%n%0*]\
            \%3*-%{&fileencoding}-

" Folding
set foldlevelstart=99
set foldmethod=indent
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set foldlevel=99

" Search
set incsearch                       " search when typing
set nohlsearch                      " disable highligting of found text
set ignorecase                      " search without casesensitive
set smartcase                       " override ignorecase when pattern has uppercase

" Sessions
set sessionoptions=curdir,buffers,folds,tabpages,winpos,winsize,resize,help
set sessionoptions+=unix,slash      " comfortable movement files from unix to windows

" < & > - shift for code blocks
vmap < <gv
vmap > >gv

" remap for CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

" gf opens file in new tab
map <silent> gf <C-W>gf:tabm 999<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Replace
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>

" Marks browser
map <leader>m :MarksBrowser<cr>

" Split navigation using arrows
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

" It's 2011. Don't skip wrap lines
noremap j gj
noremap k gk

" Acronyms
ab fucntion function
ab retrun return

" Local overrides
if filereadable(expand("~/.vimrc.local")) | source ~/.vimrc.local | endif
