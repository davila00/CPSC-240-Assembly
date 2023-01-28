; Name: Daniel Avila
; CWID: 887755916
; Email: deadanny31@csu.fullerton.edu

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Begin section data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .data


;;;;;;;;;;;;;;;;;;;
;System calls
SYS_WRITE 				equ			1
SYS_EXIT 				equ			60

;;;;;;;;;;;;;;;;;;;
;File Descriptors
FD_STDIN				equ			0
FD_STDOUT				equ			1
FD_STDERR				equ			2

;;;;;;;;;;;;;;;;;;;
;Strings
STARTING_MESSAGE		db			"This area function is fondly brought to you by Daniel Avila."
STARTING_MESSAGE_LEN	equ			$-STARTING_MESSAGE

MSG_ENTER				db			"Please enter the radius of a circle in whole number of meters: "
MSG_ENTER_LEN			equ			$-MSG_ENTER

MSG_RECEIVED1			db			"The number "
MSG_RECEIVED1_LEN		equ			$-MSG_RECEIVED1

MSG_RECEIVED2			db			" was received."
MSG_RECEIVED2_LEN		equ			$-MSG_RECEIVED2

MSG_QUOTIENT1			db			"The area of a circle with this radius is "
MSG_QUOTIENT1_LEN		equ			$-MSG_QUOTIENT1

MSG_QUOTIENT2			db			" and "
MSG_QUOTIENT2_LEN		equ			$-MSG_QUOTIENT2

MSG_QUOTIENT3			db			"/7 square meters."
MSG_QUOTIENT3_LEN		equ			$-MSG_QUOTIENT3

MSG_OUT					db			"The integer part of the area will be returned to the main program. Please enjoy your circles."
MSG_OUT_LEN				equ			$-MSG_OUT

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
extern libPuhfessorP_printSignedInteger64
extern libPuhfessorP_inputSignedInteger64 

global area
area:
			;Print out the messages that start the calculator
			mov rax, SYS_WRITE				;system call code to rax
			mov rdi, FD_STDOUT				;Tell the system to print
			mov rsi, STARTING_MESSAGE		;Message that will print out 
			mov rdx, STARTING_MESSAGE_LEN	;The message will print here
			syscall
			call crlf
			
userInput:
			;Print out message that asks for whole meters from user
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_ENTER
			mov rdx, MSG_ENTER_LEN
			syscall
			
			call libPuhfessorP_inputSignedInteger64
			mov [USER_RADIUS], rax 
outputInput:			
			;Prints out message of the number that was received
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_RECEIVED1
			mov rdx, MSG_RECEIVED1_LEN
			syscall
			
			mov rdi, [USER_RADIUS]
			call libPuhfessorP_printSignedInteger64
			
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_RECEIVED2
			mov rdx, MSG_RECEIVED2_LEN
			syscall
			call crlf				
calcArea:						
			;Prints out message of the calculation of the area
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_QUOTIENT1
			mov rdx, MSG_QUOTIENT1_LEN
			syscall

			
			mov r12, [USER_RADIUS]  ;r12 is now the input
			imul r12, r12			
			push r12
division:
				
			mov rax, 22
			cqo
			mov r10, 7
			idiv r10
			mov r12, rax
			mov r13, rdx
			
			
			pop r12
			
			imul r12, rax
			
			mov rdi, r12
			call libPuhfessorP_printSignedInteger64
			
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_QUOTIENT2
			mov rdx, MSG_QUOTIENT2_LEN
			syscall
			
remainder:	
			;;;need code to multiply the remainder by r13
			
			mov rdi, r13
			call libPuhfessorP_printSignedInteger64
			
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_QUOTIENT3
			mov rdx, MSG_QUOTIENT3_LEN
			syscall
			call crlf
			
endASM:
			;Prints out final string message from the .asm file
			mov rax, SYS_WRITE				
			mov rdi, FD_STDOUT
			mov rsi, MSG_OUT
			mov rdx, MSG_OUT_LEN
			syscall
			
			call crlf
goodbye:
			mov rax, r12
			ret



crlf:
			mov rax, SYS_WRITE	
			mov rdi, FD_STDOUT
			mov rsi, CRLF
			mov rdx, CRLF_LEN
			syscall
		
			ret
