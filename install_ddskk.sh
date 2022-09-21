#!/usr/bin/bash -e


cd $(dirname $0)

git clone https://github.com/skk-dev/ddskk.git

cd ddskk

make get
make install EMACS=$HOME/.local/bin/emacs