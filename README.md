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
# Install zsh, tmuxinator
sudo apt-get install zsh tmuxinator
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

