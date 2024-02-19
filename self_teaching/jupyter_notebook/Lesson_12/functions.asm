;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    functions.asm                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2024/02/10 03:31:04 by vmonteco          #+#    #+#              ;
;    Updated: 2024/02/19 15:31:40 by vmonteco         ###   ########.fr        ;
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
	;; Pushes hrere
	;; rax will contain the result but contains the str to atoi now.
	;; So no push required
	;; rbx will contain the str
	push rbx
	;; rcx will contain the multiplier (10)
	push rcx
	;; rdx will be overriden at some point
	push rdx
	;; rsi will contain strlen
	push rsi
	;; rdi will contain the counter
	push rdi
	
	;; put str in rbx
	mov rbx, rax
	
	;; get strlen
	call ft_strlen
	;; put strlen in rsi
	mov rsi, rax
	;; init counter
	mov rdi, 0
	;; init result
	mov rax, 0
	;; set multiplier
	mov rcx, 10

_ft_atoi_loop:
	cmp rsi, rdi
	je _ft_atoi_end

	;; multiply current result by 10
	mul rcx
	;; Add current digit (substract 48)
	add al, [rbx+rdi]

	sub rax, 48
	
	inc rdi
	jmp _ft_atoi_loop
	
_ft_atoi_end:
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	ret
