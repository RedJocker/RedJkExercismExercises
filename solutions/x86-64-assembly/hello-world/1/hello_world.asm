;; to work had to change make to: ALL_ASFLAGS = -f macho64 
;; hope it's ok

default rel

section .rodata

msg: db "Hello, World!", 0


section .text

global _hello

_hello:
    lea rax, [msg]
    ret
