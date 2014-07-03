#!/usr/bin/env bash

# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# new directories if needed
NEW_DIRS[0]="vimtmp"
NEW_DIRS[1]="vim"
NEW_DIRS[2]="config"

for DIR in "${NEW_DIRS[@]}"; do
    if [[ ! -d ~/.$DIR ]]; then
        mkdir -p ~/.$DIR
    fi
done

# current path
CUR_PATH=$(pwd)

# a list of files need to be put into $HOME
SIMPLE_FILES[0]="dircolors"
SIMPLE_FILES[1]="gitconfig"
SIMPLE_FILES[2]="gitignore"
SIMPLE_FILES[3]="inputrc"
SIMPLE_FILES[4]="pythonstartup"
SIMPLE_FILES[5]="valgrindrc"
SIMPLE_FILES[6]="tmux.conf"
SIMPLE_FILES[7]="bash/bashrc"
SIMPLE_FILES[8]="bash/bash_aliases"
SIMPLE_FILES[9]="bash/bash_after"
SIMPLE_FILES[10]="vim/vimrc"

for FILE in "${SIMPLE_FILES[@]}"; do
    FILE_BASENAME=$(basename $FILE)
    rm -rf "$HOME/.$FILE_BASENAME"
    ln -s "$CUR_PATH/$FILE" "$HOME/.$FILE_BASENAME"
done

# a list of directories need to be put into $HOME
EXTENDED_DIRS[0]="fonts"
EXTENDED_DIRS[1]="config/fontconfig"
EXTENDED_DIRS[2]="vim/spell"
EXTENDED_DIRS[3]="vim/UltiSnips"

for DIR in ${EXTENDED_DIRS[@]}; do
    rm -rf "$HOME/.$DIR"
    ln -s "$CUR_PATH/$DIR" "$HOME/.$DIR"
done

# set the terminal ui
./gnome-terminal-profile.sh

# vim:ts=4:sw=4:sts=4:et:fdm=marker:ft=sh
