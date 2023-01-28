;;;;;;;;;;;;;;;;;
;	Begin with data section
section	.data

;;;;;;
;System Calls
SYS_WRITE		equ		1
SYS_EXIT		equ		60


;;;;;;
;Exit Codes
EXIT_SUCCESS 	equ		o




;;;;;
;File descriptors
FD_STDIN 	equ 0 ;standard input
FD_STDOUT	equ 1 ;standard output
FD_STDERR	equ 2 ;standard error
;;;;;;;;


;;;;;;;;;;;;;;;
; Strings
HELLO_MESSAGE	db	"Hello, my name is Gibson Mintogneym-Gibson !!" ,13, 10


TEST 	db	22,72,0,27,211,29


HELLO_MESSAGE_LEN	equ	$-HELLO_MESSAGE


; CRLF ==> Carriage return + Line feed has to be a ,13,10


; equ will convert the left side code with the right side code ---alias

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.text

;
global _start
_start:

;global main
;main:

	nop
	nop
	nop
	
	; some other stuff
	
	nop
	nop
	nop

hello:
	
	;;;;;;;;;;;;;;;;
	;Print out our hello message with a system call
	move rax, SYS_WRITE				;system call code goes into rax
	mov rdi, FD_STDOUT				;Tell the system to print to STDOUT
	mov rsi, HELLO_MESSAGE			;Provide the mem location to start reading our characters to print
	mov rdx, HELLO_MESSAGE_LEN		;Provide the number of characters print
	syscall

goodbye:

	;use syscall to exit gracefully
	
	mov rax, SYS_EXIT		;Load syscall code for return into rax
	mov rdi, EXIT_SUCCESS	;Load our program's return code (0=Success into rdi)
	syscall
	
	
	;ret    ;return call      
	
	
	
	
	
