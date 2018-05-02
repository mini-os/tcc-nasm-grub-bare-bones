ROOT=$(shell pwd)
BUILD_DIR=$(ROOT)/build
ARCH=i386
TARGET=$(ARCH)-elf
CROSS=$(ROOT)/third_party/cross
CC=$(CROSS)/bin/$(ARCH)-tcc
ASM=$(CROSS)/bin/nasm
GRUB=$(ROOT)/third_party/grub
OS_NAME=rpk
NAME=$(OS_NAME)
VERSION=0.0.0-ultra-mega-dev

.PHONY: all clean src third_party

all: src

clean:
	rm -rf $(BUILD_DIR)
	$(MAKE) -C third_party clean

iso: src verify
	mkdir -p build/iso/boot/grub
	mv $(BUILD_DIR)/kernel.bin $(BUILD_DIR)/iso/boot/kernel.bin
	cp -r iso/boot/grub/grub.cfg build/iso/boot/grub/grub.cfg
	find $(BUILD_DIR)/iso -type f
	$(CROSS)/bin/grub-mkrescue -o $(BUILD_DIR)/$(OS_NAME).iso \
	--product-name=$(NAME) --product-version=$(VERSION) -v \
	$(BUILD_DIR)/iso

run: src verify
	qemu-system-$(ARCH) -kernel $(BUILD_DIR)/kernel.bin

run-iso: src verify iso
	qemu-system-$(ARCH) -boot d -cdrom $(BUILD_DIR)/$(OS_NAME).iso

src: clean
	mkdir -p $(BUILD_DIR)/boot
	$(MAKE) -C src ARCH=$(ARCH) ASM=$(ASM) BUILD_DIR=$(BUILD_DIR) CC=$(CC) ROOT=$(ROOT)

third_party:
	$(MAKE) -C third_party ROOT=$(ROOT) TARGET=$(TARGET) PREFIX=$(CROSS)

verify: src
	$(CROSS)/bin/grub-file --is-x86-multiboot $(BUILD_DIR)/kernel.bin