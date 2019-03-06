set -eu

echo "installing elf2bin..."

git submodule foreach git pull origin master
CUR=`pwd`
BIN=$CUR/bin
mkdir -p $BIN/elf2bin-lib

cp -r elf2bin $BIN/elf2bin-lib
make build -C $BIN/elf2bin-lib/elf2bin
cp $BIN/elf2bin-lib/elf2bin/main.py $BIN/elf2bin

echo "ok"
