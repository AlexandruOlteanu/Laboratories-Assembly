extern strlen
extern printf


section .rodata
    test_str db "hell, it's about time", 0
    format db "length = %d", 10, 0

section .text
global main


func_len:
    enter 0, 0

    xor eax, eax 
    mov edx, [ebp + 8]
    cmp [edx], byte 0x0
    je finish_func
    inc eax 
    push eax
    add edx, 1

    push edx 
    call func_len
    add esp, 4
    
    pop edi
    
    add eax, edi

finish_func:
    leave
    ret

main:
    push ebp
    mov ebp, esp



    push test_str
    call strlen
    add esp, 4
    
    

    push eax
    push format
    call printf
    add esp, 8


    ; TODO a: Implement strlen-like functionality using a RECURSIVE implementation.

    push test_str
    call func_len
    add esp, 8

    push eax
    push format
    call printf
    add esp, 8

    ; Return 0.
    xor eax, eax
    leave
    ret
