ln -s ~/dotfiles/.vimrc ~/.vimrc

source $(dirname "${BASH_SOURCE[0]:-$0}")/lib/powerline.sh

powerline

sudo apt install nodejs npm
npm install -g yarn
cd ~/.vim/bundle/coc.nvim
yarn install
cd ~
