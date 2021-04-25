Class {
	#name : #CuOOraComponent,
	#superclass : #WAComponent,
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
CuOOraComponent >> crearClase [ 
^(self subclassResponsibility )
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> getOut [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #accessing }
CuOOraComponent >> model [
^CuOOra soleInstance .
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarCuantasRespuestasTiene:aCanvas preg:pregunta [
aCanvas text:' | ' ,(pregunta respuestas size)asString ,' repuestas'
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarLikesYDislikes: aCanvas post:post [
aCanvas paragraph:[aCanvas text: (post cantidadDeLikes) asString, ' likes   |   ', (post cantidadDeDislikes) asString,' dislikes'] 
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarQuienRealizoLaPregunta:aCanvas preg:preg [
aCanvas paragraph: [ aCanvas text:'Realizada por '.aCanvas anchor callback: [ self call:(ProfileComponent conUsuario:(preg creador ))];
	                                                                          with:(preg creador nombreUsuario)].
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarTopicos:aCanvas post:post [
aCanvas break.
aCanvas text:'Topicos:'.
					aCanvas unorderedList:[ ((CuOOra soleInstance ) topicosPoseenPregunta: post)do:[:topico| aCanvas text: topico nombreTopico,','. ] ]
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> renderContentOn: aCanvas [
aCanvas heading level:1; with:'CuOOra '.
aCanvas anchor callback:[self call:(ProfileComponent conUsuario: (self session usuario))];with:self session usuario nombreUsuario .	
aCanvas paragraph: [ aCanvas anchor callback: [ self getOut ];with: 'Log Out' ].
aCanvas horizontalRule.

]

{ #category : #rendering }
CuOOraComponent >> renderDisikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceDislikeUnUsuario: (self session usuario)];with:'dislike'
]

{ #category : #rendering }
CuOOraComponent >> renderLikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceLikeUnUsuario: (self session usuario)];with:'like'
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> volverAlHome:aCanvas [
aCanvas paragraph: [ aCanvas anchor callback: [ self call:(HomeComponent new) ];with: 'Volver al Home' ].
]
