#!/bin/sh
set -eu

git submodule update --init --recursive
git submodule foreach git pull origin master

CUR=`pwd`
BIN=$CUR/bin
mkdir -p $BIN
mkdir -p $BIN/asm-lib
mkdir -p $BIN/compiler
mkdir -p $BIN/_simu

make -C simu
make clean -C compiler
make -C compiler



cp simu/simu $BIN/simu
mv compiler/min-caml $BIN
cp mcamlc $BIN
cp asm.sh $BIN/asm
cp -r compiler $BIN/compiler
cp -r asm $BIN/asm-lib

echo "\n\nInstal succeeded."
echo Please add `pwd`/bin to your PATH
