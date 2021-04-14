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
	"Un usuario puede realizar un solo like o un solo dislike para una pregunta o respuesta. Si un usuario dio like a una pregunta o respuesta, y luego da un dislike, lo que sucece es que se elimina el like anterior, y se agrega el dislike"

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
	"Un usuario puede realizar un solo like para una pregunta o respuesta.Si un usuario dio dislike a una pregunta o respuesta, y luego da un like, lo que sucece es que se elimina el dislike anterior, y se agrega el like"

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

{ #category : #public }
Post >> puntaje [
"devuelve el puntaje  de la respuesta, el cual esta dado por la diferencia entre likes y dislikes"
^(self cantidadDeLikes) -(self cantidadDeDislikes ) 
]

{ #category : #public }
Post >> yoLaRealize: unUsuario [
	^ creador = unUsuario

]
