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

align 8
color_array: dq black+1, brown+1, red+1, orange+1, yellow+1, green+1, blue+1, violet+1, grey+1, white+1,0
color_array_length: equ $ - color_array

align 8
default rel
	
section .text
global value
value:
	mov rbx, 0
	xor r15, r15
	.color_code:
		lea r10, [color_array]                 
    	xor r9, r9                             
    	.for_array:                            
    		mov r8, qword[r10 + r9*8]         

    		xor rcx, rcx                      
    		.string_equal:
    			mov al, byte[rdi + rcx]       
    			mov r11b, byte[r8 + rcx]
         
    			cmp r11b, al
    			jne .next_string
        
    			inc rcx
    			cmp r11b, 0
    			je .resistor_number
    			jne .string_equal

    		.next_string:
    			inc r9
    			cmp r9, color_array_length
    			jne .for_array
                                          
    .resistor_number:
		mov cl, byte[r8 - 1]
		add r15, rcx 
		cmp rbx, 0
		jnz .return
	    imul r15, 10
		xchg rdi, rsi
		inc rbx
		jmp .color_code
	.return:
		mov rax, r15
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
