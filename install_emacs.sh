#!/usr/bin/bash -e

cd
git clone --single-branch -b emacs-28 --depth 1 https://github.com/emacs-mirror/emacs.git
cd emacs
./autogen.sh
./configure --prefix=$HOME/.local --with-native-compilation --with-json --with-xft --with-x-toolkit=gtk3 CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"

make -j24
make install
