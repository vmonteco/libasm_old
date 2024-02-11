; ---------------------- Lesson 3 : calculate string length -------------------------

section .data
    msg db "Hello, brave new world !", 0Ah ; With nul character

section .text
    global _start

_start:
    mov rax, msg
    mov rdi, rax
    
ft_strlen_loop:
    cmp byte [rax], 0
    jz ft_strlen_end
    inc rax
    jmp ft_strlen_loop
    
ft_strlen_end:
	; For syscal 1 : write. rax : OPCODE. rdi : fd (1). rsi : char *buf. rdx: size/

	sub rax, rdi
    
    mov rdx, rax
    mov rax, 1
    mov rsi, msg
	mov rdi, 1
    syscall
    
    mov rax, 60;
    mov rdi, 0;
    syscall
