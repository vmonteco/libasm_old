;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    calculator_addition.asm                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/18 03:17:22 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/18 03:44:00 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	%include 'functions.asm'
	
	section .data

	section .bss

	section .text
	global _start
	
_start:
	pop rax
	mov rsi, rax
	mov rax, 0
	
_loop:
	cmp rsi, 0
	jz _end
	pop rbx
	push rax
	mov rax, rbx
	call ft_atoi
	pop rbx
	add rax, rbx
	dec rsi
	jmp _loop
	
_end:	
	call ft_putnumbern
	call ft_exit
