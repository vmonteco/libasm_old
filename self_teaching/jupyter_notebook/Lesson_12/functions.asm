;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    functions.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:31:04 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/18 14:38:10 by vmonteco         ###   ########.fr        ;
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

; ft_putdigit
ft_putdigit:
	add rax, 48
	push rax
	mov rax, rsp
	call ft_putstr
	pop rax
	ret
	
;ft_putnumber
;https://www.aldeid.com/wiki/X86-assembly/Instructions/div	
	
ft_putnumber:
	push rsi; counter
	mov rsi, 0
	push rdx ; remainder 
	push rax ; dividende
	push rbx ; divider
	mov rbx, 10
	
_ft_putnumber_divide:
	cqo
	div rbx
	push rdx
	inc rsi
	cmp rax, 0
	jz _ft_putnumber_display
	jmp _ft_putnumber_divide
	
_ft_putnumber_display:
 	pop rax
	dec rsi
	call ft_putdigit
	cmp rsi, 0
	jz _ft_putnumber_end
	jmp _ft_putnumber_display
	
_ft_putnumber_end:
	pop rbx
	pop rax
	pop rdx
	pop rsi
	ret

ft_putnumbern:
	call ft_putnumber
	call ft_putnewline
	ret

ft_atoi:
	;; pushes here
	push rbx					; rbx will contain the str
	push rcx					; rcx will contain the multiplier
	push rdx					; rdx will contain the counter
	push rsi					; rsi will be used as a counter
	
	;; get ft_strlen
	mov rbx, rax		   ; Put str in rbx
	call ft_strlen				; strlen now in rax
	mov rsi, rax				; put strlen in rsi
	mov rdx, 0					; future counter
	mov rcx, 10
	mov rax, 0					; rax will contain the result
	
_ft_atoi_loop:
	cmp rsi, rdx
	je _ft_atoi_end
	mul rcx
	add rax, [rbx+rdx]
	sub rax, 48
	inc rdx
	jmp _ft_atoi_loop
		
_ft_atoi_end:	
	;; pops here
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	ret
