#!/usr/bin/env bash

# A simple installer for the dotfiles

# CONFIGURABLES ==============================================================

# new directories if needed
NEW_DIRS[0]="vimtmp"
NEW_DIRS[1]="vimtmp/yankring"
NEW_DIRS[2]="vimtmp/undo"
NEW_DIRS[3]="vimtmp/swap"
NEW_DIRS[4]="vimtmp/backup"
NEW_DIRS[5]="vimtmp/viminfo"
NEW_DIRS[6]="vim"
NEW_DIRS[7]="config/fontconfig/conf.d"
NEW_DIRS[8]="ipython/profile_default/startup"
NEW_DIRS[9]="w3m"
NEW_DIRS[10]="cgdb"

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

# a list of files need to be put into $HOME
EXTENDED_FILES[0]="config/fontconfig/conf.d/10-powerline-symbols.conf"
EXTENDED_FILES[1]="w3m/keymap"
EXTENDED_FILES[2]="w3m/config"
EXTENDED_FILES[3]="ipython/profile_default/startup/ipythonstartup.ipy"

for FILE in "${EXTENDED_FILES[@]}"; do
    rm -rf "$HOME/.$FILE"
    ln -s "$CUR_PATH/$FILE" "$HOME/.$FILE"
done

# a list of directories need to be put into $HOME
EXTENDED_DIRS[0]="fonts"
EXTENDED_DIRS[1]="cgdb/cgdbrc"
EXTENDED_DIRS[2]="vim/spell"
EXTENDED_DIRS[3]="vim/UltiSnips"
EXTENDED_DIRS[4]="vim/rc"
EXTENDED_DIRS[5]="vim/local_bundle"
EXTENDED_DIRS[6]="vim/tags"
EXTENDED_DIRS[7]="mutt"

for DIR in ${EXTENDED_DIRS[@]}; do
    rm -rf "$HOME/.$DIR"
    ln -s "$CUR_PATH/$DIR" "$HOME/.$DIR"
done

# set the terminal ui
. gnome-terminal-profile.sh

# support terminal italic font
cd terminal-italic-font/
. italic.sh

# vim:ts=4:sw=4:sts=4:et:fdm=marker:ft=sh
