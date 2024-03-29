#Installation on OSX 10.10 Yosemite

create an ssh key
follow the instructions here https://help.github.com/articles/generating-ssh-keys/

install OSX commandline tools
```
xcode-select --install
```

install Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

install RVM
```
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

make RVM available in all shell windows
```
source /Users/chris/.rvm/scripts/rvm
```

if everything has been successful you should get the version of RVM that has been installed when you run the following...
```
rvm -v
```

install the homesick gem
```
gem install homesick
```
```
homesick clone chrisgame/game-castle
```

```
homesick symlink game-castle
```

Open the terminal and from the Terminal menu select Preferences. Then select Profiles and then click the cog at the bottom of the window and select import. Select
```
~/jellybeans.terminal
```
and then click open. Then click the default button in the bottom right of the left hand pane.

Install any missing dependencies
```
homesick rc game-castle
```

Install the lateset version of node for example

```
nvm install 0.12.7
```

close and then reopen the terminal and then open vim
