; Name: Daniel Avila
; CWID: 887755916
; Email; deadanny31@csu.fullerton.edu

; can use global variables

; conditional branch to jump to taking the square IF the sides are not nonsense

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Begin section data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data


;;;;;;;;;;;;;;;;;;;
;System calls
SYS_WRITE 				equ			1

;;;;;;;;;;;;;;;;;;;
;File Descriptors
FD_STDOUT				equ			1

STARTING_MESSAGE		db			"in compute area"
STARTING_MESSAGE_LEN	equ			$-STARTING_MESSAGE

;Variables


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text


;;;;;;;;;;;;;;;;;;
;My External Symbols


global compute
compute:
			;Print out the messages that start the calculator
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, STARTING_MESSAGE		;Message that will print out 
			mov rdx, STARTING_MESSAGE_LEN	;The message will print here
			syscall
			
			mov xmm0
			
			
			mov rax, 0
			ret


