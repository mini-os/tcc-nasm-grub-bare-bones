.PHONY: all grub nasm tcc

all: grub nasm tcc

grub:
	cd grub && sh autogen.sh
	cd grub && sh configure --disable-werror --prefix=$(ROOT)/third_party/grub
	make -C grub

nasm:
	cd nasm && sh autogen.sh
	cd nasm && sh configure
	make -C nasm

tcc:
	cd tcc && sh configure --prefix=. --enable-cross
	make -C tcc
	make -C tcc install