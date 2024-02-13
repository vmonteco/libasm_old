%include 'functions.asm'

section .data

section .bss
	
section .text
	global _start

_start:
	mov rsi, 0

_loop:
	cmp rsi, 12
	je _end ; jz/jnz and je/jne are equivalent. But semantically different.
	mov rax, rsi
	call ft_putnumber
	inc rsi
	jmp _loop

_end:
	call ft_exit
