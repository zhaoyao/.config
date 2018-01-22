#! /bin/sh

d=$(pwd)

# zsh
ln -sf $d/zshrc $HOME/.zshrc
ln -sf $d/zsh $HOME/.zsh

# tmux
ln -sf $d/tmux/tmux.conf $HOME/.tmux.conf

# git
ln -sf $d/git/gitconfig $HOME/.gitconfig
ln -sf $d/git/gitignore_global $HOME/.gitignore_global
