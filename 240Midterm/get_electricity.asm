; Name: Daniel Avila
; Email; deadanny31@csu.fullerton.edu
; Section: 09

BITS 64


segment .data
welcome	db	"Please enter the two quantities: volts and resistance in that order.", 10, 0
invalid	db	"Invalid...Enter again", 10, 0
received	db	"Thank you", 10, 0
two_string_format	db	"%s%s", 0


segment .bss


segment .text

extern printf
extern scanf
extern atof
extern isFloat

global get_electricity
get_electricity:
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
	
	;welcome message
	push qword 0 
	mov rax, 0
	mov rdi, welcome
	call printf
	pop rax
	;store floats
	push qword -1
	sub rsp, 2048
	mov rax, 0
	mov rdi, two_string_format
	mov rsi, rsp
	mov rdx, rsp
	add rdx, 1024
	call scanf
	
	;valid input
	mov rax, 0
	mov rdi, rsp
	call isFloat
	cmp rax, 0
	je invalidQuantity
	
	mov rax, 0
	mov rdi, rsp
	mov rdi, 1024
	call isFloat
	cmp rax, 0
	je invalidQuantity
	
	;convert to float and store them
	mov rdi, rsp
	call atof
	movsd xmm5, xmm0
	
	mov rdi, rsp
	add rdi, 1024
	call atof
	movsd xmm6, xmm0
	
	;pop register after validation test
	pop rax
	
	;thank you message
	push qword 0
	mov rax, 2
	mov rdi, received
	call printf
	movsd xmm0, xmm5
	movsd xmm1, xmm6
	pop rax
	
invalidQuantity:
	push qword 0
	mov rax, 0
	mov rdi, invalid
	call printf
	pop rax
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

