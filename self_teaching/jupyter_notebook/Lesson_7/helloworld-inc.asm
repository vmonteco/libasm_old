;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    helloworld-inc.asm                                 :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:39:07 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/10 04:46:46 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
								; Lesson_5

%include		'functions.asm'
	
section .data
	msg1 db "Hello, brave new world!", 0h
	msg2 db "This is how we recycle in NASM.", 0h
	
section .text
	global _start

_start:
	mov rax, msg1
	call ft_putstrn

	mov rax, msg2
	call ft_putstrn

	call ft_exit
