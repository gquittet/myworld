" ========================================
"       Coded by Guillaume QUITTET
"         Date Sun. 5th Nov 2017
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

" Vim-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" c.vim : Speed up c writing on vim
Plug 'vim-scripts/c.vim'

" Clang-complete : for C/C++ autocomplete
Plug 'Rip-Rip/clang_complete'

" VIM-Dispatch : Useful for starting Omnisharp
Plug 'tpope/vim-dispatch'

" Dracula theme
Plug 'dracula/vim'

" Easy Motion : faster move in vim
" Press <Leader> <Leader> and the letter that you want to go
Plug 'easymotion/vim-easymotion'

" Eclim for neovim
Plug 'starcraftman/vim-eclim'

" Emmet : new ZenCoding
" Use abreviations and then type : <C-Y>,
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'

" Grammalecte
Plug 'dpelle/vim-Grammalecte'

" Indent Guide
Plug 'nathanaelkane/vim-indent-guides'

" Java auto complete
Plug 'vim-scripts/javacomplete'

" Jedi vim : Python completition
" Don't forget to install this : sudo pip install jedi
Plug 'davidhalter/jedi-vim'

" VIM-LaTeX : VIM as a LaTeX IDE
Plug 'vim-latex/vim-latex'

" Markdown Preview
Plug 'suan/vim-instant-markdown'

" Matchit : useful to switch between the start and the end of a function
Plug 'tmhedberg/matchit'

" NERDCommenter : Better comments in vim
Plug 'scrooloose/nerdcommenter'

" NERDTree
Plug 'scrooloose/nerdtree'

" Python-mode : VIM as a python ide
Plug 'klen/python-mode'

" Numbers.vim
Plug 'myusuf3/numbers.vim'

" Surround
Plug 'tpope/vim-surround'

" Syntastic : Check errors
Plug 'scrooloose/syntastic'
Plug 'Scuilion/gradle-syntastic-plugin'

" Tabular : useful for great alignement
Plug 'godlygeek/tabular'

" TagBar
" Install ctags before use it
Plug 'vim-scripts/Tagbar'

" Tern
" For JavaScript IDE features
Plug 'ternjs/tern_for_vim'

" TypeScript
" Dependencies
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" IDE Feature
Plug 'Quramy/tsuquyomi'
" Syntax highlighting
Plug 'leafgarland/typescript-vim'

" UndoTree : See all undos
Plug 'mbbill/undotree'

" ZoomWin : Show a buffer only without kill the others
" Use <C-w>o to show and hide buffer
Plug 'vim-scripts/ZoomWin'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required
syntax enable               " required



" ====================================================
" Global configuration
" ====================================================
"
set autowrite " Save automatically all the buffers in vim
set backup
set colorcolumn=81  " Set the 80 character column
set cursorline      " Highlight the current line
set encoding=utf-8
set expandtab       " Show spaces instead of tabs
set foldenable          " Auto fold code
set foldmethod=syntax       " Fold are defined by syntax highlighting
set formatoptions-=t      " Keep my textwidth setting
set hidden " Any buffer can be hidden
set history=1000 " Set a huge history
set hlsearch        " highlight the search result
set ignorecase                  " Case insensitive search
set incsearch       " Find as I type during the search
set linespace=0 " No extra spaces between rows
set list
set listchars=tab:»»,trail:•,nbsp:~ " Display invisible characters
set nojoinspaces    " Prevents inserting two spaces after punctuation on a join (J)
set path+=**        " fuzzy matching
set relativenumber  " set the number in vim
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set shiftwidth=4    " set the tab size
set showmatch       " Show current brackets
set smartcase                   " Case sensitive when uc present
set smartindent     " set auto ident
set splitbelow      " Puts new split windows to the bottom of the current
set splitright      " Puts new vsplit windows to the right of the current
set tabstop=4       " limit the tabs to 4
set textwidth=0           " Word wrap without line break
set wrapmargin=0          " Word wrap without line break
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set wrap                        " Set wrapping
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set winminheight=0              " Windows can be 0 line high
set wm=2            " set a space before the text

" Vim directories
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set viewdir=~/.local/share/nvim/views//

" Enable Omni Completiton
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"=====================================================
" Keymap configuration
"=====================================================
let mapleader = ","
let g:mapleader = ","

" Buffer
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>
nmap <leader>bf :bfirst<CR>
nmap <leader>bd :bdelete<CR>

" Disable the arrow keys
nmap <UP> <NOP>
nmap <DOWN> <NOP>
nmap <LEFT> <NOP>
nmap <RIGHT> <NOP>
imap <UP> <NOP>
imap <DOWN> <NOP>
imap <LEFT> <NOP>
imap <RIGHT> <NOP>
vmap <UP> <NOP>
vmap <DOWN> <NOP>
vmap <LEFT> <NOP>
vmap <RIGHT> <NOP>

" Git
nmap <leader>gs :Gstatus<CR>
nmap <leader>ga :Git add -A<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gp :Gpush<CR>
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>ge :Gedit<CR>

" Highlight
map <C-h> :nohl<CR>

" Languagetool
nmap <Leader>lc :LanguageToolCheck<CR>
vmap <Leader>lc :LanguageToolCheck<CR>
nmap <Leader>lh :LanguageToolClear<CR>
vmap <Leader>lh :LanguageToolClear<CR>
nmap <Leader>ls :call SwitchLanguage()<CR>
vmap <Leader>ls :call SwitchLanguage()<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" Numbers.vim
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Tabular
nmap <Leader>t& :Tabularize /&<CR>
vmap <Leader>t& :Tabularize /&<CR>
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t=> :Tabularize /=><CR>
vmap <Leader>t=> :Tabularize /=><CR>
nmap <Leader>t: :Tabularize /:<CR>
vmap <Leader>t: :Tabularize /:<CR>
nmap <Leader>t:: :Tabularize /:\zs<CR>
vmap <Leader>t:: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,<CR>
vmap <Leader>t, :Tabularize /,<CR>
nmap <Leader>t,, :Tabularize /,\zs<CR>
vmap <Leader>t,, :Tabularize /,\zs<CR>
nmap <Leader>t<Bar> :Tabularize /<Bar><CR>
vmap <Leader>t<Bar> :Tabularize /<Bar><CR>
nmap <Leader>t\ :Tabularize /\\<CR>
vmap <Leader>t\ :Tabularize /\\<CR>

" Tagbar
map <leader>tt :TagbarToggle<CR>

" Undo tree
map <Leader>u :UndotreeToggle<CR>

" ====================================================
" Plugins configuration
" ====================================================

" Airline
let g:airline#extensions#tabline#enabled = 1

" Clang completition
let g:clang_library_path='/usr/lib/'

" Git
" Useful git help
" Instead of reverting the cursor to the last position in the buffer, we
" " set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])


" Grammalecte
let g:grammalecte_cli_py='/opt/grammalecte/cli.py'

" Indent Guide
if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
endif

" VIM-LaTeX
let g:Tex_CompileRule_pdf = 'xelatex --synctex=1 -interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf, aux'
let g:livepreview_previewer = 'zathura'
autocmd Filetype tex setl updatetime=1
filetype indent on
let g:tex_flavor='latex'
set iskeyword+=:

" Numbers.vim
let g:enable_numbers = 1
let g:numbers_exclude = ['unite', 'startify', 'w3m', 'vimshell', 'tagbar', 'gundo', 'minibufexpl', 'nerdtree']
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Python-mode
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Thanks to SPF13-vim the best vim configuration
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1
" Ignore LaTeX lstlisting environnement
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ 'SOME OTHER SYNTASTIC MESSAGE'
        \ ] }

" TypeScript
" Refractor feature
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
" Syntastic integration
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
" Tooltip
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Undo tree
let g:undotree_SetFocusWhenToggle=1

"=====================================================
" Spellchecking
"=====================================================
map <F9> <Esc>:silent setlocal spell! spelllang=en<CR>
map <F10> <Esc>:silent setlocal spell! spelllang=fr<CR>
set spellsuggest=best

"=====================================================
" Theme
"=====================================================
" Set the full color compatibility for vim and terminal
syntax on
color dracula
set guifont=Fira\ Mono\ 10
hi Normal ctermbg=NONE
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guicursor= "Remove the gui cursor
