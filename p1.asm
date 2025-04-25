;propt for num
;read in 
;prompt for num
;read in
;convert both num to num, sub 48 
;add them, save sum
;convert sum to num to string, add 48   
;print 'Answer is:'
;print sum
BITS 32
SECTION .bss 
    num1 RESB 5 ;num1 
    num2 RESB 5 ;num2
    sum RESB 5
     
section	.text
   global _start     ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
  
;title print   
   mov edx,leng ;;  title length 
   mov ecx,title ; title 
   
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
;FIRST NUM PROMPT n
   mov edx,length ;prompt length
   mov ecx,prompt;

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
   
;read in first num
    mov eax,3 ; read
    mov ebx, 0
    mov ecx,num1
    mov edx, 5 
    int 80h 

;SECOND PROMPT
   mov edx,length ;prompt length
   mov ecx,prompt;

   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
 
;read in 2nd num
    mov eax,3 ; read
    mov ebx, 0
    mov ecx,num2
    mov edx, 5 
    int 80h

 ; Convert num1 from string to integer
    mov al, [num1]       ; Load first character into AL
    sub al, '0'          ; Convert from ASCII to integer
    mov ebx, eax       ; Move the value to EBX (zero-extended)

    ; Convert num2 from string to integer
    mov al, [num2]       ; Load second character into AL
    sub al, '0'          ; Convert from ASCII to integer
    add ebx, eax         ; Add to the first number in EBX

    ; Convert the sum back to a string
    add ebx, '0'         ; Convert result back to ASCII
    mov [sum], bl        ; Store the result in sum


;PRINT 'Your answer is:  '
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
  
 int	0x80        ;call kernel
;PRINT first num
mov edx,2
mov ecx,sum
mov ebx,1
mov eax,4
int 0x80 

    
		
		;end program 
mov	eax,1       ;system call number (sys_exit)
int	0x80        ;call kernel

section	.data
msg db 'The answer is:', 0xa  ;string to be printed
len equ $ - msg     ;length of the string

title DB 'The Adding Program', 0xa
leng equ $ - title

prompt DB 'Please enter a single digit number:', 0xa
length equ $ - prompt