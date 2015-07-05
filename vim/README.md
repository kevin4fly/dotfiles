#dotvimrc

This vimrc file utilizes many plugins which again depend on many additional
software, thus we have to install a bunch of software to make these plugins
work well as we expected. Following below steps to accomplish the vim
environment:

*__Note__: I am using the __Ubuntu 14.04__ Linux Distribution, therefor
I am able to easily install sofeware via Package Management System such as
`apt-get install` as apposed to install software by compiling from the source
code.*

###Installing prerequisites

The vim plugins also need the additional software to make them work normally
such as: git, ruby, python support and so on. And now, let's install them:

1. software version control: [git]
2. web browser: [chrome]
3. ruby environment: [rbenv]
4. node.js environment: [nvm]
5. python environment: [pyenv]
6. llvm and clange enviroment:
   [libclang]
7. Exuberant Ctags: [tag]
   - install ctags via package manager: `sudo apt-get install ctags`


###Building Vim from source

Given so many plugins must use the latest vim version and we can get a better
experiences, we highly recommend to [__install vim from source code__]


###Installing dependencies of plugins

It is pretty nice thing to install the plugins which make our job more
productive.

1. vim plugin manager: [neobundle]

    ```bash
    mkdir -p ~/.vim/bundle
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle
    ```
2. code complete engine: [YouCompleteMe]
3. status line: [airline with powerline fancy]
4. instant show markdown: [vim-instant-markdown]

###Runnig&installing plugins
Launch vim and run: `:Unite neobundle/install` to install all plugins via
`neobundle`.

###Tunig plugins

There are a couple of plugins needed to be tuned so that they are able to work
better for me.

#####1.YouCompleteMe
   - for semantic completion support, we have to copy the generated
       libclang.so to the correct path

    ```bash
    mkdir ~/Downloads/ycm_build
    cd ~/Downloads/ycm_build
    cp LLVM_DIR/Release+Asserts/lib/libclang.so .
    # generate makefile
    cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=libclang.so \
        ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs
    ```

   - for different language semantic code complete engine,
     we need to change the flags to reflect this.

    ```bash
    vim ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
    ```

    for c language, change line 55: from `'-std=c++11',` to `'-std=c99',` and
    change line 62: from `'c++',` to `'c',`. or vice visa for C++ language.

[git]: https://gist.github.com/kevin4fly/f74344649d09f903eb1b
[chrome]: https://gist.github.com/kevin4fly/fd9c971278de368ac47b#google-chrome-browser
[rbenv]: https://github.com/sstephenson/rbenv
[nvm]: https://github.com/creationix/nvm
[pyenv]: https://github.com/yyuu/pyenv
[libclang]: https://gist.github.com/kevin4fly/e3de744266c98294b21e
[tag]: http://ctags.sourceforge.net/
[__install vim from source code__]: https://gist.github.com/kevin4fly/f74344649d09f903eb1b
[neobundle]: https://github.com/Shougo/neobundle.vim#quick-start
[YouCompleteMe]: https://github.com/Valloric/YouCompleteMe#full-installation-guide
[airline with powerline fancy]: https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
[vim-instant-markdown]: https://github.com/suan/vim-instant-markdown
