#!/bin/bash

##### docker test ####
# docker pull ubuntu:18.04
# docker run -it --name utest ubuntu:18.04 bash
# adduser me 
# usermod -aG sudo me
# docker exec -it --user me utest bash

# # usermod -aG sudo username
# # docker exec -it --user utest utest bash

##############################
# install tools
##############################
sudo apt update
sudo apt install -y sudo git zip unzip zsh python3-pip tmux 
python3 -m pip install --upgrade pip

##############################
# install zsh
##############################
# chsh -s /usr/bin/zsh
zsh 
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# fast-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting ~/path/to/fsh
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh

##############################
# install neovim
##############################
# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
sudo apt install python3-neovim

# nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# coc.nvim
curl -sL install-node.now.sh/lts | bash

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

##############################
# install docker 
##############################
# docker
curl -fsSL https://get.docker.com/ | sudo sh
sudo usermod -aG docker $USER

# nvidia-docker



##############################
# update dotfiles
##############################

# remove previous
find ~/ -maxdepth 1 -name .bashrc -exec rm {} \;
find ~/ -maxdepth 1 -name .zshrc -exec rm {} \;
find ~/ -maxdepth 1 -name .vimrc -exec rm {} \;
find ~/ -maxdepth 1 -name .tmux.conf -exec rm {} \;
find ~/.config/nvim/ -maxdepth 1 -name init.vim -exec rm {} \;

git clone --bare https://github.com/ainklain/dotfiles $HOME/Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
dotfiles checkout





