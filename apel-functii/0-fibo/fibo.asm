%include "../utils/printf32.asm"

%define NUM_FIBO 10

section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    sub esp, NUM_FIBO * 4
    mov ecx, NUM_FIBO
    dec ecx
    mov dword [esp + 4 * ecx], 1
    dec ecx 
    mov dword [esp + 4 * ecx], 1
    while:
        dec ecx
        cmp ecx, dword -1
        je continue
        mov edi, [esp + 4 * (ecx + 1)]
        mov edx, [esp + 4 * (ecx + 2)]
        add edi, edx 
        mov dword [esp + 4 * ecx], edi 
        jmp while
    
    continue:
    mov ecx, NUM_FIBO
print:
    mov eax, dword [esp + (ecx - 1) * 4]
    PRINTF32 `%d \x0`, eax
    dec ecx
    cmp ecx, 0
    ja print

    PRINTF32 `\n\x0`
    mov esp, ebp
    xor eax, eax
    ret
