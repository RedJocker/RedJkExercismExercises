section .text
global leap_year
leap_year:
    
    mov rax, rdi
    mov rdx, 0
    mov rbx, 400
    div rbx
    cmp rdx, 0
    je .ret_true

    mov rax, rdi
    mov rdx, 0
    mov rbx, 100
    div rbx
    cmp rdx, 0
    je .ret_false

    mov rax, rdi
    mov rdx, 0
    mov rbx, 4
    div rbx
    cmp rdx, 0
    je .ret_true

    .ret_false:
        mov rax, 0
        ret
    .ret_true:
        mov rax, 1
    ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
