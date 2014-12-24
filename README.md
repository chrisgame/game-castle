#Installation on OSX 10.10 Yosemite

install RVM
```
curl -sSL https://get.rvm.io | bash -s stable
```

make RVM available in all shell windows
```
source /Users/chris/.rvm/scripts/rvm
```

if everything has been successful you should get the version of RVM that has been installed when you run the following...
```
rvm -v
```

install ruby
```
rvm install ruby
```
rvm will now install homebrew and prompt you for an install location. The default is fine. Enter your password when prompted.

install the homesick gem
```
gem install homesick
```
```
homesick clone chrisgame/dotfiles
```

```
homesick symlink dotfiles
```

```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

```
vim +PluginInstall +qall
```

open vim
