;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/12 06:57:23 by vmonteco          #+#    #+#              ;
;    Updated: 2023/07/01 03:47:05 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

section .text
	global ft_strlen			; Defines the symbol's bind as GLOBAL.
								; Necessary to make it accessible by other
								; object files at linking.
								; Default is LOCAL.
								; `man 5 elf` or `readelf -WSs objfile.o` to
								; know more.	

ft_strlen:
	push	rbx					; Put rbx content into stack in order to
								; preserve it.
	mov		rbx, rax			; Copy rbx content into rax (both contain now
								; the same address).

.nextchar:
	cmp		byte [rax], 0		; Check if byte under location in rax is 0 (end
								; of str).
	jz		.finished			; If zero flag set, jump to .finished.
	inc		rax					; Increment rax value (increment address under
								; rax.
	jmp		.nextchar			; Jump to .nextchar (loop back).

.finished:
	sub		rax, rbx			; When zeroed byte is encountered, get the
								; difference between original address and
								; zeroed byte address. Result will be in eax.
	pop		rbx					; Restore rbx.
	ret							; Return.
