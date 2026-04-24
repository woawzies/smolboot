[BITS 16]

jmp kernel

counter dw 0

kernel:
    mov ah, 0x06
    mov al, 0x00
    mov bh, 0x07
    xor cx, cx
    mov dx, 0x184f
    int 0x10
    mov ah, 0x02
    mov bh, 0x00
    mov dh, bh
    mov dl, bh
    int 0x10

    mov ax, word [counter]
    inc ax
    mov word [counter], ax
    call print_bin

    call sleep
    jmp kernel

print_bin:
    mov cx, ax
    mov dx, 16
    print_bin_loop:
        mov ax, cx
        and ax, 1
        add al, '0'

        mov ah, 0x0e
        int 0x10

        shr cx, 1
        dec dx
        jnz print_bin_loop
    ret

sleep:
    mov ah, 0x86
    mov cx, 0x0000
    mov dx, 0x1000
    int 0x15
    ret
