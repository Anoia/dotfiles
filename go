#!/bin/bash -ex

trap 'echo -e " fail"' ERR

echo 'hello'

sudo -v

echo 'installing packages'
sudo apt install -y git vim zsh terminator &> /dev/null

echo 'making zsh your default shell'
sudo chsh -s $(which zsh) $USER

echo 'making terminator your default terminal emulator'
sudo update-alternatives --set x-terminal-emulator $(which terminator)

dotfiles=(
 .gitconfig
 .vimrc
 .config/terminator/config
)

echo 'setting up symlinks for dotfiles'

for dot in "${dotfiles[@]}"; do
	if [[ ! -L ~/$dot && ! -f ~/$dot ]]; then
		ln -s $(pwd)/$dot ~/$dot
		echo "~/$dot linked"
	else
		echo "$dot already exist"
	fi
done


if [[ ! -f /usr/bin/diff-so-fancy ]]; then
	curl -s https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy  > diff-so-fancy
    sudo mv diff-so-fancy /usr/bin/diff-so-fancy
    sudo chmod a+x /usr/bin/diff-so-fancy
    # todo: make ~/bin folder and add it to path in .zshrc, put stuff like this there
	echo 'downloaded diff-so-fancy'
else
    echo 'diff-so-fancy already there'
fi

