;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: vmonteco </var/spool/mail/vmonteco>        +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2023/06/12 07:15:49 by vmonteco          #+#    #+#              ;
;    Updated: 2023/06/12 07:22:33 by vmonteco         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

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
