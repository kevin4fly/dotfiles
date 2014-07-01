#dotvimrc

This vimrc file utilizes many plugins which again depend on many additional
software, thus we have to install a bunch of software to make these plugins
work well as we expected. Following below steps to accomplish the vim
environment:

*note: I use the __Ubuntu 14.04__ Linux Distribution, therefor
I am able to easy install sofeware via Package Management System such as
`apt-get install` as apposed to install software by compiling from the source
code.*

###Installing prerequisites

The vim plugins also need the additional software to make them work normally
such as: git, ruby, python support and so on. And now, let's install them:

1. software version control:
   [git](https://github.com/kevin4fly/dotvimrc/wiki/Building-git-from-source)
2. web browser: [chrome](https://www.google.com/intl/en/chrome/browser/)
   - [set chrome as the default browser](http://superuser.com/questions/281488/how-to-set-default-browser-on-ubuntu-from-command-line)
3. ruby environment: [rbenv](https://github.com/sstephenson/rbenv)
4. node.js environment: [nvm](https://github.com/creationix/nvm)
5. python environment: [pyenv](https://github.com/yyuu/pyenv)
6. llvm and clange enviroment:
   [libclang](https://github.com/kevin4fly/dotvimrc/wiki/Building-llvm-and-clang-from-source)
7. Exuberant Ctags: [tag](http://ctags.sourceforge.net/)
   - install ctags via package manager: `sudo apt-get install ctags`


###Building Vim from source

Given so many plugins must use the latest vim version and we can get a better
experiences, we highly recommend to [__install vim from source code__](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).


###Installing dependencies of plugins

It is pretty nice thing to install the plugins which make our job more
productive.

1. vim plugin manager: [Vundle](https://github.com/gmarik/Vundle.vim)
2. code complete engine: [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#full-installation-guide)
3. code snippet completeion:
   - copy my own customized snippet to/replace
     ~/.vim/bundle/vim-snippets/UltiSnips/
4. status line: [airline with powerline fancy](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
5. instant show markdown: [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)

###Runnig&installing plugins
Launch vim and run: `:PluginInstall` to install all plugins via vundle.

###Tunig plugins
[Tuning some plugins](https://github.com/kevin4fly/dotvimrc/wiki/Tuning-plugins) to suit for my flavor.
