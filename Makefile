elf2bin_build:
	./elf2bin_build.sh

emu_build:
	./emu_build.sh

build: elf2bin emu
	./build.sh
