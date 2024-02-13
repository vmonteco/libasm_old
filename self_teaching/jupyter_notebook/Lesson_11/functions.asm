;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    functions.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:31:04 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/13 23:43:26 by vmonteco         ###   ########.fr        ;
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
	push rax
	mov rax, rdx
	call ft_putdigit
	pop rax
	cmp rax, 0
	jz _ft_putnumber_end
	jmp _ft_putnumber_divide
	
_ft_putnumber_display:

_ft_putnumber_end:
	pop rbx
	pop rax
	pop rdx
	pop rsi
	ret

	
;; ft_putnumber:
;; 	; push rax; number to display
;; 	push rsi; counter
;; 	push rdi; 
;; 	push rdx; remainder
;; 	mov rsi, 0
;; 	mov rdi, 10
;; 	mov rdx, 0
	
;; _ft_putnumber_divide:
;; 	div rdi
;; 	rax<=quotient	

	
;; _ft_putnumber_display:
	

;; _ft_putnumber_exit:	

;; 	pop rdx
;; 	pop rdi
;; 	pop rsi
;; 	ret



;; _bis_ft_putnumber:
;; 	push rax
;; 	push rsi
;; 	push rdi
;; 	push rcx
;; 	mov rsi, 0
;; 	mov rdi, 10
;; 	mov rdx, 0
;; 	cqo
	
;; _ft_putnumber_divide:
;; 	div rdi
;; 	;mov rax, quotient Useless as rax contains the result
	
;; 	push rdx
;; 	inc rsi
;; 	cmp rax, 0
;; 	jz _ft_putnumber_printing
;; 	jmp _ft_putnumber_divide
	
;; _ft_putnumber_printing:
;; 	pop rax
;; 	dec rsi
;; 	call ft_putdigit
;; 	cmp rsi, 0
;; 	jz _ft_putnumber_end
;; 	jmp _ft_putnumber_printing
	
;; _ft_putnumber_end:
;; 	pop rcx
;; 	pop rdi
;; 	pop rsi
;; 	pop rax
;; 	ret


;; ; ft_putnumbern
;; ft_putnumbern:
;; 	call ft_putnumber
;; 	call ft_putnewline
;; 	ret


;; ft_debug:
;; 	push rax
;; 	push rbx
;; 	push rcx
;; 	push rdx
;; 	push rsi
;; 	push rdi
;; 	push rbp
;; 	push rsp
;; 	push r8
;; 	push r11
;; 	push zf


;; 	pop zf
;; 	pop r11
;; 	pop r8
;; 	pop rsp
;; 	pop rbp
;; 	pop rdi
;; 	pop rsi
;; 	pop rdx
;; 	pop rcx
;; 	pop rbx
;; 	pop rax
;; 	ret
