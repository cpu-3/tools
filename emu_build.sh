set -eu

echo -n "installing emu..."

git submodule foreach git pull origin master
CUR=`pwd`
BIN=$CUR/bin
mkdir -p $BIN
mkdir -p $BIN/_emu
make -C emu
cp emu/emu $BIN/emu

echo "ok"
