%include "../utils/printf32.asm"

%define ARRAY_SIZE    10

section .data
    byte_array db 8, 19, 12, 3, 6, 200, 128, 19, 78, 102
    word_array dw 1893, 9773, 892, 891, 3921, 8929, 7299, 720, 2590, 28891
    dword_array dd 1392849, 12544, 879923, 8799279, 7202277, 971872, 28789292, 17897892, 12988, 8799201
    print_format db "Array sum is ", 0

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov ecx, ARRAY_SIZE     ; Use ecx as loop counter.
    xor eax, eax            ; Use eax to store the sum.
    xor edx, edx            ; Store current value in dl; zero entire edx.
    mov edi, 0

    xor esi, esi

add_byte_array_element:
    mov edx, dword [dword_array + edi]
    mov eax, edx 
    mov ebx, edx
    xor edx, edx  
    mul ebx 
    PRINTF32`EAX : %p\n\x0`, eax 
    PRINTF32`EDX : %p\n\x0`, edx
    add esi, eax
    add edi, dword 4
    loop add_byte_array_element ; Decrement ecx, if not zero, add another element.

    PRINTF32 `%s\x0`, print_format
    PRINTF32 `%u\n\x0`, esi


    ; TODO: Compute sum for elements in word_array and dword_array.

    leave
    ret
