; Name: Daniel Avila
; CWID: 887755916
; Email: deadanny31@csu.fullerton.edu


;;;;;;;;;;;;;;;;;;;;
;Begin the data section
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

HELLO_MSG		db	"This program will reverse your array of integers."
HELLO_MSG_LEN	equ	$-HELLO_MSG

ENTER_MSG		db	"Enter a sequence of long integers separated by the enter key (one integer per line.) Enter 'q' to quit."
ENTER_MSG_LEN	equ	$-ENTER_MSG

INPUT_MSG		db	"Enter the next integer: "
INPUT_MSG_LEN	equ	$-INPUT_MSG

VALID_MSG		db	"You entered: "
VALID_MSG_LEN	equ	$-VALID_MSG

REVERSE_MSG		db 	"After the reverse function, these are the numbers of the array in their new order: "
REVERSE_MSG_LEN	equ	$-REVERSE_MSG

INVALID_MSG		db	"You've entered nonsense. Assuming you are done!"
INVALID_MSG_LEN	equ	$-INVALID_MSG

TOTAL1_MSG		db 	"you entered "
TOTAL1_MSG_LEN	equ	$-TOTAL1_MSG

TOTAL2_MSG		db	"total numbers and their mean is "
TOTAL2_MSG_LEN	equ	$-TOTAL2_MSG

RETURN_MSG		db 	"The mean will now be returned to the main function."
RETURN_MSG_LEN	equ	$-RETURN_MSG

CRLF			db	13,10
CRLF_LEN		equ	$-CRLF

;;;;;;;;;
;User input stuff
USER_INT		dq	0

LVARCOUNT		equ	5

;;;;;;;;;;;;;;;;;;;;
;Begin the text section
section .text

;;;;;;;;;;;;;;;;;;;;
;External symbols
extern			libPuhfessorP_inputSignedInteger64
extern			libPuhfessorP_printSignedInteger64
extern			display_array
extern 			reverse		

; Internal register usage:
;	r10: Temp calculations stuff
;	r12: Pointer to the beginning of our array
;	r13: Current number to write
;	r14: Current index
;	r15: Running pointer
;	rbx: Stopping point for the running pointer (pointer to the last integer)
global manager
manager:
	
	;Print out hello message
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, HELLO_MSG
	mov rdx, HELLO_MSG_LEN
	syscall
	call crlf
	
	;Print out enter message
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, ENTER_MSG
	mov rdx, ENTER_MSG_LEN
	syscall
	call crlf
	
	;Go into for-loop so user enters X amount of integers
	;Prologue
	push rbp
	push rbx
	push r10
	push r12
	push r13
	push r14
	push r15
	
	mov rbp, rsp
	mov r10, LVARCOUNT
	imul r10, 8
	sub rsp, r10
	mov r12, rsp

fillLoop_init:

	mov r13, [USER_INT]
	mov r14, 0
	
fillLoop_top:

	;Get input from user
	mov rax, SYS_WRITE				
	mov rdi, FD_STDOUT
	mov rsi, INPUT_MSG
	mov rdx, INPUT_MSG_LEN
	syscall
			
	call libPuhfessorP_inputSignedInteger64
	mov [USER_INT], rax 	
	
	;Prints out message of the number that was received
	mov rax, SYS_WRITE				
	mov rdi, FD_STDOUT
	mov rsi, VALID_MSG
	mov rdx, VALID_MSG_LEN
	syscall
			
	mov rdi, [USER_INT]
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	cmp r14, LVARCOUNT
	jge fillLoop_done
	
	mov [r12 + (r14 * 8)], r13
	
	inc r14
	
	jmp fillLoop_top
	
fillLoop_done:
	
	call crlf
	mov rax, SYS_WRITE				
	mov rdi, FD_STDOUT
	mov rsi, INVALID_MSG
	mov rdx, INVALID_MSG_LEN
	syscall	
	call crlf
	
printLoop:
	
	;mov rsi,
	;mov rdi,
	call display_array

m_done:
	
	;Epilogue
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
