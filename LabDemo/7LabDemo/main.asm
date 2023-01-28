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


;;;;;
; File descriptors
FD_STDIN			equ		0
FD_STDOUT			equ		1
FD_STDERR			equ		2


;;;;;
; Strings
HELLO_MESSAGE		db		"Hello, my name is Herman P Schnitzel !!", 13, 10
HELLO_MESSAGE_LEN	equ		$-HELLO_MESSAGE

TRUE_MSG			db		"Well, the thing was true!", 13. 10
TRUE_MSG_LEN		equ
FALSE_MSG			db		"Well, the thing was false!", 13. 10
FALSE_MSG_LEN		equ


CRLF				db		13,10
CRLF_LEN			equ		$-CRLF


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
	
	;Let's implement the follwoing if statement:
	;	if (r12 > r13) {
	;		print (true msg)
	;	} else {
	;		pint (false msg)
	;	]
	
	;First load r12 and r13 with pretend values
	mov r12, 5
	mov r13, 6

coolDecisionArea:				;Name this if/else section

	cmp r12, r13				;Implement If (r12 > r13) with the cmp instruction
	jg coolDecisionArea_true	;Jump if greater than to coolDA_true, if r12 was more than r13
	;jmp coolDecisionArea_false	;JUmp to coolDA_flase otherwise (jmp not needed, because execution will fall throuhg)
	
coolDecisionArea_true:

	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, TRUE_MSG			; Provide the memory location to start reading our characters to print
	mov rdx, TRUE_MSG_LEN		; Provide the number of characters print
	syscall
	jmp coolDecisionArea_finished

coolDecisionArea_false:
	
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, FALSE_MSG			; Provide the memory location to start reading our characters to print
	mov rdx, FALSE_MSG_LEN		; Provide the number of characters print
	syscall
	jmp coolDecisionArea_finished
	
;When we get here, the IF block is done
coolDecisionArea_finished:
	
	call crlf
	

;	Return to the caller
goodbye:
	
	; It is a convention for return values to show up in rax
	mov rax, EXIT_SUCCESS
	ret


crlf:

	
	;
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, CRLF				; Provide the memory location to start reading our characters to print
	mov rdx, CRLF_LEN			; Provide the number of characters print
	syscall
		

	
	ret
