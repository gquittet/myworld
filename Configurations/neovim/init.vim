" ========================================
"       Coded by Guillaume QUITTET
"         Date Sun. 26th Nov 2017
" ========================================
call plug#begin('~/.local/share/nvim/plugged')

" Vim-Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ALE (Asynchronous Lint Engine)
Plug 'w0rp/ale'

" Vim-Android
Plug 'hsanson/vim-android'

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

" Emmet : new ZenCoding
" Use abreviations and then type : <C-Y>,
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'

" Grammalecte
Plug 'dpelle/vim-Grammalecte'

" Indent Guide
Plug 'nathanaelkane/vim-indent-guides'

" JavaComplete2
Plug 'artur-shaik/vim-javacomplete2'

" Jedi vim : Python completition
" Don't forget to install this : sudo pip install jedi
Plug 'davidhalter/jedi-vim'

" Matchit : useful to switch between the start and the end of a function
Plug 'tmhedberg/matchit'

" NERDCommenter : Better comments in vim
Plug 'scrooloose/nerdcommenter'

" NERDTree
Plug 'scrooloose/nerdtree'

" Numbers.vim
Plug 'myusuf3/numbers.vim'

" Paper color theme
Plug 'NLKNguyen/papercolor-theme'

" PHP Autocomplete
Plug 'shawncplus/phpcomplete.vim'

" Surround
Plug 'tpope/vim-surround'

" Tabular : useful for great alignement
Plug 'godlygeek/tabular'

" TagBar
" Install ctags before use it
Plug 'majutsushi/tagbar'

" Tern
" For JavaScript IDE features
Plug 'ternjs/tern_for_vim'

" VimTex
Plug 'lervag/vimtex'

" NVIM-TypeScript
Plug 'mhartington/nvim-typescript'
" Syntax highlighting
Plug 'leafgarland/typescript-vim'

" UndoTree : See all undos
Plug 'mbbill/undotree'

" ZoomWin : Show a buffer only without kill the others
" Use <C-w>o to show and hide buffer
Plug 'vim-scripts/ZoomWin'

" All of your Plugins must be added before the following line
call plug#end()             " required
syntax enable               " required



" ====================================================
" Global configuration
" ====================================================

set autowrite                       " Save automatically all the buffers in vim
set backup
set colorcolumn=81                  " Set the 80 character column
set cursorline                      " Highlight the current line
set encoding=utf-8
set hidden                          " Any buffer can be hidden
set history=1000                    " Set a huge history
set linespace=0                     " No extra spaces between rows
set nojoinspaces                    " Prevents inserting two spaces after punctuation on a join (J)
set path+=**                        " fuzzy matching
set relativenumber                  " set the number in vim
set scrolljump=5                    " Lines to scroll when cursor leaves screen
set scrolloff=3                     " Minimum lines to keep above and below cursor
set showmatch                       " Show current brackets
set splitbelow                      " Puts new split windows to the bottom of the current
set splitright                      " Puts new vsplit windows to the right of the current
set wildmenu                        " Show list instead of just completing
set wildmode=list:longest,full      " Command <Tab> completion, list matches, then longest common part, then all.
set winminheight=0                  " Windows can be 0 line height

" Folding
set foldenable          " Auto fold code
set foldmethod=syntax   " Fold are defined by syntax highlighting

" Indentation
" Don't enable smarindent or cindent with filetype plugin indent on
filetype plugin indent on   " Indentation based on filetype
set autoindent              " Does not interfere with other indentation settings

" Invisible characters
set list
set listchars=tab:»»,trail:•,nbsp:~     " Display invisible characters

" Omni Completiton
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType typescript setlocal omnifunc=TSComplete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Search
set hlsearch     " highlight the search result
set ignorecase   " Case insensitive search
set incsearch    " Find as I type during the search
set smartcase    " Case sensitive only if search contains uppercase letter.

" Tabulation and spaces
set expandtab            " Show spaces instead of tabs
set shiftwidth=4         " columns per <<
set softtabstop=4        " spaces per tab
set tabstop=4            " columns per tabs

" Vim directories
set backupdir=~/.local/share/nvim/backup//
set directory=~/.local/share/nvim/swap//
set viewdir=~/.local/share/nvim/views//

" Wrapping
set formatoptions-=t             " Keep my textwidth setting
set textwidth=0                  " Word wrap without line break
set wrapmargin=0                 " Word wrap without line break
set whichwrap=b,s,h,l,<,>,[,]    " Backspace and cursor keys wrap too
set wrap linebreak               " Set wrapping with soft wrap (set wm=2 => hard wrap)



"=====================================================
" Keymap configuration
"=====================================================

let mapleader = ","
let g:mapleader = ","

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

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
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>

" Tagbar
map <leader>tt :TagbarToggle<CR>

" Undo tree
map <Leader>u :UndotreeToggle<CR>



" ====================================================
" Plugins configuration
" ====================================================

" Airline
let g:airline#extensions#ale#enabled = 1

" ALE
" Lint only when I save the file
" let g:ale_lint_on_text_changed = 'never'
" Linters
let g:ale_linters = {
\   'tex': ['chktex', 'proselint', 'write-good'],
\}

" Android
let g:android_sdk_path = "/opt/android/sdk"

" Clang completition
let g:clang_library_path='/usr/lib/'

" Git
" Useful git help
" Instead of reverting the cursor to the last position in the buffer, we set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Grammalecte
let g:grammalecte_cli_py='/opt/grammalecte/cli.py'

" Indent Guide
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Numbers.vim
let g:enable_numbers = 1
let g:numbers_exclude = ['unite', 'startify', 'w3m', 'vimshell', 'tagbar', 'gundo', 'minibufexpl', 'nerdtree']
:au FocusLost * :set number
:au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

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

" Use GUI colors in terminal
if (has("termguicolors"))
    set termguicolors
endif
" Set the full color compatibility for vim and terminal
syntax enable
color dracula
"color PaperColor
"set background=light
set guifont=Fira\ Mono\ 10
hi Normal ctermbg=NONE
set guioptions-=m    " remove menu bar
set guioptions-=T    " remove toolbar
set guioptions-=r    " remove right-hand scroll bar
set guioptions-=L    " remove left-hand scroll bar
