; Name: Daniel Avila
; CWID: 887755916
; Email; deadanny31@csu.fullerton.edu

;function named find_largest
;locate the largest number in an array
;no I/O in this function
;argument 1 --pointer to an array of ints
;argument 2 --count of those ints
;return the index of the largest number in array
;*use return-value register to return a value*



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Data Section
section		.data

SYS_WRITE					equ		1
FD_STDOUT					equ		1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Text Section
section		.text


; Externals
extern output_array
extern libPuhfessorP_printSignedInteger64

;signed long find_largest(signed long*, long)
global find_largest
find_largest:
	
	mov rax, 0
	ret 
	
