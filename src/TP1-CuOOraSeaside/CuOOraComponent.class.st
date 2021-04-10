Class {
	#name : #CuOOraComponent,
	#superclass : #WAComponent,
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
CuOOraComponent >> getOut [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarCuantasRespuestasTiene:aCanvas preg:pregunta [
aCanvas text:' | ' ,(pregunta respuestas size)asString ,' repuestas'
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarLikesYDislikes: aCanvas preg:preg [
aCanvas paragraph:[aCanvas text: (preg cantidadDeLikes) asString, ' likes   |   ', (preg cantidadDeDislikes) asString,' dislikes'] 
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarQuienRealizoLaPregunta:aCanvas preg:preg [
aCanvas paragraph: [ aCanvas text:'Realizada por '.aCanvas anchor callback: [ self call:(ProfileComponent conUsuario:(preg creador ))];
	                                                                          with:(preg creador nombreUsuario)].
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> mostrarTopicos:aCanvas preg:preg [
aCanvas break.
aCanvas text:'Topicos:'.
					aCanvas unorderedList:[ ((CuOOra soleInstance ) topicosPoseenPregunta: preg)do:[:topico| aCanvas text: topico nombreTopico,','. ] ]
]

{ #category : #'as yet unclassified' }
CuOOraComponent >> renderContentOn: aCanvas [
self subclassResponsibility 
]
