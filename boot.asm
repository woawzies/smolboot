[BITS 16]

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ax, 0x9000
    mov ss, ax
    mov sp, 0xffff

    mov bx, 0x0000
    mov ax, 0x1000
    mov es, ax
    mov dh, 0
    mov ch, 0
    mov cl, 2
    mov al, 1
    mov ah, 0x02
    int 0x13

    mov ah, 0x06
    xor al, al
    mov bh, 0x07
    xor ch, ch
    xor cl, cl
    mov dh, 24
    mov dl, 79
    int 0x10

    mov ah, 0x02
    xor bh, bh
    xor dx, dx
    int 0x10

    mov ah, 0x0e
    mov al, 'B'
    int 0x10

    jmp 0x1000:0x0000

boot_end:
    jmp boot_end
    hlt

times 510-($-$$) db 0
dw 0xaa55
