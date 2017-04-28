#!/bin/bash

install_dotfiles(){

	# Install Pathogen
	mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
	curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	# Install YCM
	cd $HOME/.vim/bundle && \
	git clone https://github.com/Valloric/YouCompleteMe.git
	
	cd YouCompleteMe
	git submodule update --init --recursive
	python2 install.py --clang-completer --system-libclang

	# Install Syntastic
	cd $HOME/.vim/bundle && \
	git clone https://github.com/scrooloose/syntastic.git

	# Install Nerdtree
	cd $HOME/.vim/bundle && \
	git clone https://github.com/scrooloose/nerdtree.git

	# Install Tagbar
	cd $HOME/.vim/bundle && \
	git clone https://github.com/majutsushi/tagbar.git 

	# Install Vim-airline
	cd $HOME/.vim/bundle && \
	git clone https://github.com/vim-airline/vim-airline.git

	# Install Vim-airline themes
	cd $HOME/.vim/bundle && \
	git clone https://github.com/vim-airline/vim-airline-themes.git

	# Stow dotfiles
	cd $HOME/dotfiles
	stow chromium
	stow i3
	stow vim
	stow x
	stow zsh
	cd $HOME

	# Install ohmyzsh
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	rm .zshrc
	mv .zshrc.pre-oh-my-zsh .zshrc

}

update_dotfiles(){

	# Update YCM submodules
	cd $HOME/.vim/bundle/YouCompleteMe/ &&
		git submodule update --init --recursive

	# Update Pathogen plugins
	for i in $HOME/.vim/bundle/*; do git -C $i pull; done
	
}

# Update or install
if [[ $# -ne 1 ]]; then
	echo "ERROR: Expected exactly 1 argument got $#."
	exit 1
fi

case $1 in
	-i|--install)
		echo "Installing dotfiles..."
		install_dotfiles
		;;
	-u|--update)
		echo "Updating dotfiles..."
		update_dotfiles
		;;
	*)
		echo "ERROR: Unknown argument $key."
		exit 1
		;;
esac