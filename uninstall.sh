#!/usr/bin/env bash

# uninstall the whole dotfiles and generated directories and files

# remove all directories except vim and fonts since there may be other things
# which are not created by ./install.sh, we should not delete that stuff
NEW_DIRS[0]="vimtmp"
NEW_DIRS[1]="vimtmp/yankring"
NEW_DIRS[2]="vimtmp/undo"
NEW_DIRS[3]="vimtmp/swap"
NEW_DIRS[4]="vimtmp/backup"
NEW_DIRS[5]="vimtmp/viminfo"
NEW_DIRS[6]="vimtmp/view"
# NEW_DIRS[7]="vim"
NEW_DIRS[8]="ipython/profile_default/startup"
NEW_DIRS[9]="w3m"
NEW_DIRS[10]="cgdb"
# NEW_DIRS[11]="fonts"

for DIR in "${NEW_DIRS[@]}"; do
    if [[ -a ~/.$DIR ]]; then
        rm -rf ~/.$DIR
    fi
done

# a list of files have to be removed
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
done

# a list of files have to be removed
EXTENDED_FILES[0]="w3m/keymap"
EXTENDED_FILES[1]="w3m/config"
EXTENDED_FILES[2]="ipython/profile_default/startup/ipythonstartup.ipy"

for FILE in "${EXTENDED_FILES[@]}"; do
    rm -rf "$HOME/.$FILE"
done

# a list of directories have to be removed
EXTENDED_DIRS[0]="fonts/powerline-fonts"
EXTENDED_DIRS[1]="cgdb/cgdbrc"
EXTENDED_DIRS[2]="vim/spell"
EXTENDED_DIRS[3]="vim/UltiSnips"
EXTENDED_DIRS[4]="vim/rc"
EXTENDED_DIRS[5]="vim/local_bundle"
EXTENDED_DIRS[6]="vim/tags"
EXTENDED_DIRS[7]="mutt"

for DIR in ${EXTENDED_DIRS[@]}; do
    rm -rf "$HOME/.$DIR"
done

# vim:tw=78:ts=8:sw=4:sts=4:et:fdm=marker
