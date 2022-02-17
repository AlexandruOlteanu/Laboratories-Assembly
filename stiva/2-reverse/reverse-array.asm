%include "../utils/printf32.asm"

%define ARRAY_LEN 7

section .data

input dd 122, 184, 199, 242, 263, 845, 911
output times ARRAY_LEN dd 0

section .text

extern printf
global main
main:

    ; TODO push the elements of the array on the stack
    ; TODO retrieve the elements (pop) from the stack into the output array

    xor ecx, ecx
    while:
        cmp ecx, ARRAY_LEN
        je continue
        push dword [input + 4 * ecx]
        inc ecx 
        jmp while
    continue:

    xor ecx, ecx
    while1:
        cmp ecx, ARRAY_LEN
        je continue1
        pop dword [output + 4 * ecx]
        inc ecx 
        jmp while1
    continue1:

    PRINTF32 `Reversed array: \n\x0`
    xor ecx, ecx
print_array:
    mov edx, [output + 4 * ecx]
    PRINTF32 `%d\n\x0`, edx
    inc ecx
    cmp ecx, ARRAY_LEN
    jb print_array

    xor eax, eax
    ret
