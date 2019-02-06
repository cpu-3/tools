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
mkdir -p $BIN/elf2bin-lib
mkdir -p $BIN/_emu

make clean -C simu
make -C simu
make clean -C compiler
make -C compiler
make clean -C emu
make -C emu



cp simu/simu $BIN/simu
cp emu/emu $BIN/emu
mv compiler/min-caml $BIN
cp mcamlc $BIN
cp asm.sh $BIN/asm
cp -r compiler $BIN/compiler
cp -r asm $BIN/asm-lib

cp -r elf2bin $BIN/elf2bin-lib
make build -C $BIN/elf2bin-lib/elf2bin
cp $BIN/elf2bin-lib/elf2bin/main.py $BIN/elf2bin


echo "\n\nInstal succeeded."
echo Please add `pwd`/bin to your PATH
