section .text
global distance
distance:
    xor rax, rax
    xor rdx, rdx
    xor rcx, rcx
    xor rbx, rbx
    mov r8, -1
    .loop:
        inc r8
        mov bl, [rdi + r8]
        mov cl, [rsi + r8]
        cmp bl, 0
        je .end_str1
        cmp cl, 0
        je .end_only_one_str
        cmp bl, cl
        je .loop
        inc rdx
        jmp .loop
    .end_str1:
        cmp cl, 0
        je  .return
        jmp .end_only_one_str
    .end_only_one_str:
        mov rax, -1
        ret
    .return:
        mov rax, rdx
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
