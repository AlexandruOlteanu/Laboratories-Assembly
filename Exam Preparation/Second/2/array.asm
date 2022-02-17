%include "utils/printf32.asm"

extern printf

section .data
    num dd 55555123
    my_string db "This is my string", 0
    arr db 1, 5, 111, 98, 37, 4
    arr1 times 100 dw 2 
    byte_array db 11, 0xda, 0xba, 0xba,

;;  TODO d: declare byte_array so that PRINT_HEX shows babadac 

	
section .text
global main

; TODO b: implement array_reverse
array_reverse:
    enter 0, 0

    mov edi, [ebp + 8]

    xor edx, edx 
    mov eax, [ebp + 12]
    mov ebx, 2
    div ebx
    dec eax 

    xor ecx, ecx 
    for:
        cmp ecx, eax 
        je finish_array_reverse
        mov esi, [ebp + 12]
        dec esi
        sub esi, ecx 
        xor edx, edx
        mov dl, [edi + ecx]
        mov dh, [edi + esi]
        mov [edi + ecx], dh 
        mov [edi + esi], dl
        inc ecx 
        jmp for

    
    elev: 
        int age 
        string preferat 
        int x 
        char c 
    my_struct
    vec 


        
    ;     abcd
    ;     dbca



finish_array_reverse:
    leave 
    ret 





; TODO c: implement pow_arraypowArray

; (arr, len, arr1)
pow_array:
    enter 0, 0

    mov edi, [ebp + 8]
    mov ebx, [ebp + 16]

    xor ecx, ecx 
    while2:
        cmp ecx, [ebp + 12]
        je finish_pow_array
        xor edx, edx
        xor eax, eax
        push ebx 
        xor ebx, ebx 
        mov al, byte [edi + ecx]
        mov bl, byte [edi + ecx]
        mul ebx 
        pop ebx  
        mov [ebx + 2 * ecx], eax 
        inc ecx 
        jmp while2


finish_pow_array:
    leave
    ret 

main:
    push ebp
    mov ebp, esp

    ;TODO a: allocate on array of 20 byte elements and initializate it incrementally starting from 'A'
    sub esp, 20
    lea ebx, [ebp - 20]

    xor ecx, ecx
    xor edx, edx
    mov dl, 0x41
    while:
        cmp ecx, 20
        je finish_while
        mov byte [ebx + ecx], dl
        inc dl 
        inc ecx 
        jmp while
    
    finish_while:

    xor ecx, ecx
    while1:
        cmp ecx, 20
        je finish_while1
        PRINTF32`%c\x0`, [ebx + ecx]
        inc ecx 
        jmp while1

finish_while1:
    

    ;TODO b: call array_reverse and print reversed array

    push dword 17
    push my_string
    call array_reverse
    add esp, 8

    PRINTF32`%s\n\x0`, my_string

    ;TODO c: call pow_array and print the result array

    push arr1 
    push dword 6
    push arr
    call pow_array
    add esp, 12
    
    xor ecx, ecx 
    for1:
        cmp ecx, 6
        je finish_for1
        PRINTF32`%hu \x0`, word [arr1 + 2 * ecx]
        inc ecx 
        jmp for1

    finish_for1:



	;;  TODO d: this print of an uint32_t should print babadac 
	PRINTF32 `%x\n\x0`, [byte_array]

    xor eax, eax
    leave
    ret
