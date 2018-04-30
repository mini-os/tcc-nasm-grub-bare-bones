ROOT=$(shell pwd)
BUILD_DIR=$(ROOT)/build
ASM=$(ROOT)/third_party/nasm/nasm
CC=$(ROOT)/third_party/tcc/bin/tcc

.PHONY: all clean src third_party

all: src

clean:
	rm -rf $(BUILD_DIR)

src:
	mkdir -p $(BUILD_DIR)
	make -C src ASM=$(ASM) BUILD_DIR=$(BUILD_DIR) CC=$(CC) ROOT=$(ROOT)

third_party:
	make -C third_party