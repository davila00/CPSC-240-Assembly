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


LOCAL_VARIABLE_COUNT		equ		5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Begin the text section
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.text


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; My External symbols
extern libPuhfessorP_printSignedInteger64

;;;;;;;
; int main()
;	r10: 	temp calc stuff
;	r12: 	pointer to the beginning of our array
;	r13:	current number to write
;	r14:	Current index
;	rbx:	Stopping point for the running pointer (pointer to the last integer)
global main
main:
	
	;Epilogue
	push rbp
	push rbx
	push r12
	push r13
	push r14
	push r15
	
	mov rbp, rsp		;Move the stack pointer into the base pointer
						;The base pointer wil serve as a bookmark to where our stack started
						
	;
	mov r10, LOCAL_VARIABLE_COUNT	;start with r10 = n_integer
	imul r10, 8						;now r10 = (n_integers * *), or the number of bytes we need for our integers
	sub rsp, r10					;Allocate our integers on the stack by basically just moving the stackpointer
									;yes this means we now have LOCAL_VARIABLE_COUNT integers of junk
									
	mov r12, rsp					;Keep a pointer to the first integer we've created
	
main_fillLoop_init:
	
	;Now lets fill the array with values starting with 5 and increasing by 2
	;This is hwere we initizialize our loop
	mov r13, 5						;start number at 5
	mov r14, 0						;Start our offset/index at 0
	
main_fillLoop_top:

	;Are we done looping?
	cmp r14, LOCAL_VARIABLE_COUNT
	jge main_fillLoop_done
	
	;Fill in the next number
	mov [r12 + (r14 *8)], r13		;compute address of intger (left), and give it the value of r13
									;my_integers[r14] = r13
	
	;Increment stuff
	inc r14							;increase the index
	add r13, 2						;increase the value we're writing
	
	;jump back to the top of the loop
	jmp main_fillLoop_top
	
main_fillLoop_done:

mian_printLoop:
	
	;Now let's print our ints, one by one, to make sure we wrote correct
	;instead of computing the address of each int in our mov instruction
	; lets just use a running pointer that knows when to stop
	
	mov r15, r12									;Start the running pointer at the begnning of our array
	lea rbx, [r12 + (LOCAL_VARIABLE_COUNT * 8) -1]	;Calc the address of the LAST int (inclusive bc of the -1)
													;Note: We use "lea" to move a computed address into rbx rather than the value at that address

main_printLoop_top:
	
	;Are we done?
	cmp r15, rbx					;compare our running pointer to the last integer's pointer
	jg main_printLoop_done			;we;re finished when our running pointer is greater than the last integer's pointer
	
	;ASk libP to print it out
	mov rdi, [r15]					;use our running pointer to grab the value of the interger we're currently pointing at
	call libPuhfessorP_printSignedInteger64
	call crlf
	
	;Increment our running pointer, and continue looping
	add r15, 8
	jmp main_printLoop_top
	
	
main_printLoop_done:
					
	
main_done:
	
	;Epilogue
	mov rsp, rbp
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp
	
	mov rax, 0
	
	ret


crlf:
	;
	mov rax, SYS_WRITE			; System call code goes into rax
	mov rdi, FD_STDOUT			; Tell the system to print to STDOUT
	mov rsi, CRLF				; Provide the memory location to start reading our characters to print
	mov rdx, CRLF_LEN			; Provide the number of characters print
	syscall
		

	
	ret
