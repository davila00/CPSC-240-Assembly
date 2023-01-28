; Name: Daniel Avila
; CWID: 887755916
; Email: deadanny31@csu.fullerton.edu


;;;;;;;;;;;;;;;;;;;;
;Begin data section
section .data

;;;;;;;;
;System Calls
SYS_WRITE		equ	1
SYS_EXIT		equ	60


;;;;;;;;
;Exit Codes
Exit_SUCCESS	equ	0

;;;;;;;;
;File Descriptors
FD_STDIN		equ	0
FD_STDOUT		equ	1
FD_STDERR		equ	2

;;;;;;;;
;Strings
RCVDNUM_MSG		db	"These numbers were received and placed into the array: "
RCVDNUM_MSG_LEN	equ	$-RCVDNUM_MSG


CRLF			db	13,10
CRLF_LEN		equ	$-CRLF

;;;;;;;;;;;;;;;;;;;;
;External symbols
extern			libPuhfessorP_printSignedInteger64

;;;;;;;;;
;
LVARCOUNT		equ	5

global display_array
display_array:
	
	push rbp
	push rbx
	push r10
	push r12
	push r13
	push r14
	push r15
	
printLoop:
	
	mov r15, r12
	lea rbx, [r12 + (LVARCOUNT * 8) - 1]
	
printLoop_top:
	
	cmp r15, rbx
	jg printLoop_done
	
	mov rdi, [r15]
	
	mov rax, SYS_WRITE				
	mov rdi, FD_STDOUT
	mov rsi, RCVDNUM_MSG
	mov rdx, RCVDNUM_MSG_LEN
	syscall
	
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	add r15, 8
	jmp printLoop_top
	
printLoop_done:

	mov rsp, rbp
	pop r15
	pop r14
	pop r13
	pop r12
	pop r10
	pop rbx
	pop rbp
	
	mov rax, 0
	
	ret
	
;Print CRLF
crlf:

	mov rax, SYS_WRITE	;system call code goes into rax
	mov rdi, FD_STDOUT	;tell the system to print to STDOUT
	mov rsi, CRLF		;provide the memory location to start reading our characters to print
	mov rdx, CRLF_LEN	;provide the number of characters to print
	syscall
	
	ret
