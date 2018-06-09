#!/usr/bin/env sh

cd ~/
TEST_FILES=~/test_files
GITHUB=$HOME/.github && mkdir $GITHUB
I3=$HOME/.github/i3 && mkdir $I3
MISC=$HOME/.github/misc && mkdir $MISC
ZSH=$HOME/.github/zsh && mkdir $ZSH

mkdir $TEST_FILES
mkdir ~/Pictures/screenshots
cd $GITHUB

cd $MISC
# Unreal Engine
# https://wiki.unrealengine.com/Building_On_Linux
git clone git@github.com:EpicGames/UnrealEngine.git
cd UnrealEngine
./Setup.sh && ./GenerateProjectFiles.sh && make
# now can test it with ./Engine/Binaries/Linux/UE4Editor
cd  /usr/bin
sudo ln -s $MISC/UnrealEngine/Engine/Binaries/Linux/UE4Editor ue4

# install ripgrep
cd $GITHUB && mkdir ripgrep && cd ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
sudo dpkg -i ripgrep_0.8.1_amd64.deb
# Install rclone
cd ..
curl -O https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
cd rclone-*-linux-amd64
sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone
sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb 

#git clone 

# Install vim
cd $GITHUB
# vim-gtk has clipboard support
sudo apt-get install vim-gtk
# git clone https://github.com/vim/vim
# cd vim
# ./configure \
#     --enable-multibyte \
#     --enable-perlinterp=dynamic \
#     --enable-rubyinterp=dynamic \
#     --with-ruby-command=/usr/bin/ruby \
#     --enable-pythoninterp=dynamic \
#     --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#     --enable-python3interp \
#     --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
#     --enable-luainterp \
#     --with-luajit \
#     --enable-cscope \
#     --enable-gui=auto \
#     --with-features=huge \
#     --with-x \
#     --enable-fontset \
#     --enable-largefile \
#     --disable-netbeans \
#     --with-compiledby="kev" \
#     --enable-fail-if-missing

# # make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
# # to easily uninstall vim by:
# # dpkg -r vim
# sudo apt install checkinstall
# sudo checkinstall
# # to complete installation of vim
# sudo make install
# # to set vim as default editor
# sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
# sudo update-alternatives --set editor /usr/local/bin/vim
# sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
# sudo update-alternatives --set vi /usr/local/bin/vim

cd $GITHUB
mkdir zsh; cd zsh
git clone https://github.com/zsh-users/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting 
#git clone 
#git clone 

cd $GITHUB
mkdir i3; cd i3
git clone https://github.com/haikarainen/light
cd light; make && sudo make install; cd ..
git clone https://github.com/vivien/i3blocks-contrib
#git clone 

# i3-alt-tab
cd $I3
git clone https://github.com/moqmar/i3-alt-tab 
cd i3-alt-tab
npm install eyespect i3
chmod +x index.js
cd /usr/bin
sudo ln -s $I3/index.js i3-alt-tab

cd $GITHUB

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd TEST_FILES


# Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
while true; do
    read -p "Do you have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88?" yn
    case $yn in
        [Yy]* ) 
            sudo add-apt-repository \
               "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
               $(lsb_release -cs) \
               stable"
            sudo apt-get update
            sudo apt-get install docker-ce
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
