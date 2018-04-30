.PHONY: all nasm tcc

all: nasm tcc

nasm:
	cd nasm && sh autogen.sh
	cd nasm && sh configure
	make -C nasm

tcc:
	cd tcc && sh configure --prefix=. --enable-cross
	make -C tcc
	make -C tcc install