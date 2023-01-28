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


CRLF				db		13,10
CRLF_LEN			equ		$-CRLF


VARIABLE_ONE			dq	1
VARIABLE_TWO			dq	2
VARIABLE_THREE			dq	0.0
VARIABLE_FOUR			dq	0.0

VARIABLE_FOR_CRASHER	dq	0.0

MSG_AFTER_CALL_VALUE db "Printing varaible's one and two after calling by value: " ,13,10
MSG_AFTER_CALL_VALUE_LEN equ $MSG_AFTER_CALL_VALUE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.text


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; My External symbols
extern libPuhfessorP_printSignedInteger64
extern libPuhfessorP_printFloat64
extern my_c_function_by_value
extern my_c_function_with_pointers
extern my_c_function_with_floats

;;;;;;;
; main()
global main
main:
	
	mov rdi, [VARIABLE_ONE]
	mov rsi, [VARIABLE_TWO]
	call my_c_function_by_value
	call crlf
	
	mov rax, SYS_WRITE			
	mov rdi, FD_STDOUT			
	mov rsi, MSG_AFTER_CALL_VALUE				
	mov rdx, MSG_AFTER_CALL_VALUE_LEN			
	syscall
	;
	mov rdi, [VARIABLE_ONE]
	call libPuhfessorP_printSignedInteger64
	call crlf
	mov rdi, [VARIABLE_TWO]
	call libPuhfessorP_printSignedInteger64
	call crlf
	call crlf
	;
	;NOW, lets's call a C function that takes pointers to integers
	;We can't call by reference, because C fuinctions cant take refeercnes
	mov rdi, VARIABLE_ONE
	mov rsi, VARIABLE_TWO
	call my_c_function_with_pointers
	; Let's first do  a strange thing, where we surround some functions calls with a puhs/pop pair
	;	so we cna preserve the return value of my_c_function_with_pointers (rax)
	;	without having to use it yet
	;	(because we're totally out of registers, and I dont feel like making a global for wahtever reason)
	push rax	;might want to double check that stack is aligned 
				;	since libPuh_printSInged64 is a function call with inkown code inside
				;		(unknown code could call C fucntions that require 16 byte stack alingment)
				;Luckily libP_pirntSignedInt64 doesnt call C functions so we dont have to worry here
	;
	call crlf
	;
	mov rax, SYS_WRITE			
	mov rdi, FD_STDOUT			
	mov rsi, MSG_AFTER_CALL_VALUE				
	mov rdx, MSG_AFTER_CALL_VALUE_LEN			
	syscall
	;
	mov rdi, [VARIABLE_ONE]
	call libPuhfessorP_printSignedInteger64
	call crlf
	mov rdi, [VARIABLE_TWO]
	call libPuhfessorP_printSignedInteger64
	call crlf
	;
	pop rax
	;
	mov rdi, [VARIABLE_TWO]
	call libPuhfessorP_printSignedInteger64
	call crlf
	;
	call cWithIntegersAndFLoats
	call crlf
	;
	mov rax, 0
	ret
	
cWithIntegersAndFLoats
	;my_c_function_with_floats
	mov rdi, [VARIABLE_ONE] ;1st int
	mov rsi, [VARIABLE_TWO]	;2nd int
	movsd xmm0, [VARIABLE_THREE]	;1st float
	movsd xmm1, [VARIABLE_FOUR]	;2nd float
	call libPuhfessor_printFloat64
	
	call crlf
	
	ret
	
	
;Some libP functions rely on C library functions
;C library functions often assume your stack is aligned to 16-bytes (evenly divisble by 16-bytes)
;	for performance and optimixation stuffs
;When you push a signle 64-bit register, you're pushing 8 bytes
;SO if you experince mysterious craches while interacting with libP or C library functions,
;	you may want to add an extra push/pop pair, to see if alignment ussues are causing your crash
;Try commenting out one of the oush/pop paris and see fi you can get the program to crash!
; (aslo uncommnet the call to this finction above)	
forceCrahsViaStackAlignmentIssues:
	
	push r14
	push r14
	
	;First argument to printFlaot64 should be the float
	movsd xmm0, [VARIABLE_FOR_CRASHER]
	call libPuhfessorP_printFloat64
	
	pop r14
	pop r14

	ret

crlf:
	;
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, CRLF				; Provide the memory location to start reading our characters to print
	mov rdx, CRLF_LEN			; Provide the number of characters print
	syscall
		

	
	ret

;	movsd xmm0 first arg
;	movsd xmm1 second arg
;	movsd xmm2 third arg
;	movsd xmm3 fourth arg
