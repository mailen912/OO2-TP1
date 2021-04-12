Class {
	#name : #Reaccion,
	#superclass : #Object,
	#instVars : [
		'fechaYHora',
		'usuario'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
Reaccion class >> delUsuario:usuariox [
^self new initializeConUsuario:usuariox
]

{ #category : #initialization }
Reaccion >> initializeConUsuario:usuariox [
"se inicializan los valores de una reaccion"
usuario :=usuariox.
fechaYHora :=DateAndTime now
]

{ #category : #public }
Reaccion >> perteneceAlUsuario: usuariox [ 
"verifica si el usuario que le llega como parametro es el mismo que tiene guardado"
^(usuario = usuariox)
]
