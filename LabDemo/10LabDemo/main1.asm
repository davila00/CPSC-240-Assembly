;;;;;;;;;
;;;;;;
section .data
;;;;;;;;;
;;;;;;
section .text

; Main function

global main
main:

	mov r10, 1
	mov r11, 2
	mov r12, 3
	mov r13, 4
	mov r14, 5
	mov r15, 6
	
	; Return
	mov rax, 0
	ret
	
	
;;;;;;;;;;;;;;;;
;
;	gdb
;
;		file *file-name*
;		break *file-name*:(line #)
;		info registers
;		continue (to continue allowing the program to execute)
;		quit
;		y
;		i (info)
;		r (register)
;		x/ld(or d) $*register*($r12)
;		x/s (string)
;		x/c (character)




;	can use a .txt file to enter gdb commands to list gdb commands and execute them one after another
;
;BUFFER_SIZE equ 8192
;
;	BSS Section
;section	.bss
;
;BUFFER	resb	BUFFER_SIZE
;
