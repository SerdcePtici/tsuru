#!/usr/bin/env bash

# install software
sudo apt-get update
sudo apt-get install -y git build-essential nodejs sqlite3 imagemagick libsqlite3-dev postgresql-server-dev-all mc zsh

# setting up zsh
wget --no-check-certificate https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
sudo chsh vagrant -s /bin/zsh
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
cp /vagrant/box/.zshrc ~/

# install rbenv and ruby-build
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' > ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source .bash_profile

# install ruby, bundler and other gems
rbenv install 2.1.2
rbenv global 2.1.2
gem install bundler
rbenv rehash

# install project dependencies with bundler
cd /vagrant
bundle install