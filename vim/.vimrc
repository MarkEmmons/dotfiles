"## Set tab length ##
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

"# 100 char columns
set colorcolumn=81
set textwidth=80

"# Enable mouse
set mouse=a

"# Show line numbers
set number

"# Allow wrapping
set whichwrap+=<,>,h,l,[,]

"# Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"# Switch windows with ctrl + hjkl
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"## Start Pathogen
execute pathogen#infect()
syntax enable
filetype plugin indent on

colorscheme noctu

"## Syntastic ##

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"# C/C++
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'gcc'

"# Rust


"## LaTeX ##
"# VimTex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"# Spellcheck
setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u


"## Tagbar ##
let g:tagbar_ctags_bin = "/usr/bin/ctags"

"# Keybindings
:nmap \e :NERDTreeToggle<Cr>
:nmap \t :TagbarToggle<Cr>
