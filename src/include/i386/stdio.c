#include "stdio.h"

const int EOF = -1;

#ifdef __i386__
#include "vga/vga.h"

int puts(const char* str) {
    terminal_initialize();
    terminal_writestring(str);
    terminal_putchar('\n');
    return 0;
}

#endif