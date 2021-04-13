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

{ #category : #public }
Usuario >> obtenerPreguntasDeTopicosDeInteres [
"Devuelve una coleccion de todas las preguntas de todos los topicos de interes del usuario"
^topicosDeInteres flatCollect: [ :topi|topi obtenerTodasLasPreguntas ]
]

{ #category : #public }
Usuario >> registrarTopicoDeInteres:topico [ 
"Se agrega el topico a la coleccion de topicos de interes del usuario"
topicosDeInteres detect: [ :t | t = topico ] ifNone: [topicosDeInteres add: topico ]
]

{ #category : #public }
Usuario >> seguirUsuario: unUsuario [
siguiendo detect: [ :s | s=unUsuario  ] ifNone: [ siguiendo add: unUsuario].

]

{ #category : #public }
Usuario >> sigoA:usuario [ 
^siguiendo includes: usuario.
]

{ #category : #accessing }
Usuario >> siguiendo [
"devuelve una coleccion de todos los usuarios a los que sigue"
^siguiendo 
]

{ #category : #accessing }
Usuario >> topicosDeInteres [
^topicosDeInteres 
]
