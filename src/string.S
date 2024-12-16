.global _putchar
.global _put



_putchar:
    ldr x4, =0x09000000
    str w2, [x4]
    ret


_put:
    cbz x0, _put_done         
continput:
    ldrb w1, [x0], #1          
    cbz w1, _put_done        
    mov w2, w1            
    bl _putchar             
    b continput                 
_put_done:
    ret
