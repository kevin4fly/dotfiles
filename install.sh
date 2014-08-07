#!/usr/bin/env bash

# A simple installer for the dotfiles

# CONFIGURABLES ================================================================

# new directories if needed
NEW_DIRS[0]="vimtmp"
NEW_DIRS[1]="vim"
NEW_DIRS[2]="fonts"
NEW_DIRS[3]="config/fontconfig/conf.d"

for DIR in "${NEW_DIRS[@]}"; do
    if [[ ! -d ~/.$DIR ]]; then
        mkdir -p ~/.$DIR
    fi
done

# current path
CUR_PATH=$(pwd)

# a list of files need to be put into $HOME
SIMPLE_FILES[0]="bash/bashrc"
SIMPLE_FILES[1]="bash/bash_aliases"
SIMPLE_FILES[2]="bash/bash_after"

SIMPLE_FILES[3]="dircolors"

SIMPLE_FILES[4]="git/gitconfig"
SIMPLE_FILES[5]="git/gitignore"

SIMPLE_FILES[6]="inputrc"
SIMPLE_FILES[7]="pythonstartup"
SIMPLE_FILES[8]="tmux.conf"
SIMPLE_FILES[9]="valgrindrc"
SIMPLE_FILES[10]="vim/vimrc"

SIMPLE_FILES[11]="less/less"
SIMPLE_FILES[12]="less/lesskey"
SIMPLE_FILES[13]="less/less.sh"

SIMPLE_FILES[15]="procmailrc"

for FILE in "${SIMPLE_FILES[@]}"; do
    FILE_BASENAME=$(basename $FILE)
    rm -rf "$HOME/.$FILE_BASENAME"
    ln -s "$CUR_PATH/$FILE" "$HOME/.$FILE_BASENAME"
done

EXTENDED_FILES[0]="fonts/PowerlineSymbols.otf"
EXTENDED_FILES[1]="config/fontconfig/conf.d/10-powerline-symbols.conf"

for FILE in "${EXTENDED_FILES[@]}"; do
    rm -rf "$HOME/.$FILE"
    ln -s "$CUR_PATH/$FILE" "$HOME/.$FILE"
done

# a list of directories need to be put into $HOME
EXTENDED_DIRS[0]="cgdb/cgdbrc"
EXTENDED_DIRS[1]="vim/spell"
EXTENDED_DIRS[2]="vim/UltiSnips"
EXTENDED_DIRS[3]="mutt"

for DIR in ${EXTENDED_DIRS[@]}; do
    rm -rf "$HOME/.$DIR"
    ln -s "$CUR_PATH/$DIR" "$HOME/.$DIR"
done

# set the terminal ui
./gnome-terminal-profile.sh

# vim:ts=4:sw=4:sts=4:et:fdm=marker:ft=sh
