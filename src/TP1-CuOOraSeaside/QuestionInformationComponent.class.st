Class {
	#name : #QuestionInformationComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
QuestionInformationComponent class >> dePregunta:pregunta [
^self new initializeConPregunta:pregunta 
]

{ #category : #initialization }
QuestionInformationComponent >> initializeConPregunta:preg [ 
pregunta :=preg.
]

{ #category : #rendering }
QuestionInformationComponent >> renderAnswerOn:aCanvas [ 
aCanvas horizontalRule .
aCanvas unorderedList: [ pregunta obtenerRespuestasOrdenadasPorPuntaje
				do: [ :resp | self mostrarQuienRealizoLaPregunta: aCanvas  preg:resp  .
				aCanvas paragraph: [ aCanvas text:resp texto.
				self mostrarLikesYDislikes: aCanvas post:resp.
				self renderLikeButton: aCanvas  post:resp.
				aCanvas space.
				self renderDisikeButton: aCanvas  post:resp.  
				  aCanvas horizontalRule .]]].
	aCanvas horizontalRule .
	aCanvas text:'No hay mas respuestas'.
	aCanvas paragraph: [ aCanvas anchor callback: [ self call:(AnsweringComponent dePregunta: pregunta)  ];with: 'Hacer una nueva respuesta' ].

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
					aCanvas paragraph: [ self mostrarQuienRealizoLaPregunta: aCanvas preg:pregunta.
					self mostrarCuantasRespuestasTiene:aCanvas preg:pregunta .
					self mostrarLikesYDislikes: aCanvas post:pregunta ].
self renderAnswerOn:aCanvas.
]
