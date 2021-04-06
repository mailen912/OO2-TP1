"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'InicioSesion'.
application sessionClass: SessionWithUser.
"
Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #accessing }
SessionWithUser >> usuario [
^usuario 
]

{ #category : #accessing }
SessionWithUser >> usuario:unUsuario [
usuario:=unUsuario 
]
