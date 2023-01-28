;;;;;;;;;
;;;;;;
section .data
;;;;;;;;;


MY_INT		dq		1234567
ARRAY_LEN	equ		100


MY_INT		resq	ARRAY_LEN


;;;;;;
section .text


extern libPuhfessorP_printSignedInteger64

; Main function

global main
main:

	call getValue
	call crlf
	
	call getPointer
	call crlf
	
	call crlf
	call crlf
	call crlf
	
	ret
	
getValue:
	
	mov r12, [MY_INT]
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, ANNOUNCE_MOV_VALUE
	mov rdx, ANNOUNCE_MOV_VALUE_LEN
	syscall
	
	mov rdi, [MY_INT]
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	ret

getPointer:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, ANNOUNCE_GET_POINTER
	mov rdx, ANNOUNCE_GET_POINTER_LEN
	syscall
	
	mov r12, MY_INT
	
	mov rdi, r12
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	mov rdi, [r12]
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	ret

crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_SDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	ret
