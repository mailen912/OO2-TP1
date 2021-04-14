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

{ #category : #'as yet unclassified' }
QuestionInformationComponent >> crearClase [ 
^(self class dePregunta: pregunta )
]

{ #category : #initialization }
QuestionInformationComponent >> initializeConPregunta:preg [ 
pregunta :=preg.
]

{ #category : #rendering }
QuestionInformationComponent >> renderAnswerOn:aCanvas [ 
"muestra las respuestas de una pregunta elegida"
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
   super renderContentOn: aCanvas.
   self volverAlHome: aCanvas.
   self renderPostsOn: aCanvas.
]

{ #category : #rendering }
QuestionInformationComponent >> renderPostsOn: aCanvas [
"Muestra la informacion de una pregunta elegida"
aCanvas text: pregunta titulo.
aCanvas unorderedList:[ self mostrarTopicos: aCanvas post:pregunta ]  .
					aCanvas paragraph: [ self mostrarQuienRealizoLaPregunta: aCanvas preg:pregunta.
					self mostrarCuantasRespuestasTiene:aCanvas preg:pregunta .
					self mostrarLikesYDislikes: aCanvas post:pregunta.
					self renderLikeButton: aCanvas  post:pregunta.
				aCanvas space.
				self renderDisikeButton: aCanvas  post:pregunta.  ].
self renderAnswerOn:aCanvas.
]
