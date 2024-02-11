%include 'functions.asm'

section .text
	global _start

_start:
	pop rsi
	;pop rcx ; first value is the number of arguments ; Do not use rcx/ecx as it's modified by syscalls. Other regs can be modified so. By instructions as well sometimes.
	mov rax, rsi
	call ft_putdigit
	
_loop:
	cmp rsi, 0; No dereferencing as rcx doesn't contain an address (pointer) here.
	jz _end
	pop rax
	call ft_putstrn
	dec rsi
	jmp _loop

_end:
	call ft_exit
