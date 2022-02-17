%include "../utils/printf32.asm"

section .text
extern printf
global main
main:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX

    loop:
        cmp ebx, eax 
        jg finish
        mov edx, ebx 
        and edx, eax 
        cmp edx, dword 0
        je continue
        PRINTF32`%d\n\x0`, ebx 
        continue:
            add ebx, ebx 
            jmp loop
finish:
    leave
    ret