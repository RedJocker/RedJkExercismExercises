section .text
global square_root
square_root:
    mov rbx, 1
    .guess:
        mov rax, rbx
        mul rbx
        cmp rdi, rax
        je .return
    inc rbx
    jmp .guess
    .return:
        mov rax, rbx
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
