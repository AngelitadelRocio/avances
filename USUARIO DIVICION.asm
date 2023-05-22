TITLE FIRSTPROGRAM

DATOS SEGMENT
    ; VARIABLES
    DIVIDENDO DB ?  
    
    DIVISOR DB ?
    
    COCIENTE DB ?
    
    RESIDUO DB ?
DATOS ENDS

PILA SEGMENT
    DB 64 DUP(0)
PILA ENDS

CODIGO SEGMENT

INICIO PROC FAR

ASSUME DS:DATOS, CS:CODIGO, SS:PILA

PUSH DS

MOV AX, 0
PUSH AX

MOV AX, DATOS
MOV DS, AX
MOV ES, AX

; CODIGO DE NUESTRO PROGRAMA ----------------------

; Solicitar al usuario que ingrese el dividendo
MOV AH, 01h    ; Funcion para leer un caracter
INT 21h        ; Leer el caracter ingresado
SUB AL, 30h    ; Convertir el caracter en valor numerico
MOV DIVIDENDO, AL    ; Almacenar el numero ingresado en la variable DIVIDENDO

; Solicitar al usuario que ingrese el divisor
MOV AH, 01h    ; Funcion para leer un caracter
INT 21h        ; Leer el caracter ingresado
SUB AL, 30h    ; Convertir el caracter en valor numerico
MOV DIVISOR, AL    ; Almacenar el numero ingresado en la variable DIVISOR

MOV AL, DIVIDENDO   ; Mover el dividendo a AL
MOV AH, 0          ; Limpiar el registro AH
CBW                ; Extender el signo de AL a AX

MOV BL, DIVISOR    ; Mover el divisor a BL
MOV BH, 0          ; Limpiar el registro BH

DIV BL             ; Dividir AX por el divisor (BL)
MOV COCIENTE, AL   ; Almacenar el cociente en la variable COCIENTE
MOV RESIDUO, AH    ; Almacenar el residuo en la variable RESIDUO
      
; Mostrar el cociente
ADD COCIENTE, 30h  ; Convertir el cociente en un carácter ASCII
MOV AH, 02h       ; Funcion para imprimir un caracter
MOV DL, COCIENTE   ; Cargar el cociente en DL
INT 21h           ; Imprimir el cociente


;-------------------------

INICIO ENDP
CODIGO ENDS
END INICIO
