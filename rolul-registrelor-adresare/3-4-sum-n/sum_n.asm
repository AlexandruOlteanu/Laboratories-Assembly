%include "../utils/printf32.asm"

section .data
    num dd 100
    print_format1 db "Sum(", 0
    print_format2 db "): ", 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, [num]     ; Use ecx as counter for computing the sum.
    xor eax, eax       ; Use eax to store the sum. Start from 0.
    push ebp
    xor ebp, ebp 
    
add_to_sum:
    
    mov eax, ecx
    mov ebx, ecx
    xor edx, edx
    mul ebx
    add ebp, eax
   
    dec ecx
    cmp ecx, 0
    jg add_to_sum    ; Decrement ecx. If not zero, add it to sum.


    PRINTF32 `%d\n\x0`, ebp
    pop ebp
    leave
    ret