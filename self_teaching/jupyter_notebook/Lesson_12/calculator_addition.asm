;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    calculator_addition.asm                            :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/18 03:17:22 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/19 05:55:15 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	%include 'functions.asm'
	section .data
	msg db "Result :", 0h
	section .bss

	section .text
	global _start
	
_start:
	pop rsi
	pop rax
	dec rsi
	mov rbx, 0					; that will be our sum
	
_loop:
	cmp rsi, 0
	jz _end
	pop rax
	call ft_putstrn
	call ft_atoi
	add rbx, rax
	dec rsi
	jmp _loop	

_end:	
	mov rax, msg
	call ft_putstrn
	mov rax, rbx
	call ft_putnumbern
	call ft_exit
