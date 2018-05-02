C_OPTS=-c -nostdlib -I $(ROOT)/third_party/tcc/include
INCLUDE=include/$(ARCH)

.PHONY: all bootloader kernel link libc

all: bootloader libc kernel link

bootloader:
	$(ASM) -felf32 bootloader.asm -o $(BUILD_DIR)/bootloader.o

libc:
	$(CC) $(C_OPTS) $(INCLUDE)/vga/vga.c -o $(BUILD_DIR)/vga.o	
	$(CC) $(C_OPTS) $(INCLUDE)/stdio.c -o $(BUILD_DIR)/stdio.o	
	$(CC) $(C_OPTS) $(INCLUDE)/stdlib.c -o $(BUILD_DIR)/stdlib.o
	$(CC) $(C_OPTS) $(INCLUDE)/string.c -o $(BUILD_DIR)/string.o

kernel: libc
	$(CC) $(C_OPTS) kernel.c -o $(BUILD_DIR)/kernel.o \
	-I $(INCLUDE)

link: kernel
	$(CC) -nostdlib -Wl,-Ttext,0x100000 \
	$(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o \
	$(BUILD_DIR)/stdio.o $(BUILD_DIR)/stdlib.o \
	$(BUILD_DIR)/string.o $(BUILD_DIR)/vga.o \
	-o $(BUILD_DIR)/kernel.bin -m elf_i386
	#$(CC) -nostdlib -Wl,-Ttext,0x100000 -Wl,--oformat,binary -static \
	#$(BUILD_DIR)/bootloader.o $(BUILD_DIR)/kernel.o -o $(BUILD_DIR)/kernel.bin