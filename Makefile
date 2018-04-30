ROOT=$(shell pwd)
BUILD_DIR=$(ROOT)/build
ASM=$(ROOT)/third_party/nasm/nasm
CC=$(ROOT)/third_party/tcc/bin/i386-tcc
GRUB=$(ROOT)/third_party/grub
OS_NAME=mini

.PHONY: all clean src third_party

all: src

clean:
	rm -rf $(BUILD_DIR)

iso: src verify
	cp -r iso/**/* build
	$(GRUB)/grub-mkrescue -o $(BUILD_DIR)/$(OS_NAME).iso $(BUILD_DIR)

run: src verify
	qemu-system-i386 -kernel $(BUILD_DIR)/boot/kernel.bin

src: clean
	mkdir -p $(BUILD_DIR)/boot
	make -C src ASM=$(ASM) BUILD_DIR=$(BUILD_DIR) CC=$(CC) ROOT=$(ROOT)

third_party:
	make -C third_party

verify: src
	$(GRUB)/grub-file --is-x86-multiboot $(BUILD_DIR)/boot/kernel.bin