%include "../utils/printf32.asm"
%define SIZE_VECTOR 10
section .data 
    vector dd 100, 29, 16, 40, 19, 36, 7, 17, 290, 56

section .text 
    extern printf 
    global main

main:
    enter 0, 0

    mov ecx, SIZE_VECTOR
    mov edi, dword 0

    loop:
        cmp ecx, dword 0
        je finish
        xor edx, edx
        mov eax, dword [vector + edi]
        push eax
        mov ebx, 2
        div ebx
        cmp edx, dword 0
        je par 
        jmp impar
        continue:
            add edi, dword 4
            dec ecx 
            jmp loop
par:
    pop eax
    PRINTF32`Numarul %d este par\n\x0`, eax
    jmp continue 

impar:
    pop eax 
    PRINTF32`Numarul %d este impar\n\x0`, eax 
    jmp continue






finish:
    leave 
    ret 