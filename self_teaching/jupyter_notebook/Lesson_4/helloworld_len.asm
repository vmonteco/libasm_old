;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    helloworld-len.asm                                 :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:13:52 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/10 03:25:14 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
; Lesson 4 : subroutines :

section .data
	msg db 'Hello, brave new world!', 0Ah

section .text
global _start

_start:
	mov rax, msg
	call ft_strlen
	mov rdx, rax
	mov rax, 1
	mov rsi, msg
	mov rdi, 1
	syscall

	mov rax, 60
	mov rdi, 0
	syscall
	
ft_strlen:
	push rbx
	mov rbx, rax

_ft_strlen_loop:
	cmp byte [rax], 0
	jz _ft_strlen_finish
	inc rax
	jmp _ft_strlen_loop

_ft_strlen_finish:
	sub rax, rbx
	pop rbx
	ret
