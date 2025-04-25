BITS 32
SECTION .data 
       ; added an extra character to put a newline into when printing

title db 'The String Program', 0xa 
len equ $ - title

prompt db 'Please enter a 2 character string:', 0xa 
leng equ $ - prompt

answer db 'The answer is:', 0xa 
lengt equ $ - answer

 bufferSize equ 3  
 
SECTION .bss 
    num1 RESB 2 
    num2 RESB 2 
    remainder RESB 5
    quotient RESB 5
    two_char_string: resb 3 
SECTION .text
GLOBAL _start	
_start:	

;PRINT TIMER
   mov edx,len 
   mov ecx,title
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
   ;PROMPT 1 
   mov edx,leng
   mov ecx,prompt
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
    ; sys_read - read input from stdin (file descriptor 0)
    mov eax, 3          ; sys_read system call number
    mov ebx, 0          ; file descriptor 0 (stdin)
    mov ecx, two_char_string     ; pointer to buffer
    mov edx, bufferSize ; number of bytes to read
    int 0x80            ; call the kernel
;4.	Write a program called p4.asm that prompts the user for a two character string.  Once the string is entered, swap the characters in the string and then print the result.  You must swap the characters in the string (in other words, swap the bytes that are stored in memory) and then print the modified string to get credit for this program.   Allocate the memory for the string in a single directive in the .bss section, such as:
   
    mov al, [two_char_string]          ; Load first character into AL
    mov bl, [two_char_string + 1]
    
     mov [two_char_string], bl         
    mov [two_char_string + 1], al 
   
   
  

   mov	edx, lengt       ;message length
   mov	ecx,answer     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80

 mov	edx,  bufferSize      ;message length
   mov	ecx,two_char_string     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int 0x80
;remainder
 mov al,02h     ;
    
    
;end program 
mov	eax,1       ;system call number (sys_exit)
xor ebx,ebx
int	0x80        ;call kernel