default rel 

section .data
black: db 0,"black",0
brown: db 1,"brown",0
red: db 2,"red",0
orange: db 3,"orange",0
yellow: db 4,"yellow",0
green: db 5,"green",0
blue: db 6,"blue",0
violet: db 7,"violet",0
grey: db 8,"grey",0
white: db 9,"white",0

color_array: dq black+1, brown+1, red+1, orange+1, yellow+1, green+1, blue+1, violet+1, grey+1, white+1,0
color_array_length: equ $ - color_array

section .text
global color_code                         ;                  rdi     rax
color_code:                               ; colorCode :: *String -> Int
    xor r9, r9                            ; colorCode = 
    xor rcx, rcx
    lea r10, [color_array]                
                                          ; let
    .forArray:                            ;     maybeMatch = safeHead $ filter ((==) *rdi) color_array    
        mov r8, qword[r10 + r9*8]         
        
        .forString:
            xor rax, rax
            xor r11, r11
            mov r8, qword[r10 + r9*8]
            mov al, byte[rdi + rcx]
            mov r11b, byte[r8 + rcx]
            
            cmp r11b, al
            jne .nextString
        
            inc rcx
            cmp r11b, 0
            je .returnResistorNumber
            jne .forString

        .nextString:
            xor rcx, rcx
            inc r9
            cmp r9, color_array_length
            jne .forArray
            ;;je .returnNotFound
                                          ; in
    .returnNotFound:                      ;     fromMaybe (-1) $ fmap getResistorNumber maybeMatch
        mov rax, -1
        ret
    .returnResistorNumber:
        xor rax, rax
        mov al, byte[r8 - 1]
        ret

global colors
colors:
    lea rax, [color_array]
    ret
