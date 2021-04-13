Class {
	#name : #ProfileComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'usuario'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
ProfileComponent class >> conUsuario:usuario [ 
^self new initializeConUsuario: usuario
]

{ #category : #initialization }
ProfileComponent >> initializeConUsuario:nombre [
usuario :=nombre.
]

{ #category : #'as yet unclassified' }
ProfileComponent >> renderContentOn: aCanvas [
  super renderContentOn: aCanvas .
	self volverAlHome:aCanvas.
	self renderPostOn:aCanvas .
]

{ #category : #rendering }
ProfileComponent >> renderDisikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceDislikeUnUsuario: (self session usuario).
	self call:(ProfileComponent conUsuario: usuario)] ;with:'dislike'
]

{ #category : #rendering }
ProfileComponent >> renderFollowButton:aCanvas [
(((self session usuario)=usuario)or:[self session usuario sigoA:usuario])ifFalse:[self seguirUsuario:aCanvas].

]

{ #category : #rendering }
ProfileComponent >> renderLikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceLikeUnUsuario: (self session usuario).
	self call:(ProfileComponent conUsuario: usuario)] ;with:'like'
]

{ #category : #'as yet unclassified' }
ProfileComponent >> renderPostOn:aCanvas [
	aCanvas heading level: 2; with: 'Preguntas de ',usuario nombreUsuario.
   self renderFollowButton: aCanvas.
	aCanvas
		unorderedList: [ (self model  obtenerPreguntasRealizadasPor: usuario )
				do: [ :preg | aCanvas text:preg titulo.
					self mostrarTopicos:aCanvas post:preg  .
					self mostrarQuienRealizoLaPregunta:aCanvas preg:preg.
					self mostrarCuantasRespuestasTiene: aCanvas preg:preg. 
					self mostrarLikesYDislikes:aCanvas post:preg.
					self renderLikeButton: aCanvas  post:preg.
					aCanvas space.
					 self renderDisikeButton: aCanvas  post:preg.
					aCanvas horizontalRule.]].
			
]

{ #category : #'as yet unclassified' }
ProfileComponent >> seguirUsuario:aCanvas [.
	aCanvas submitButton callback: [ (self session usuario) seguirUsuario: usuario ]; with: 'follow'.
	
]
