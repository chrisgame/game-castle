#Installation

cd ~

rvm gemset use global

gem install homesick

homesick clone chrisgame/dotfiles

homesick symlink dotfiles

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +PluginInstall +qall

open vim
