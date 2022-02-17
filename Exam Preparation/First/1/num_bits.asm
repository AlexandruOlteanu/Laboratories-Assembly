%include "utils/printf32.asm"


section .data
    arr1 db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x99, 0x88
    len1 equ $-arr1
    arr2 db 0x12, 0x34, 0x56, 0x78, 0x90, 0xab, 0xcd, 0xef
    len2 equ $-arr2
    val1 dd 0xabcdef01
    val2 dd 0x62719012


section .text
extern printf
global main


main:
    push ebp
    mov ebp, esp

    mov eax, dword [val2]
    shr eax, 31

    ; TODO a: Print if sign bit is present or not.
    cmp eax, 0x1
    je print_signed
    jmp print_no_sign

print_signed:
    PRINTF32`sign bit\n\x0`,
    jmp continue

print_no_sign:
    PRINTF32`no sign bit\n\x0`,
    jmp continue

        ; TODO b: Prin number of bits for integer value.

continue:
    mov eax, dword [val2]
    xor ecx, ecx 
    while:
        cmp eax, 0x0
        je continue2 
        xor ebx, ebx 
        mov ebx, 1
        and ebx, eax
        cmp ebx, 1
        je add 
        after:
            shr eax, 1
            jmp while

add:
    inc ecx 
    jmp after
continue2:
    PRINTF32`%d\n\x0`, ecx
    xor ecx, ecx
    xor edi, edi 
    loop:
        cmp ecx, len1
        je finish
        xor ebx, ebx  
        mov bl, byte [arr2 + ecx]
        xor eax, eax

        while1:
            cmp bl, 0x0
            je finish_while
            mov al, byte 1
            and al, bl
            cmp al, byte 1
            je add1
                after1:
                shr bl, 1
                jmp while1
        finish_while:
            inc ecx 
            jmp loop

add1:
    inc edi 
    jmp after1
    

    ; TODO c: Prin number of bits for array.


finish:
    xor eax, eax
    PRINTF32`%d\n\x0`, edi
    leave
    ret
