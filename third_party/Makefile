.PHONY: all grub nasm tcc

all: nasm tcc grub

grub:
	cd grub && sh autogen.sh
	cd grub && sh configure --disable-werror --prefix=$(ROOT)/third_party/grub
	$(MAKE) -C grub

nasm:
	cd nasm && sh autogen.sh
	cd nasm && sh configure
	$(MAKE) -C nasm

tcc:
	cd tcc && sh configure --prefix=. --enable-cross
	$(MAKE) -C tcc
	$(MAKE) -C tcc install