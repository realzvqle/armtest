.global _start


_start:
    ldr x30, =stacktop
    mov sp, x30
    bl _kernel_main
    b .