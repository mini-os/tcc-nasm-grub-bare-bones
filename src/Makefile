DIR=$(ROOT)/src
C_SRCS=$(DIR)/kernel.c

.PHONY: all bootloader kernel link

all: bootloader kernel link

bootloader:
	$(ASM) -felf64 bootloader.asm -o $(BUILD_DIR)/bootloader.o

kernel:
	$(CC) -c $(C_SRCS) -o $(BUILD_DIR)/kernel.o

link:
	#$(CC) -nostdlib -Wl,-Ttext,0x100000 $(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.elf
	$(CC) -nostdlib -Wl,-Ttext,0x100000 -Wl,--oformat,binary -static \
	$(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.bin