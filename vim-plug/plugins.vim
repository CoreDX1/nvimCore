"|  \/  (_)  / ___|___  _ __  / _(_) __ _ _   _ _ __ __ _  ___(_) ___  _ __
"| |\/| | | | |   / _ \| '_ \| |_| |/ _` | | | | '__/ _` |/ __| |/ _ \| '_ \
"| |  | | | | |__| (_) | | | |  _| | (_| | |_| | | | (_| | (__| | (_) | | | |
"|_|  |_|_|  \____\___/|_| |_|_| |_|\__, |\__,_|_|  \__,_|\___|_|\___/|_| |_|
"                                   |___/
 
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " File Explorer
    Plug 'scrooloose/NERDTree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'justinmk/vim-sneak'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Estilos 
    "Plug 'mhinz/vim-signify'
    " Themes
    Plug 'arcticicestudio/nord-vim' 
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'morhetz/gruvbox'
    Plug 'mhinz/vim-startify' 
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdcommenter'
    Plug 'mhartington/oceanic-next'
    Plug 'ghifarit53/tokyonight-vim'
    " Autocompletado
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    " Syntax
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'mattn/emmet-vim'

    " Git  
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/gv.vim'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter' 




call plug#end()

" Themes
set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_transparent_background = 0
let g:tokyonight_menu_selection_background = 'red'
let g:lightline = {'colorscheme' : 'tokyonight'}

colorscheme tokyonight

" SingniFy ---------------------

set updatetime=100

" SingniFy ---------------------

" LSP Configuration ---------------

lua << EOF
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

" LSP Configuration ---------------

    nnoremap <silent> <F2> :NERDTreeFind<CR>
    nnoremap <silent> <F3> :NERDTreeToggle<CR>

" Shortcuts for split navigation ---------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcuts for split navigation ---------------

" Easymotion ---------------------------
nmap <Leader>f <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

" Easymotion ---------------------------

" Move 1 more lines up or down in normal and visual selection modes. -----
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-k> :m '<-2<CR>gv=gv
nnoremap <A-j> :m .+1<CR>==
vnoremap <a-j> :m '>+1<CR>gv=gv

" Move 1 more lines up or down in normal and visual selection modes. -----

" Prettier configuration --------
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <C-D> :Prettier <CR>

" Prettier configuration --------

" Arilene ------------

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0
let g:airline_theme='base16_twilight'
let g:airline#extensions#tabline#formatter = 'default'

" Arilene ------------

" Navegar entre Buffer --------
nnoremap <M-Right> :bn<cr>
nnoremap <M-Left> :bp<cr>
nnoremap <c-x> :bp\|bd #<cr>

" Navegar entre Buffer --------

" Node -----

nnoremap <C-L> :!node %<cr>

" Node -----

" Comentar las lines

filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

