%include 'functions.asm'

section .data
	msg1 db 'Please enter your name: ', 0h
	msg2 db 'Hello, ', 0h

								;BSS stands for BLOCK started by Symbol
								; It's an aera in our program that is used to reserve space in memory for uninitialised variables.
								; We will use it to reserve some space in memory to hold our user input since we don't know how many bytes we'll need to store.

section .bss
sinput:	resb 255 ; resb stands for "reserve space for 1 byte. b-> byte, w -> word, d -> double world, q -> double precision float (quad word), t -> extended precision float

; the syscall to call will be sys_read. OPCODE 0, rdi : fd, rsi : char *buf, rdx: size_t count
section .text
	global _start

_start:
	mov rax, msg1
	call ft_putstr
	
	mov rax, 0
	mov rdi, 0
	mov rsi, sinput
	mov rdx, 255
	syscall

	mov rax, msg2
	call ft_putstr

	mov rax, sinput
	call ft_putstr ; not ft_putstrn as sinput will contain a trailing \n
	
	call ft_exit
