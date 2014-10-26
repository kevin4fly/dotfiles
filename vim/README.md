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
   [git](https://gist.github.com/kevin4fly/f74344649d09f903eb1b)
2. web browser: [chrome](https://www.google.com/intl/en/chrome/browser/)
   - [set chrome as the default browser](http://superuser.com/questions/281488/how-to-set-default-browser-on-ubuntu-from-command-line)
3. ruby environment: [rbenv](https://github.com/sstephenson/rbenv)
4. node.js environment: [nvm](https://github.com/creationix/nvm)
5. python environment: [pyenv](https://github.com/yyuu/pyenv)
6. llvm and clange enviroment:
   [libclang](https://gist.github.com/kevin4fly/e3de744266c98294b21e)
7. Exuberant Ctags: [tag](http://ctags.sourceforge.net/)
   - install ctags via package manager: `sudo apt-get install ctags`


###Building Vim from source

Given so many plugins must use the latest vim version and we can get a better
experiences, we highly recommend to [__install vim from source code__](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).


###Installing dependencies of plugins

It is pretty nice thing to install the plugins which make our job more
productive.

1. vim plugin manager: [neobundle](https://github.com/Shougo/neobundle.vim#quick-start)
2. code complete engine: [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#full-installation-guide)
3. status line: [airline with powerline fancy](http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin)
4. instant show markdown: [vim-instant-markdown](https://github.com/suan/vim-instant-markdown)
5. misc: `trash-cli`, `indent`, `wget`, `curl` and `xclip`

    ```bash
    sudo apt-get install trash-cli indent wget curl xclip
    ``` 

###Runnig&installing plugins
Launch vim and run: `:Unite neobundle/install` to install all plugins via `neobundle`.

###Tunig plugins

There are a couple of plugins needed to be tuned so that they are able to work
better for me.

#####1. tags
   - generate system library tags file for tag related plugins to use.   

    ```bash
    ctags -R --c++-kinds=+p --fields=+iaS --extra=+q /usr/include
    ```

    add the generated tags file to .vimrc file:

    ```vim
    autocmd FileType c,cpp set tags+=/usr/include/tags
    ```

    actually, I run below command to generate tags:

    ```bash
    ctags -I __THROW -I __attribute_malloc__ -I __wur -R --c++-kinds=+p \ 
        --fields=+iaS --extra=+q /usr/include
    ```

    the `-I` stuff is used to generate special tags, such as malloc related.
    if some functions cannot find with ctags, go to the related head file,
    `stdlib.h` as an instance for malloc, and find the malloc function
    prototype, at last, add the stuff after the function as an argument to
    `-I` to include that function.

    plus, adding tags in /lib/modules/$(uname -r)/build/include/linux for
    modules API:

    ```bash
    ctags -R --c++-kinds=+p --fields=+iaS --extra=+q \
        /lib/modules/$(uname -r)/build/include/linux
    ```

     add the generated tags file to .vimrc file also:
        
    ```vim
    autocmd FileType c,cpp,h set tags+=/lib/modules/$(uname -r)/build/include/linux/
    ```

   - change Autotag plugin to make it generate appropriate tags that is suit for
     Code_Complete plugin to use.   

    ```bash
    vim ~/.vim/bundle/vim-autotag/plugin/autotag.py
    ```
    
    comment out the line 25: `#CtagsCmd = "ctags",` and add 
    line `CtagsCmd = "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q",`

    for more details, refer to [ctags details](http://www.cppblog.com/peakflys/archive/2012/12/17/196373.html)

#####2.YouCompleteMe
   - for semantic completion support, we have to copy the generated
       libclang.so to the correct path
       
    ```bash
    cp LLVM_DIR/Release+Asserts/lib/libclang.so ~/ycm_build/
    cd ~/ycm_build
    # generate makefile
    cmake -G "Unix Makefiles" -DEXTERNAL_LIBCLANG_PATH=libclang.so ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
    make ycm_support_libs
    ```
        
   - for different language semantic code complete engine, we need to change the
     flags to reflect this.
        
    ```bash
    vim .vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
    ```

    for c language, change line 55: from `'-std=c++11',` to `'-std=c99',` and
    change line 62: from `'c++',` to `'c',`. or vice visa for C++ language.
