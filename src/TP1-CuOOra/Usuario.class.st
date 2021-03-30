Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'nombreUsuario',
		'contraseña',
		'fechaYhoraCreacion',
		'siguiendo',
		'topicosDeInteres'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
Usuario class >> nombreDeUsuario:nombre contraseña: password [ 
^self new nombreDeUsuario: nombre contraseña:password . 
]

{ #category : #'as yet unclassified' }
Usuario >> cantidadTopicosDeInteres [
^topicosDeInteres size
]

{ #category : #initialization }
Usuario >> nombreDeUsuario:nombre contraseña: password [ 
"inicializa los valores de un usuario"
nombreUsuario :=nombre.
contraseña :=password .
fechaYhoraCreacion := DateAndTime now.
siguiendo :=OrderedCollection new.
topicosDeInteres:= OrderedCollection new.

]

{ #category : #'as yet unclassified' }
Usuario >> registrarTopicoDeInteres:topico [ 
"se agrega el topico a la coleccion de topicos de interes del usuario"
topicosDeInteres add: topico 
]

{ #category : #'as yet unclassified' }
Usuario >> seguirUsuario: unUsuario [
	siguiendo add: unUsuario

]
