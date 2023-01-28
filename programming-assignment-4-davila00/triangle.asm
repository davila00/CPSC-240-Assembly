; Name: Daniel Avila
; CWID: 887755916
; Email; deadanny31@csu.fullerton.edu

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

;;;;;;;;;;;;;;;;;;;
;Strings
STARTING_MESSAGE		db			"The manager is here to jelp you find the area of your triangle."
STARTING_MESSAGE_LEN	equ			$-STARTING_MESSAGE

INPUT_MESSAGE			db			"Input your 3 floating point numbers representing the sides of a triangle."
INPUT_MESSAGE_LEN		equ			$-INPUT_MESSAGE

ENTER_MESSAGE			db			"Press enter after each number"
ENTER_MESSAGE_LEN		equ			$-ENTER_MESSAGE

RECEIVED_MESSAGE		db			"The area will be returned to Heron."
RECEIVED_MESSAGE_LEN	equ			$-RECEIVED_MESSAGE

CRLF					db			13,10
CRLF_LEN				equ			$-CRLF

;Variables
USER_RADIUS				dq			0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text


;;;;;;;;;;;;;;;;;;
;My External Symbols
extern libPuhfessorP_printFloat64
extern libPuhfessorP_inputFloat64 

global triangle
triangle:
			;Print out message
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, STARTING_MESSAGE		;Message that will print out 
			mov rdx, STARTING_MESSAGE_LEN	;The message will print here
			syscall
			call crlf
			
			
			;Print out message
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, INPUT_MESSAGE			;Message that will print out 
			mov rdx, INPUT_MESSAGE_LEN		;The message will print here
			syscall
			call crlf
			
			;Print out message
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, ENTER_MESSAGE			;Message that will print out 
			mov rdx, ENTER_MESSAGE_LEN		;The message will print here
			syscall
			call crlf
			
			;Print out message
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, RECEIVED_MESSAGE		;Message that will print out 
			mov rdx, RECEIVED_MESSAGE_LEN	;The message will print here
			syscall
			call crlf
			
			mov rax, 0
			ret


crlf:
			mov rax, SYS_WRITE	
			mov rdi, FD_STDOUT
			mov rsi, CRLF
			mov rdx, CRLF_LEN
			syscall
		
			ret
