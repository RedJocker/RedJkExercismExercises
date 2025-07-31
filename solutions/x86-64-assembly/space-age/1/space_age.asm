default rel

section .data
    earth_seconds dq 31557600
    planet_earth_years:
        mercury dd 0.2408467
        venus dd 0.61519726
        earth dd 1.0
        mars dd 1.8808158
        jupiter dd 11.862615
        saturn dd 29.447498
        uranus dd 84.016846
        neptune dd 164.79132

section .text
global age
age:
    cvtsi2ss xmm0, rsi
    cvtsi2ss xmm1, [earth_seconds]
    divss xmm0, xmm1
    lea rax, [rel planet_earth_years]
    movss xmm3, [rax + 4*rdi]
    divss xmm0, xmm3
    ret



%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
