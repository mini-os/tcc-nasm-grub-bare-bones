ROOT=$(shell pwd)
BUILD_DIR=$(ROOT)/build
ASM=$(ROOT)/third_party/nasm/nasm
CC=$(ROOT)/third_party/tcc/bin/i386-tcc

.PHONY: all clean src third_party

all: src

clean:
	rm -rf $(BUILD_DIR)

run: all
	qemu-system-i386 -kernel $(BUILD_DIR)/kernel.bin

src:
	mkdir -p $(BUILD_DIR)
	make -C src ASM=$(ASM) BUILD_DIR=$(BUILD_DIR) CC=$(CC) ROOT=$(ROOT)

third_party:
	make -C third_party

verify: src
	grub-file --is-x86-multiboot $(BUILD_DIR)/kernel.bin