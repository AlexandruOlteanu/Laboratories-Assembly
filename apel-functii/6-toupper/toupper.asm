%include "../utils/printf32.asm"
section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghij", 0
    string db "Aici %s", 10, 0, 0

section .text
extern printf
extern strlen
global main

toupper:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    push eax
    push eax 
    call strlen 
    add esp, 4
    mov ecx, eax
    pop eax 

    xor edx, edx
    while:
        cmp edx, ecx
        je continue
        xor ebx, ebx
        mov bl, byte [eax + edx]
        sub bl, 0x20
        mov [eax + edx], bl
        ;PRINTF32`%c\n\x0`, ebx
        inc edx
        jmp while

    continue:
    ;PRINTF32`%d\n\x0`, eax
    

    leave
    ret

main:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
