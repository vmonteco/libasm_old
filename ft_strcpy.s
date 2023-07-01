;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/12 07:05:00 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/01 04:12:52 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


section .text
	global ft_strcpy
	

ft_strcpy:
	push	rbx				; Push rbx to stack in order to preserve its
							; original value.
	push	rax				; Push rax to stack in order to preserve its
							; original value.

.loop:
	mov		rax, rbx		; Copy value rbx to rax.
	cmp		byte [rbx], 0	; Compare value at address contained in rbx with 0.
	inc		rax				; Increment rax.
	inc		rbx				; Increment rbx.
	jnz		.loop			; Jump to .loop if zero flag is not set.
	
	pop		rax				; Retrieve rax original value from stack.
	pop		rbx				; Retrieve rbx original value from stack.
	ret						; return
