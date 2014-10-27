#http://stackoverflow.com/questions/5626188/ctags-ignore-lists-for-libc6-libstdc-and-boost

# First make sure apt-file is install and then do:
sudo apt-file update

# set up tags for libc, the standard C library
# sudo apt-get install libc6-dev
sudo apt-file list libc6-dev | \
    grep -o '/usr/include/.*\.h'> ~/.vim/tags/libc6-filelist
sudo ctags --sort=foldcase --c++-kinds=+p --fields=+iaS --extra=+q \
    -I./libc6-ignore -f ~/.vim/tags/libc6 -L ~/.vim/tags/libc6-filelist

# create tags for stdlibc++ and STL
# sudo apt-get install libstdc++6-4.7-dev
sudo apt-file list libstdc++6-4.7-dev | \
    grep -E -o '/usr/include/.*\.(h|hpp)' > ~/.vim/tags/stdlibcpp-filelist
sudo ctags --sort=foldcase -R --c++-kinds=+p --fields=+iaS --extra=+q \
    -f ~/.vim/tags/stdlibcpp6-4.7-dev -L ~/.vim/tags/stdlibcpp-filelist

# For Boost
# sudo apt-get install libboost-all-dev
sudo apt-file list boost | \
    grep -E -o '/usr/include/.*\.(h|hpp)' | \
    grep -v '/usr/include/boost/typeof/' > ~/.vim/tags/boost-filelist
sudo ctags --sort=foldcase --c++-kinds=+p --fields=+iaS --extra=+q \
    -f ~/.vim/tags/boost -L ~/.vim/tags/boost-filelist

# create tags for linux
# sudo apt-get install linux-headers-3.13.0-24-generic
sudo apt-file list linux-headers-3.13.0-24-generic | \
    grep -E -o '/usr/src/linux-headers-3.13.0-24-generic/.*\.(h|hpp)' > \
    ~/.vim/tags/linux-filelist
sudo ctags --sort=foldcase -R --c++-kinds=+p --fields=+iaS --extra=+q \
    -f ~/.vim/tags/linux3.13 -L ~/.vim/tags/linux-filelist

