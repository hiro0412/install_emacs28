#!/usr/bin/env bash

set -ex

cd $(dirname $0)
if [ -d emacs ]
then
    rm -rf emacs
fi

git clone --single-branch -b emacs-28 --depth 1 https://github.com/emacs-mirror/emacs.git

cd emacs

./autogen.sh

if [ $(uname | tr '[A-Z]' '[a-z]') == 'darwin' ];
then
    CFGOPTS_DEPEND_OS="--disable-ns-self-contained"
else
    CFGOPTS_DEPEND_OS="--with-x-toolkit=gtk3"
fi

./configure \
    --prefix=$HOME/.local \
    --with-native-compilation \
    --with-json \
    --with-xft \
    --with-xwidgets \
    $CFGOPTS_DEPEND_OS \
    CFLAGS="-O3 -mtune=native -march=native -fomit-frame-pointer"

make -j24
make install
