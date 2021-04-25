Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'fechaHora',
		'creador',
		'likes',
		'dislikes'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'instance creation' }
Post class >> newConCreador: usuario [
	self new initializeConCreador: usuario

]

{ #category : #ayudaTests }
Post >> cantidadDeDislikes [
^dislikes size
]

{ #category : #ayudaTests }
Post >> cantidadDeLikes [
^likes size
]

{ #category : #accessing }
Post >> creador [
^creador
]

{ #category : #accessing }
Post >> fechaHora [
"devuelve la fecha y hora de creacion de la pregunta"
^fechaHora 
]

{ #category : #public }
Post >> haceDislikeUnUsuario: usuariox [
		self reaccionaCon:dislikes y:likes unUsuario:usuariox.
		
]

{ #category : #public }
Post >> haceLikeUnUsuario: usuariox [

				self reaccionaCon:likes y:dislikes unUsuario:usuariox.
		
]

{ #category : #initialization }
Post >> initializeConCreador: usuario [
	creador := usuario.
	fechaHora := DateAndTime now.
	likes  := OrderedCollection new.
	dislikes  := OrderedCollection new.

]

{ #category : #public }
Post >> puntaje [
"devuelve el puntaje  de la respuesta, el cual esta dado por la diferencia entre likes y dislikes"
^(self cantidadDeLikes) -(self cantidadDeDislikes ) 
]

{ #category : #private }
Post >> reaccionaCon: reacciones y: antireacciones unUsuario: usuariox [
	| nuevaReaccion antireaccion |
	(reacciones anySatisfy: [ :reaccion | reaccion perteneceAlUsuario: usuariox ])
		ifTrue: [ ^ self ].
	nuevaReaccion := Reaccion delUsuario: usuariox.
	reacciones add: nuevaReaccion.
	antireaccion := antireacciones
		detect: [ :anti | anti perteneceAlUsuario: usuariox ]
		ifNone: [ nil ].
	antireaccion ifNotNil: [ antireacciones remove: antireaccion ]
]

{ #category : #public }
Post >> yoLaRealize: unUsuario [
	^ creador = unUsuario

]
