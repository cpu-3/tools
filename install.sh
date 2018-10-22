#!/bin/sh
#git submodule foreach git pull origin master

CUR=`pwd`
mkdir -p bin
BIN=$CUR/bin
mkdir -p $BIN/asm-lib
mkdir -p $BIN/compiler

make -C simu
make -C compiler

mv simu/simu $BIN
mv compiler/min-caml $BIN
cp mcamlc $BIN
cp asm.sh $BIN/asm
cp -r compiler $BIN/compiler
cp -r asm $BIN/asm-lib
