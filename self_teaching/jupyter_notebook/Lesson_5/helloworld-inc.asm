;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    helloworld-inc.asm                                 :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:39:07 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/10 04:33:09 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;
								; Lesson_6 : linefeeds

%include		'functions.asm'
	
section .data
	msg1 db "Hello, brave new world!", 0Ah
	msg2 db "This is how we recycle in NASM.", 0Ah
	
section .text
	global _start

_start:
	mov rax, msg1
	call ft_write

	mov rax, msg2
	call ft_write

	call ft_exit
