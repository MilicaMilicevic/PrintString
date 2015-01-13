;Write code that will string from location string write on stdout - letter to letter.Use glibc.

SECTION .data
string	db	'String'
string_lenght	equ	$-string

SECTION	.bss
tmp	resb	3 ;first-char,second-10,last-0 (respectivily) (IMPORTANT)

SECTION	.text

%macro	print	1
  push	%1
  call printf
  add	esp,4
%endmacro

global main
extern	printf
main:

;store values of registers
PUSH	EBP
MOV	EBP,ESP
PUSH	EBX
PUSH	ESI
PUSH	EDI

mov esi,string
mov ecx,string_lenght
mov byte[tmp+1],10
mov byte[tmp+2],0

iterate:
      lodsb ;what is in [esi] load in al
      mov [tmp],al
      push ecx
      print tmp
      pop ecx
      loop iterate

;load values of registers
POP	EDI
POP	ESI
POP	EBX
MOV	ESP,EBP
POP	EBP

RET




