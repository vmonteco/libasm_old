;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/07/01 04:42:17 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/01 04:52:04 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global ft_read

ft_read:
	mov rax, 0
	syscall
	ret
