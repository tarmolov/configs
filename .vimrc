" Reload .vimrc withour restarting vim
" :so %
" :so $MYVIMRC

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
Bundle 'bkad/CamelCaseMotion'
Bundle 'gcmt/taboo.vim'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Marks-Browser'
Bundle 'matchit.zip'
Bundle 'Quramy/tsuquyomi'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/LargeFile'
Bundle 'vim-syntastic/syntastic'

Bundle 'altercation/vim-colors-solarized'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'ingydotnet/yaml-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'leafgarland/typescript-vim'
Bundle 'MediaWiki-folding-and-syntax-highlight'
Bundle 'mxw/vim-jsx'

Bundle 'corntrace/bufexplorer'
Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-multiple-cursors'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

" Bundles settings
let NERDTreeShowHidden = 1          " show hidden files and directories
let g:NERDTreeChDirMode=2           " change working directory
let g:taboo_tab_format=' %N:%f%m '  " taboo status line
let g:solarized_termtrans = 1       " fix colors for solarized scheme
set t_Co=256
let g:solarized_termcolors=256
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Common
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd BufNewFile,BufRead *.wiki set filetype=wiki syntax=wp
au BufNewFile,BufRead *.yaml,*.yml setf yaml
set langmenu=none                   " use english menu
set hidden                          " don't unload buffer before switching
set autoread                        " autoread changing of file
set spelllang=ru_ru,en_us           " spellchecker for english and russian
set history=150                     " size of history
set undolevels=1000                 " max count of undo commands
set nobackup                        " don't make backup
set noswapfile                      " and swap
set nowb
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
let mapleader = "\<Space>"          " remap <Leader> key

set completeopt=longest,menuone     " autocompletion
set autoindent                      " inherit indent from previous line
set formatoptions-=o                " dont continue comments when pushing o/O
set expandtab                       " convert tab to spaces
set shiftwidth=4                    " size of tab char in spaces
set softtabstop=4
set tabstop=4
set backspace=indent,eol,start      " allow to use backspace instead of "x"
set fo+=cr                          " fix <Enter> for comment
autocmd BufWritePre * :%s/\s\+$//e  " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$## " Delete trailing lines at the end of file
autocmd FocusLost * silent! wh      " Auto save files when focus is lost
autocmd BufLeave * silent! :w       "   or leave buffer
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
set statusline=%<%F\ %2*%y%m%r\
            \ %1*Line:\ %2*%l/%L[%P]\
            \ %1*Col:\ %2*%c\
            \ %=\
            \%0*[#%2*%n%0*]\
            \%3*-%{&fileencoding}-

" Folding
set foldlevelstart=3
set foldmethod=syntax
set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
set foldlevel=99

" Search
set incsearch                       " search when typing
set nohlsearch                      " disable highligting of found text
set ignorecase                      " search withoug casesensitive

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
map <leader>mb :MarksBrowser<cr>

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

" Typescript
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_typescript_tsc_fname = ''
let g:tsuquyomi_disable_quickfix = 1
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_completion_preview = 1
let g:tsuquyomi_definition_split = 3 " open definition in new tab
nnoremap <silent> <leader>h :echo tsuquyomi#hint()<CR>
