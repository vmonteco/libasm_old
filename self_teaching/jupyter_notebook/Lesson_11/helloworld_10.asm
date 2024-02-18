%include 'functions.asm'

section .data

section .bss
	
section .text
	global _start

_start:
	mov rsi, 1

_loop:
	mov rax, rsi
	call ft_putnumbern
 	cmp rsi, 9999999
	je _end ; jz/jnz and je/jne are equivalent. But semantically different.
	inc rsi
	jmp _loop

_end:
	call ft_exit
