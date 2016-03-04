convinient-dots
===============

Default configuration for unix work environment:

QuickInstall (probably not working atm)
---------------------------------------
```ruby
curl https://raw.githubusercontent.com/scusy/dotfiles/master/install.sh | sh
```

Install
-------

```ruby
# Install zsh
sudo apt-get install zsh
# Change shell to zsh
chsh -s /bin/zsh
# Install rbenv
curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
# Install ruby
rbenv install 2.1.4
rbenv global 2.1.4
# Install tmuxinator
gem install tmuxinator
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Install dots
git clone http://github.com/scusy/dotfiles ~/.dots
ln -s ~/.cdots/vim ~/.vim
ln -s ~/.cdots/vim/.vimrc ~/.vimrc
rm ~/.zshrc
ln -s ~/.cdots/.zshrc ~/.zshrc
ln -s ~/.cdots/tmux.conf ~/.tmux.conf
~/.cdots/base16-google.dark.sh
```

