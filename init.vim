language en_US

set relativenumber
set number
set mouse=a
inoremap jj <Esc>
set clipboard=unnamedplus
set nohlsearch
set softtabstop=4 shiftwidth=4 expandtab

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" In Neovim, zL only works when 'warp' is off
" set nowrap

" To rebind Ctrl+Shift+h and Ctrl+Shift+l to perform horizontal scrolling
" In Neovim, <C-H> and <C-h> are treated as the same key combination
nnoremap <C-S-h> zh
nnoremap <C-S-l> zl

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" If you like "Y" to work from the cursor to the end of line
" which is more logical, but not Vi-compatible
map Y y$

" Don't give "search hit BOTTOM, continuing at TOP" or "search
" hit TOP, continuing at BOTTOM" messages
set shm+=s

" If your '{' or '}' are not in the first column, and you would like to use "[["
" and "]]" anyway, try these mappings: >
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" remap backtick mark with single-quote mark globally
noremap ' `
noremap ` '

" To turn on omni completion
set omnifunc=syntaxcomplete#Complete

" Swap , and : in normal mode
"  noremap : ,
"  noremap , :
"  nnoremap g: g,
"  nnoremap g, g:
"  nnoremap q: q,
"  nnoremap q, q:

" Remap line motion commands
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
nnoremap 0 g0
nnoremap g0 0
nnoremap ^ g^
nnoremap g^ ^
nnoremap $ g$
nnoremap g$ $

" Set smartcase for searching and replacing
set ignorecase
set smartcase

" Enable Vim to perform case insensitive autocompletion of filenames or directories
set wildignorecase

" Personal preferences not set by sensible.vim
let g:mapleader=","
set history=5000
set noswapfile

" Make search results appear in the middle of the screen
nnoremap <Leader>n nzz
nnoremap <Leader>N Nzz
nnoremap <Leader>* *zz
nnoremap <Leader># #zz

" File opening
cnoremap <expr> %%  getcmdtype() == ':' ? fnameescape(expand('%:h')).'/' : '%%'

map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Fix the & command in normal+visual modes {{{2
nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

" enable the 'hidden' setting before running ':*do' commands
set hidden

" Plugin configuration {{{1
" netrw.vim {{{2
let g:netrw_banner=0
let g:netrw_liststyle = 3
let g:netrw_altv = 1

" changing focus between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" rename the package manager commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" minpac
packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
" An excellent Vim's syntax highlighting file for Vim script.
call minpac#add('vim-jp/syntax-vim-ex')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

" General enhancements
" Comment stuff out. Use gcc to comment out a line (takes a count).
call minpac#add('tpope/vim-commentary')
" Start a * or # search from a visual block
call minpac#add('nelstrom/vim-visual-star-search')

" Shows a git diff in the gutter (sign column) and stages/undoes hunks.
call minpac#add('airblade/vim-gitgutter')
set updatetime=100
let g:gitgutter_enabled = 0
" Explicitly turn vim-gitgutter off and on
" A mnemonic for this mapping is "git gutter"
nnoremap <silent> <Leader>gg :GitGutterToggle<CR>

" remapping of :bprev to [b and :bfirst to [B
call minpac#add('tpope/vim-unimpaired')
" provides mappings to easily delete, change and add surroundings in pairs.
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
" insert or delete brackets, parens, quotes in pair
call minpac#add('jiangmiao/auto-pairs')

" Custom textobjects
" "vim-textobj-user" is the foundation of user defined text objects
call minpac#add('kana/vim-textobj-user')
" ae ie, where e stands for "entire"
call minpac#add('kana/vim-textobj-entire')
" ai ii aI iI, where i stands for "indent"
call minpac#add('kana/vim-textobj-indent')
" ay iy, where y stands for "syntax"
call minpac#add('kana/vim-textobj-syntax')
" al il, where l stands for "line"
call minpac#add('kana/vim-textobj-line')

" vinegar enhances netrw
call minpac#add('tpope/vim-vinegar')

" Load the plugins right now. (optional)
" packloadall

" Set the vim-airline-thems.
let g:airline_theme='papercolor'

" Live substitution
set inccommand=nosplit

" Color schemes
call minpac#add('crusoexia/vim-monokai')
" colorscheme monokai
let g:monokai_term_italic = 1

call minpac#add('tomasiser/vim-code-dark')
colorscheme codedark

" Make the yanked region apparent
call minpac#add('machakann/vim-highlightedyank')

" Press <Leader>l to toggle highlighting on/off, and show current value.
nnoremap <Leader>l :set hlsearch! hlsearch?<CR>
nnoremap <Leader>gl <C-l>

" New mappings to paste in a new line below or above, respectively
nnoremap <silent> <Leader>p :put<CR>
nnoremap <silent> <Leader>P :put!<CR>
" New mapping to duplicate the current line not overwriting reg" and reg0
nnoremap <silent> <Leader>t :t.<CR>

" Count matches with the ':substitute' command.
" A mnemonic for this mapping is "statistic"
nnoremap <silent> <Leader>s :%s///gn<CR>

" Count matches with the ':vimgrep' command.
" A mnemonic for this mapping is "grep statistic"
nnoremap <silent> <Leader>gs :vimgrep //g %<CR>

" Experimental mappings {{{2
nnoremap <Leader>0 /\<<C-r>0\><CR>
nnoremap <Leader>g0 /<C-r>0<CR>
nnoremap <Leader>" /\<<C-r>"\><CR>
nnoremap <Leader>g" /<C-r>"<CR>

" New mapping to quickly reuse the last search pattern
" leaving complete record in command history.
" A mnemonic for this mapping is "search then substitute"
nnoremap <Leader>ss :%s/<C-r>//

" New mapping to quickly swap two words
" A mnemonic for these pair of mapping is "sWapping"
" delete the current word/Word under the cursor and set a mark
nnoremap <Leader>w diwmm
nnoremap <Leader>W diWmm
" visually select the other word/Word under the cursor
" swap it with the first word/Word stored in reg"
" then jump back to the position of first word/Word to put the second word/Word there
nnoremap <Leader>gw viwp`mP
nnoremap <Leader>gW viWp`mP
