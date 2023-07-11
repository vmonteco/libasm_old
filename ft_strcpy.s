;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/12 07:05:00 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/02 21:00:46 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;


section .text
	global ft_strcpy
	

ft_strcpy:
	push	rcx
	push	rbx				; Push rbx to stack in order to preserve its
							; original value.
	push	rax				; Push rax to stack in order to preserve its
							; original value.

.loop:
	mov		rcx, [rbx]		; 
	mov		[rax], rcx		; 
	; mov	[rax], [rbx]		; Also tried this but got :
							; Error: invalid combination of opcode and operands 
	cmp		byte rcx, 0		; Compare value at address contained in rbx with 0.
	inc		rax				; Increment rax.
	inc		rbx				; Increment rbx.
	jnz		.loop			; Jump to .loop if zero flag is not set.
	
	pop		rax				; Retrieve rax original value from stack.
	pop		rbx				; Retrieve rbx original value from stack.
	pop		rcx
	ret						; return
