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
	"puede hacer uno solo(no debe estar en la coleccion dislikes) y
 si antes hizo like (si esta en likes) lo debo eliminar"

	(dislikes anySatisfy: [ :mg | mg perteneceAlUsuario: usuariox ])
		ifFalse: [ | nuevoDislike reaccion |
			nuevoDislike := Reaccion delUsuario: usuariox.
			dislikes add: nuevoDislike.
			reaccion := likes
				detect: [ :like | like perteneceAlUsuario: usuariox ]
				ifNone: [ nil ].
			reaccion ifNotNil: [ likes remove: reaccion ] ]
]

{ #category : #public }
Post >> haceLikeUnUsuario: usuariox [
	"puede hacer un solo(no debe estar en la coleccion like)
 no puede hacerlo si ya hizo dislike(si esta en dislike lo debo eliminar"

	(likes anySatisfy: [ :mg | mg perteneceAlUsuario: usuariox ])
		ifFalse: [ | nuevoLike reaccion |
			nuevoLike := Reaccion delUsuario: usuariox.
			likes add: nuevoLike.
			reaccion := dislikes
				detect: [ :dislike | dislike perteneceAlUsuario: usuariox ]
				ifNone: [ nil ].
			reaccion ifNotNil:[ dislikes remove: reaccion ] ]
]

{ #category : #initialization }
Post >> initializeConCreador: usuario [
	creador := usuario.
	fechaHora := DateAndTime now.
	likes  := OrderedCollection new.
	dislikes  := OrderedCollection new.

]

{ #category : #private }
Post >> puntaje [
"devuelve el puntaje  de la respuesta, el cual esta dado por la diferencia entre likes y dislikes"
^(self cantidadDeLikes) -(self cantidadDeDislikes ) 
]

{ #category : #public }
Post >> yoLaRealize: unUsuario [
	^ creador = unUsuario

]
