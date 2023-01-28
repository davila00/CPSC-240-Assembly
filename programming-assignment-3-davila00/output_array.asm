; Name: Daniel Avila
; CWID: 887755916
; Email; deadanny31@csu.fullerton.edu

;function named output_array
;argument 1 --pointer to an array of ints
;argument 2 --count of those ints
;print a comma + space before every int but first


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Data Section
section		.data

SYS_WRITE					equ		1
FD_STDOUT					equ		1


CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

;;;;;
;Strings
COUNT_INTEGERS2				db 		"( ", 13, 10
COUNT_INTEGERS2_LEN			equ		$-COUNT_INTEGERS2

COUNT_INTEGERS				db 		"integers)", 13, 10
COUNT_INTEGERS_LEN			equ		$-COUNT_INTEGERS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Text Section
section		.text


; Externals
extern input_array
extern libPuhfessorP_printSignedInteger64

;void output_array(signed long*, long)

global output_array
output_array:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, COUNT_INTEGERS2
	mov rdx, COUNT_INTEGERS2_LEN
	syscall
	
	;mov rdi, [counter]
	call libPuhfessorP_printSignedInteger64
	call crlf
	mov r12, 14
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, COUNT_INTEGERS
	mov rdx, COUNT_INTEGERS_LEN
	syscall
	
	
	ret


crlf:
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CRLF
	mov rdx, CRLF_LEN
	syscall
	
	ret
