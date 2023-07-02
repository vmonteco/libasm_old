;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/18 15:46:30 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/01 05:44:51 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


section .text
	global ft_strdup
	extern ft_strlen		; extern keyword permits to reference an external
							; symbol.
	extern ft_strcpy
	
.ft_strnew:
	
	
ft_strdup:
	push	rbx
	push	rax
	mov		rbx, rax
	call	ft_strlen
	call	.ft_strnew
	call	ft_strcpy
	mov		rbx, rax
	pop		rax
	ret
