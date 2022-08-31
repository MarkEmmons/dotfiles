" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree' |
	\ Plug 'Xuyuanp/nerdtree-git-plugin' |
	\ Plug 'ryanoasis/vim-devicons'

Plug 'noahfrederick/vim-noctu'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"## Set tab length ##
set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0

set number relativenumber

colorscheme noctu

:nmap \e :NERDTreeToggle<Cr>
:nmap q :lclose<Cr>
