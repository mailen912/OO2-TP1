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

{ #category : #'as yet unclassified' }
ProfileComponent >> crearClase [ 
^(self class conUsuario:usuario )
]

{ #category : #'as yet unclassified' }
ProfileComponent >> followUser:aCanvas [.
aCanvas anchor callback: [ ((self session usuario)seguirUsuario: usuario).
	self call:(ProfileComponent conUsuario: usuario)] ;with:'seguir'
	
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
ProfileComponent >> renderFollowButton:aCanvas [
(((self session usuario)=usuario)or:[(self session usuario) sigoA:usuario])ifFalse:[self followUser: aCanvas ].

]

{ #category : #'as yet unclassified' }
ProfileComponent >> renderPostOn:aCanvas [
"Muestra las preguntas realizadas por el usuario que se recibio anteriormente, con su informacion"
	aCanvas heading level: 2; with: 'Preguntas de ',usuario nombreUsuario.
   self renderFollowButton: aCanvas.
	aCanvas
		unorderedList: [ (self model  obtenerPreguntasRealizadasPor: usuario )
				do: [ :preg | aCanvas anchor callback: [ self call:(QuestionInformationComponent dePregunta: preg)] ;with: preg titulo.
					self mostrarTopicos:aCanvas post:preg  .
					self mostrarCuantasRespuestasTiene: aCanvas preg:preg. 
					self mostrarLikesYDislikes:aCanvas post:preg.
					self renderLikeButton: aCanvas  post:preg.
					aCanvas space.
					 self renderDisikeButton: aCanvas  post:preg.
					aCanvas horizontalRule.]].
			
]
