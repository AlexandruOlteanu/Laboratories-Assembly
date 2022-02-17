%include "utils/printf32.asm"

section .data
    num dd 3453235129

section .text
extern printf
global main

main:
    push ebp
    mov ebp, esp

    mov eax, dword [num]
    shr eax, 16
    mov ebx, 3
    and eax, ebx
    mov ebx, 2
    and ebx, eax
    cmp ebx, 0
    jg print1
    jmp print0
    continue:
        mov ebx, 1
        and ebx, eax 
        cmp ebx, 1
        je print11
        jmp print01

print1:
    PRINTF32`1\x0`,
    jmp continue

print0:
    PRINTF32`0\x0`,
    jmp continue

print11:
    PRINTF32`1\n\x0`,
    jmp continue2
print01:
    PRINTF32`0\n\x0`,
    jmp continue2


    ;TODO a: print least significant 2 bits of the second most significant byte of num

continue2:

    xor ecx, ecx 
    mov eax, dword [num] 
    while:
        cmp eax, 0x0
        je finish_while
        mov ebx, 1
        and ebx, eax 
        cmp ebx, 1
        je add
        after_add:
            shr eax, 2
            jmp while

add:
    inc ecx 
    jmp after_add

finish_while:
    PRINTF32`%d\n\x0`, ecx


continue3:

    xor ecx, ecx 
    mov eax, dword [num]

    while1:
        cmp eax, 0x0
        je finish_while1
        mov ebx, 7
        and ebx, eax 
        cmp ebx, 7
        je add1
        after_add1:
            shr eax, 1
            jmp while1

add1:
    inc ecx 
    jmp after_add1

finish_while1:
    PRINTF32`%d\n\x0`, ecx 

    ;TODO b: print number of bits set on odd positions

    ;TODO c: print number of groups of 3 consecutive bits set


    xor eax, eax
    leave
    ret
