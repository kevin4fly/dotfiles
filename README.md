dotfiles
========

my config dotfiles

###Installing
1. `git clone https://github.com/kevin4fly/dotfiles`
2. `cd dotfiles && ./install.sh`
3. `git pull && git submodule update --init --recursive`
4. read file in `vim/README.md` for vim settings
5. read file in `mutt/README.md` for mutt settings

###Uninstalling
The uninstalling only removes the config files which are symbolic links
located in the $HOME directory
`cd dotfiles && ./uninstall.sh`
