Class {
	#name : #QuestionInformationComponent,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
QuestionInformationComponent class >> dePregunta:pregunta [
^self new initializeConPregunta:pregunta 
]

{ #category : #'as yet unclassified' }
QuestionInformationComponent >> getOut [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #initialization }
QuestionInformationComponent >> initializeConPregunta:preg [ 
pregunta :=preg.
]

{ #category : #rendering }
QuestionInformationComponent >> renderAnswerOn:aCanvas [ 
aCanvas horizontalRule .
aCanvas unorderedList: [ pregunta obtenerRespuestasOrdenadasPorPuntaje
				do: [ :resp | aCanvas text:'Respuesta de '.
					aCanvas strong with:( resp creador nombreUsuario).
				aCanvas paragraph: [ aCanvas text:resp texto.
				aCanvas paragraph:[aCanvas text: (pregunta cantidadDeLikes) asString, ' likes   |   ', (pregunta cantidadDeDislikes) asString,' dislikes']]]].
	aCanvas horizontalRule .
	aCanvas text:'No hay mas respuestas'

]

{ #category : #rendering }
QuestionInformationComponent >> renderContentOn:aCanvas [
aCanvas big:[aCanvas strong with: 'CuOOra'];space.	
	aCanvas space;text:self session usuario nombreUsuario.
	aCanvas paragraph: [ aCanvas anchor callback: [ self getOut ];with: 'Log Out' ].
	aCanvas horizontalRule.
   self renderPostsOn: aCanvas.
]

{ #category : #rendering }
QuestionInformationComponent >> renderPostsOn: aCanvas [
aCanvas text: pregunta titulo.
aCanvas text:'Topicos:'.
aCanvas unorderedList:[ ((CuOOra soleInstance ) topicosPoseenPregunta: pregunta)do:[:topico| aCanvas text: topico nombreTopico,',' ] ]  .
					aCanvas paragraph: [ aCanvas text:'Realizada por '.
					aCanvas strong with:(pregunta creador nombreUsuario).aCanvas text:' | ' ,(pregunta respuestas size)asString ,' repuestas'.
					aCanvas paragraph:[aCanvas text: (pregunta cantidadDeLikes) asString, ' likes   |   ', (pregunta cantidadDeDislikes) asString,' dislikes']].
self renderAnswerOn:aCanvas.
]
