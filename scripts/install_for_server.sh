# install Vundle
mkdir ~/.vim
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim

## install plugins
vim +PluginInstall +qall


# for coc.nvim, install node.js and npm
# this is the code if you cannot use `sudo`.
wget https://nodejs.org/dist/v16.13.0/node-v16.13.0-linux-x64.tar.xz
tar -xvf node-v16.13.0-linux-x64.tar.xz
## copy the node and npm
cp node-v16.13.0-linux-x64/bin/node ~/.local/bin/node
cp node-v16.13.0-linux-x64/lib/node_modules/npm/bin/npm ~/.local/bin/npm
cp -R node-v16.13.0-linux-x64/lib/node_modules ~/.local/bin/
# remove the temporal archive file and folder
rm -R node-v16.13.0-linux-x64
rm node-v16.13.0-linux-x64.tar.xz
