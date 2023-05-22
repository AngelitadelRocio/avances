TITLE FIRSTPROGRAM                                                                                                TITLE FIRSTPROGRAM

DATOS SEGMENT
    ; VARIABLES
    NUM DB ?
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

; Solicitar al usuario que ingrese el numero
MOV AH, 01h    ; Funcion para leer un carácter
INT 21h        ; Leer el carácter ingresado
SUB AL, 30h    ; Convertir el caracter en valor numurico
MOV NUM, AL    ; Almacenar el número ingresado en la variable NUM

MOV CX, 9

tablaMul:
    MOV AL, NUM
    MUL CL

    AAM

    MOV BX, AX

    MOV AH, 02h
    MOV DL, 10
    INT 21h

    MOV AH, 02h
    MOV DL, 13
    INT 21h

    MOV AH, 02h
    MOV DL, NUM
    ADD DL, 30h
    INT 21h

    MOV AH, 02h
    MOV DL, 2Ah
    INT 21h

    MOV AH, 02h
    MOV DL, CL
    ADD DL, 30h
    INT 21h

    MOV AH, 02h
    MOV DL, 205
    INT 21h

    MOV AH, 02h
    MOV DL, BH
    ADD DL, 30h
    INT 21h

    MOV DL, BL
    ADD DL, 30h
    INT 21h

    MOV AH, 02h
    MOV DL, 13
    INT 21h

    LOOP tablaMul

;-------------------------

INICIO ENDP
CODIGO ENDS
END INICIO

    ; VARIABLES
    NUM1 DB ?
    NUM2 DB ?
    SUMA DB ?
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

; Solicitar al usuario que ingrese el primer numero
MOV AH, 01h    ; Funcion para leer un caracter
INT 21h        ; Leer el caracter ingresado
SUB AL, 30h    ; Convertir el caracter en valor numerico
MOV NUM1, AL   ; Almacenar el numero ingresado en la variable NUM1

; Solicitar al usuario que ingrese el segundo numero
MOV AH, 01h    ; Funcion para leer un carácter
INT 21h        ; Leer el caracter ingresado
SUB AL, 30h    ; Convertir el caracter en valor numerico
MOV NUM2, AL   ; Almacenar el numero ingresado en la variable NUM2

MOV AL, NUM1   ; Mover el primer numero a AL
ADD AL, NUM2   ; Sumar el segundo numero a AL
MOV SUMA, AL   ; Almacenar la suma en la variable SUMA

; Mostrar el resultado de la suma
ADD SUMA, 30h  ; Convertir el resultado en un caracter ASCII
MOV AH, 02h    ; Funcion para imprimir un caracter
MOV DL, SUMA   ; Cargar el resultado en DL
INT 21h        ; Imprimir el resultado

;-------------------------

INICIO ENDP
CODIGO ENDS
END INICIO
