set -eu

git submodule update --init --recursive
git submodule foreach git pull origin master

echo -n "installing emu..."

CUR=`pwd`
BIN=$CUR/bin
mkdir -p $BIN
mkdir -p $BIN/_emu
make -C emu
cp emu/emu $BIN/emu

echo "ok"
