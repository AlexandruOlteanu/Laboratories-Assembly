%include "../utils/printf32.asm"

section .text

extern printf
global main
main:
    ; numbers are placed in these two registers
    mov eax, 1
    mov ebx, 4 

    ; TODO: get maximum value. You are only allowed to use one conditional jump and push/pop instructions.

    xor ecx, ecx 
    cmp eax, ebx 
    jl f1
    jmp finish
f1:
    push eax 
    push ebx 
    pop eax 
    pop ebx
  

finish:
    PRINTF32 `Max value is: %d\n\x0`, eax ; print maximum value

    ret
