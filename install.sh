#!/bin/bash
touch ~/log.log
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
echo "install tools ..." >> ~/log.log

sudo apt update
sudo apt install -y -qq sudo curl git zip unzip zsh python3-pip tmux language-pack-en
python3 -m pip install --upgrade pip

echo "install tools done" >> ~/log.log
echo "install tools done"  
##############################
# install zsh
##############################
echo "install zsh ..." >> ~/log.log
# chsh -s /usr/bin/zsh
# zsh 
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "install zsh [oh-my-zsh done]" >> ~/log.log

# locale
sudo update-locale

# font - powerline
sudo mkdir $HOME/agnoster_theme
cd $HOME/agnoster_theme
sudo git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
sh ./install.sh
cd ..
rm -rf fonts


# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
echo "install zsh [zsh-autosuggestions done]" >> ~/log.log

# fast-syntax-highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting ~/path/to/fsh
source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh
echo "install zsh [fast-syntax-highlighting]" >> ~/log.log

echo "install zsh done" >> ~/log.log
echo "install zsh done" 

##############################
# install neovim
##############################
echo "install neovim .." >> ~/log.log
# neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
# sudo apt-get install -y neovim
sudo apt install -y -qq python3-neovim

# nodejs
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y -qq nodejs
echo "install neovim[nodejs done]" >> ~/log.log

# coc.nvim
curl -sL install-node.now.sh/lts | bash
echo "install neovim[coc done]" >> ~/log.log

# vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "install neovim[vimplug done]" >> ~/log.log

echo "install neovim done" >> ~/log.log
##############################
# install docker 
##############################
echo "install docker ..." >> ~/log.log
# docker
curl -fsSL https://get.docker.com/ | sudo sh
sudo usermod -aG docker $USER
echo "install docker [docker done]" >> ~/log.log

# nvidia-docker

echo "install docker done" >> ~/log.log

##############################
# update dotfiles
##############################

echo "update dotfiles" >> ~/log.log

# # remove previous

sudo mkdir $HOME/backup_dots
if [ -e $HOME/.bashrc ]; then
	sudo mv $HOME/.bashrc $HOME/backup_dots/.bashrc
	echo "found and moved .bashrc to backup_dots/"
fi
if [ -e $HOME/.zshrc ]; then
	sudo mv $HOME/.zshrc $HOME/backup_dots/.zshrc
	echo "found and moved .zshrc to backup_dots/"
fi
if [ -e $HOME/.vimrc ]; then
	sudo mv $HOME/.vimrc $HOME/backup_dots/.vimrc
	echo "found and moved .vimrc to backup_dots/"
fi
if [ -e $HOME/.tmux.conf ]; then
	sudo mv $HOME/.tmux.conf $HOME/backup_dots/.tmux.conf
	echo "found and moved .tmux.conf to backup_dots/"
fi
if [ -e $HOME/.config/nvim/init.vim ]; then
	sudo mv $HOME/.config/nvim/init.vim $HOME/backup_dots/init.vim
	echo "found and moved init.vim to backup_dots/"
fi


# find ~/ -maxdepth 1 -name .bashrc -exec rm {} \;
# find ~/ -maxdepth 1 -name .zshrc -exec rm {} \;
#find ~/ -maxdepth 1 -name .vimrc -exec rm {} \;
#find ~/ -maxdepth 1 -name .tmux.conf -exec rm {} \;
#find ~/.config/nvim/ -maxdepth 1 -name init.vim -exec rm {} \;
echo "update dotfiles[prev dotfiles moved]" >> ~/log.log

sudo rm -r $HOME/Dotfiles
git clone --bare https://github.com/ainklain/dev_environment $HOME/Dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
sudo rm $HOME/README.md $HOME/LICENSE
dotfiles checkout
echo "update dotfiles done" >> ~/log.log

echo "all done" >> ~/log.log




