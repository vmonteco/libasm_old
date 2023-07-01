;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/12 07:15:49 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/01 04:13:30 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global ft_strcmp
	
ft_strcmp:
	push	rax
	push	rbx
	push	rcx
	push	rdx
	
	sub		rax, rbx
	
	pop		rdx
	pop		rcx
	pop		rbx
	pop		rax
	ret
