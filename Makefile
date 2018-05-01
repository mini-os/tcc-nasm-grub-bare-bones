ROOT=$(shell pwd)
BUILD_DIR=$(ROOT)/build
ASM=$(ROOT)/third_party/nasm/nasm
CC=$(ROOT)/third_party/tcc/i386-tcc
GRUB=$(ROOT)/third_party/grub
OS_NAME=mini
TARGET=i386-elf

.PHONY: all clean src third_party

all: src

clean:
	rm -rf $(BUILD_DIR)

iso: src verify
	mkdir -p build/iso/boot/grub
	mv $(BUILD_DIR)/kernel.bin $(BUILD_DIR)/iso/boot/kernel.bin
	cp -r iso/boot/grub/grub.cfg build/iso/boot/grub/grub.cfg
	$(GRUB)/grub-mkrescue -o $(BUILD_DIR)/$(OS_NAME).iso $(BUILD_DIR)/iso

run: src verify
	qemu-system-i386 -kernel $(BUILD_DIR)/kernel.bin

src: clean
	mkdir -p $(BUILD_DIR)/boot
	$(MAKE) -C src ASM=$(ASM) BUILD_DIR=$(BUILD_DIR) CC=$(CC) ROOT=$(ROOT)

third_party:
	$(MAKE) -C third_party ROOT=$(ROOT) TARGET=$(TARGET)

verify: src
	$(GRUB)/grub-file --is-x86-multiboot $(BUILD_DIR)/kernel.bin