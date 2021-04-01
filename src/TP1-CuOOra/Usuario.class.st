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

{ #category : #accessing }
Usuario >> contraseña [ 
^contraseña 
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

{ #category : #accessing }
Usuario >> nombreUsuario [ 
^nombreUsuario 
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
