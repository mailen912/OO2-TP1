Class {
	#name : #Respuesta,
	#superclass : #Post,
	#instVars : [
		'texto'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
Respuesta class >> conTexto: unTexto yCreador: creator [
^self new initializeConTexto: unTexto yCreador: creator
]

{ #category : #initialization }
Respuesta >> initializeConTexto: unTexto yCreador: creator [
self initializeConCreador: creator.
	texto := unTexto

]

{ #category : #accessing }
Respuesta >> texto [
	^ texto

]
