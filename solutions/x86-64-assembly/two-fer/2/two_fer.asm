
default rel   ;; avoids this error somehow "error: Mach-O 64-bit format does not support 32-bit absolute addresses"

section .data
oneFor: db "One for "
oneForLen: equ $ - oneFor

you: db "you"
youLen: equ $ - you

forMe: db ", one for me.", 0
forMeLen: equ $ - forMe

section .text
global two_fer

;; rdi - arg0 = *name
;; rsi - arg1 = *strBuffer 

two_fer:
    lea r10, [rdi]       ;; r10 = *name
    lea r11, [rsi]       ;; r11 = *strBuffer
    

    xchg rdi, rsi         
    lea rsi, [oneFor]      
    mov rcx, oneForLen
    rep movsb            ;; *strBuffer << oneFor

    test r10, r10
    je .forYou              ;; if(*name == null) forYou, else findSizeName

    mov rcx, -1
    .findSizeName:
        inc rcx
        cmp byte[r10 + rcx], 0
        jnz .findSizeName
    mov r9, rcx          ;;  r9 = sizeName

    ;.forName:
        lea rdi, [r11 + oneForLen]         
        lea rsi, [r10]      
        ;;mov rcx, rcx
        rep movsb            ;; *strBuffer << name
    jmp .forMe
    


    .forYou:
        lea rdi, [r11 + oneForLen]
        lea rsi, [you]
        mov rcx, youLen
        rep movsb
    mov r9, youLen       ;;   r9 = either sizeName youLen  


    .forMe:
        lea rdi, [r11 + oneForLen + r9]         
        lea rsi, [forMe]      
        mov rcx, forMeLen
        rep movsb            ;; *strBuffer << forMe
    
    
    
    lea rax, [rdi]
    ret 
