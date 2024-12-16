ENTRY(_start)
SECTIONS {
    . = 0x40100000; 
    .startup . : { src/boot.o(.text) }
    .text : { *(.text) }
    .data : { *(.data) }
    .bss : { *(.bss COMMON) }
    . = ALIGN(4);
    . += 0x1000; 
    stacktop = .;
}