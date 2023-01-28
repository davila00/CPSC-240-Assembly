;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Begin the data section
section	.data


;;;;;
; System calls
SYS_WRITE			equ		1
SYS_EXIT			equ		60


;;;;;
; Exit Codes
EXIT_SUCCESS			equ		0
EXIT_FUN_TEST			equ		214


;;;;;
; File descriptors
FD_STDIN			equ		0
FD_STDOUT			equ		1
FD_STDERR			equ		2


;;;;;
; Strings
HELLO_MESSAGE		db		"Hello, my name is Ursula Mondover !!"
HELLO_MESSAGE_LEN	equ		$-HELLO_MESSAGE

CRLF				db		13,10
CRLF_LEN			equ		$-CRLF

; User input stuff
USER_RADIUS			dq		0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.text


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; My External symbols
extern libPuhfessorP_printSignedInteger64
extern libPuhfessorP_printRegisters

;
global main
main:
	
	;;;;;;;;;;;;;;;;;;;;
	; Print out our hello message with a system call
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, HELLO_MESSAGE		; Provide the memory location to start reading our characters to print
	mov rdx, HELLO_MESSAGE_LEN	; Provide the number of characters print
	syscall

	call crlf
	
register_test:
	mov r12, 1
	mov r13, 2
	mov r14, 3
	mov r15, 4
	
	call crlf
	
	call libPuhfessorP_printRegisters
	

;	Return to the caller
goodbye:
	
	; It is a convention for return values to show up in rax
	mov rax, EXIT_SUCCESS
	ret

;Out CRLF function in this program will mess with registers r12 through r15,
;to simulate the need for preserving "callee saved" registers.
crlf:

	; Save registers and do any other function-init-stuffs
	;(Prologue)
	push r12
	push r13
	push r14
	push r15
	
	;Pretend this function also needs to use the temp registers r10 and r11
	mov r10, 0x99999999
	mov r11, 0x99999999
	
	;Pretend to need to use these registers
	mov r12 ,10
	mov r13, 11
	mov r14, 12
	mov r15, 13
	
	;
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, CRLF				; Provide the memory location to start reading our characters to print
	mov rdx, CRLF_LEN			; Provide the number of characters print
	syscall
	
	; Rstore registers and do any other function -cleanup-stuff
	;(Epilogue)
	pop r15
	pop r14
	pop r13
	pop r12
	
	ret
