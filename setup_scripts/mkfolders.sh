cd ~/
mkdir .github; cd .github

mkdir misc; cd misc
# install ripgrep
mkdir ripgrep; cd ripgrep
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
cd ~/.github
git clone https://github.com/vim/vim
cd vim
./configure \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-rubyinterp=dynamic \
    --with-ruby-command=/usr/bin/ruby \
    --enable-pythoninterp=dynamic \
    --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
    --enable-python3interp \
    --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
    --enable-luainterp \
    --with-luajit \
    --enable-cscope \
    --enable-gui=auto \
    --with-features=huge \
    --with-x \
    --enable-fontset \
    --enable-largefile \
    --disable-netbeans \
    --with-compiledby="kev" \
    --enable-fail-if-missing

# make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
# to easily uninstall vim by:
# dpkg -r vim
sudo apt install checkinstall
sudo checkinstall
# to complete installation of vim
sudo make install
# to set vim as default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim

cd ~/.github
mkdir zsh; cd zsh
git clone https://github.com/zsh-users/zsh-autosuggestions 
git clone https://github.com/zsh-users/zsh-syntax-highlighting 
#git clone 
#git clone 

cd ~/.github
mkdir i3; cd i3
git clone https://github.com/haikarainen/light
cd light; make && sudo make install; cd ..
git clone https://github.com/vivien/i3blocks-contrib
#git clone 
cd rclone

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
