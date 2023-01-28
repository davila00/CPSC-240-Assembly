; Name: Daniel Avila
; CWID: 887755916
; Email; deadanny31@csu.fullerton.edu

;manager fucntion
;call on input_array.cpp to grab user input
;call on output_array to to dispaly array
;call on find_largest to find largest number
;print more information
;return result back to main function


;;
;; Reference: Book Section 12.11: Stack-Based Local Variables


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Data Section
section		.data

SYS_WRITE					equ		1
FD_STDOUT					equ		1


CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

;;;;;
;Strings
HELLO_MESSAGE				db 		"The manager is here to assist you.", 13, 10
HELLO_MESSAGE_LEN			equ		$-HELLO_MESSAGE

RECEIVED_MESSAGE			db		"The following integers were received:", 13, 10
RECEIVED_MESSAGE_LEN		equ		$-RECEIVED_MESSAGE

LARGEST_INT1				db 		"The largest value ", 13, 10
LARGEST_INT1_LEN			equ		$-LARGEST_INT1

LARGEST_INT2				db 		"has been found at index ", 13, 10
LARGEST_INT2_LEN			equ		$-LARGEST_INT2

BACK_TO_MAIN				db 		"The manager will now return the count to the driver", 13, 10
BACK_TO_MAIN_LEN			equ		$-BACK_TO_MAIN
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Text Section
section		.text


; Externals
extern input_array
extern output_array
extern find_largest
extern libPuhfessorP_printSignedInteger64


global manager
manager:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, HELLO_MESSAGE
	mov rdx, HELLO_MESSAGE_LEN
	syscall
	
	;Call input_array
	call input_array
	
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, RECEIVED_MESSAGE
	mov rdx, RECEIVED_MESSAGE_LEN
	syscall
	
	
	;Call output_array
	call output_array
	
	;Call find_largest
	;call find_largest
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, LARGEST_INT1
	mov rdx, LARGEST_INT1_LEN
	syscall
	
	call libPuhfessorP_printSignedInteger64
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, LARGEST_INT2
	mov rdx, LARGEST_INT2_LEN
	syscall
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, BACK_TO_MAIN
	mov rdx, BACK_TO_MAIN_LEN
	syscall
	
	;mov rax, 0
	ret


crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret
