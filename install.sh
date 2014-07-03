#!/usr/bin/env sh

cur_path=$(pwd)

[ ! -d ~/.vim ] && mkdir ~/.vim
[ ! -d ~/.config ] && mkdir ~/.config

[ ! -r ~/.bashrc ] && ln -s ${cur_path}/bash/bashrc ~/.bashrc
[ ! -r ~/.bash_aliases ] && ln -s ${cur_path}/bash/bash_aliases ~/.bash_aliases
[ ! -r ~/.bash_after ] && ln -s ${cur_path}/bash/bash_after ~/.bash_after

[ ! -r ~/.dircolors ] && ln -s ${cur_path}/dircolors ~/.dircolors

[ ! -d ~/.fonts ] && ln -s ${cur_path}/fonts ~/.fonts
[ ! -d ~/.config/fontconfig ] && ln -s ${cur_path}/fontconfig ~/.config/fontconfig

[ ! -r ~/.gitignore ] && ln -s ${cur_path}/gitignore ~/.gitignore
[ ! -r ~/.gitconfig ] && ln -s ${cur_path}/gitconfig ~/.gitconfig

[ ! -r ~/.inputrc ] && ln -s ${cur_path}/inputrc ~/.inputrc

[ ! -r ~/.pythonstartup ] && ln -s ${cur_path}/pythonstartup ~/.pythonstartup

[ ! -r ~/.tmux.conf ] && ln -s ${cur_path}/tmux.conf ~/.tmux.conf

[ ! -r ~/.valgrindrc ] && ln -s ${cur_path}/valgrindrc ~/.valgrindrc

[ ! -r ~/.vimrc ] && ln -s ${cur_path}/vim/vimrc ~/.vimrc
[ ! -r ~/.vim/spell ] && ln -s ${cur_path}/vim/spell ~/.vim/spell
[ ! -r ~/.vim/UltiSnips ] && ln -s ${cur_path}/vim/UltiSnips ~/.vim/UltiSnips

# set the terminal ui
./gnome-terminal-profile.sh

# vim:ts=4:sw=4:sts=4:et:fdm=marker:ft=sh
