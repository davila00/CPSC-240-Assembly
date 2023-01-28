; Name: Daniel Avila
; Email; deadanny31@csu.fullerton.edu
; Section: 09

BITS 64


segment .data
wait_work	db	"Please wait...work is being computed.", 10, 0
sent	db	"The work number will be sent to ampere", 10, 0


segment .bss


segment .text
extern printf
extern scanf

global faraday
faraday:
	push rbp
	mov rbp, rsp
	push rdi
	push rsi
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push rbx
	pushf 
	push qword 0
	
	;wait_work message
	push qword 0 
	mov rax, 0
	mov rdi, wait_work
	call printf
	pop rax
	
	;thank you message
	push qword 0
	mov rax, 0
	mov rdi, sent
	call printf
	pop rax
	
	
	popf
	pop rbx
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop rsi
	pop rdi
	pop rbp
	
	ret


