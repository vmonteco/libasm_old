; --------------------- Lesson 1 : Attempt to convert above program to a compatible version --------------
section .data
    msg db 'Hello world !'
    
section .text
    global _start
    
_start:
    mov rax, 1; OPCODE is actually 1, reg to use rax
    mov rdi, 1; reg for fd is actually rdi
    mov rsi, msg; reg for char* is actually rsi
    mov rdx, 13; reg for size is actually rdx
    syscall ; This is how we actually get a software interrupt.
