DIR=$(ROOT)/src
C_SRCS=$(DIR)/kernel.c

.PHONY: all bootloader kernel link

all: bootloader kernel link

bootloader:
	$(ASM) -felf32 bootloader.asm -o $(BUILD_DIR)/bootloader.o

kernel:
	$(CC) \
	-c $(C_SRCS) -o $(BUILD_DIR)/kernel.o \
	-I $(ROOT)/third_party/tcc/include 

link:
	$(CC) -nostdlib -Wl,-Ttext,0x100000 \
	$(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.bin
	#$(CC) -nostdlib -Wl,-Ttext,0x100000 -Wl,--oformat,binary -static \
	#$(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.bin