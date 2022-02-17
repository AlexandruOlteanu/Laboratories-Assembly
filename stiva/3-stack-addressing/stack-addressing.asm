%include "../utils/printf32.asm"

%define NUM 5
   
section .text

extern printf
global main
main:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands (use direct addressing of memory. Hint: esp)
    mov ecx, NUM
push_nums:
    sub esp, 4
    mov [esp], ecx 
    loop push_nums

    sub esp, 4
    mov dword [esp], dword 0
    sub esp, 4
    mov dword [esp], "mere"
    sub esp, 4
    mov dword [esp],  "are "
    sub esp, 4
    mov dword [esp], "Ana "

    mov eax, ebp
    print_stack:
    PRINTF32 `0x\x0`
    PRINTF32 `%x\x0`, eax
    PRINTF32 `: 0x\x0`
    PRINTF32 `%x\n\x0`, [eax]

    sub eax, 4
    cmp eax, esp
    jge print_stack


    lea esi, [esp]
    PRINTF32 `%s\n\x0`, esi
    add esp, 16
    PRINTF32 `%x\n\x0`, [esp]

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; use PRINTF32 macro - see format above

    ; TODO 3: print the string

    ; TODO 4: print the array on the stack, element by element.

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
