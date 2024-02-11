;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    functions.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:31:04 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/10 05:01:14 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

; ft_strlen
ft_strlen:
	push rbx
	mov rbx, rax

_ft_strlen_loop:
	cmp byte [rax], 0
	jz _ft_strlen_finish
	inc rax
	jmp _ft_strlen_loop

_ft_strlen_finish:
	sub rax, rbx
	pop rbx
	ret
	
; ft_putstr
ft_putstr:
	push rax
	push rbx
	push rsi
	push rdi

	mov rsi, rax
	call ft_strlen
	mov rdx, rax
	mov rax, 1
	mov rdi, 1
	syscall
	
	pop rdi
	pop rsi
	pop rbx
	pop rax
	ret

;ft_putnewline
ft_putnewline:
	push rax
	mov rax, 0Ah
	push rax
	mov rax, rsp
	call ft_putstr
	pop rax
	pop rax
	ret
	
;ft_putstrn
ft_putstrn:
	call ft_putstr
	call ft_putnewline
	ret

;ft_exit
ft_exit:
	mov rax, 60
	mov rdx, 0
	syscall
