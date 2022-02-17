%include "../utils/printf32.asm"

section .data
source_text: db "ABCABCBABCBABCBBBABABBCBABCBAAACCCB", 0
substring: db "BABC", 0

print_format: db "Substring found at index: %d", 10, 0

section .text
extern printf
extern strlen
global main
main:
    push ebp
    mov ebp, esp

    ; TODO: Print the start indices for all occurrences of the substring in source_text

    mov eax, source_text
    push eax 
    call strlen
    add esp, 4
    push eax 
    mov eax, substring
    push eax 
    call strlen
    add esp, 4
    mov esi, eax 
    pop edi

    ; esi = lungimea lui "substring"
    ; edi = lungimea lui "source_text"

    xor ecx, ecx 
    loop:
        cmp ecx, edi 
        je finish
        jmp test
        continue:
            pop ecx 
            cmp ebx, dword 1
            je print 
                continue2:  
                inc ecx              
                jmp loop

print:
    PRINTF32`Substring found at index: %d\n\x0`, ecx 
    jmp continue2

test:
    mov ebx, dword 1
    push ecx
    mov edx, ecx
    xor ecx, ecx
    run:
        cmp ecx, esi 
        je continue 
        xor eax, eax 
        mov al, [source_text + edx]
        cmp al, [substring + ecx]
        jne negate
        inc ecx 
        inc edx 
        jmp run

negate:
    xor ebx, ebx 
    jmp continue



finish:
    leave
    ret
