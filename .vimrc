call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround' 
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ambv/black'
Plug 'elzr/vim-json'
Plug 'tmhedberg/SimpylFold'
Plug 'ojroques/vim-scrollstatus'
" Initialize plugin system
call plug#end()

" for airline theme
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_x = '%{ScrollStatus()}'

" see docstring for folded code
let g:SimpylFold_docstring_preview = 1

" Enable folding with the spacebar
nnoremap <space><space> za
set foldmethod=indent
set foldlevel=99

" Black(Python) format the visual selection: \k
xnoremap <Leader>k :!black -q -<CR>

"g to show git commit
map <silent><Leader>g :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" reduce vim-gitgutter updating time
set updatetime=100

set number 		 " show line numbers
set tabstop=4    " set tabs to have 4 spaces
set autoindent   " indent when moving to the next line while writing code
set expandtab    " expand tabs into spaces
set shiftwidth=4 " when using the >> or << commands, shift lines by 4 spaces
"set cursorline   " show a visual line under the cursor's current line
set showmatch    " show the matching part of the pair for [] {} and ()
set showmatch 	 " Shows matching brackets
set ruler 		 " Always shows location in file (line#)
set smarttab 	 " Autotabs for certain code
syntax enable    " enable syntax highlighting
syntax on 		 " Syntax highlighting
let python_highlight_all = 1 " enable all Python syntax highlighting features

" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>
inoremap kj <esc>

" vanilla vim auto bracket
" https://stackoverflow.com/questions/21316727/automatic-closing-brackets-for-vim
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O
"set paste

"Use space as leader key
noremap <Space> :

"python
autocmd Filetype python :iabbrev ppp print("
autocmd Filetype python :iabbrev ppf print(f"

nnoremap gh <C-W><C-H>
nnoremap gj <C-W><C-J>
nnoremap gk <C-W><C-K>
nnoremap gl <C-W><C-L>

