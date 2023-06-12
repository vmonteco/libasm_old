ft_strlen:
	push	rbx
	mov		rbx, rax

.nextchar:
	cmp		byte [rax], 0
	jz		.finished
	inc		rax
	jmp		.nextchar

.finished:
	sub		eax, ebx
	pop		ebx
	ret
