

.section .data
my_string:
    .asciz "Well it works now! Never conflict registers!\nhI!"

.section .text
.global _kernel_main
_kernel_main:
    ldr x0, =my_string
    b _put
    b .