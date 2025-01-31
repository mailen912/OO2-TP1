Class {
	#name : #AnsweringComponent,
	#superclass : #CuOOraComponent,
	#instVars : [
		'desarrollo',
		'pregunta'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
AnsweringComponent class >> dePregunta: preg [
^self new initializeConPregunta:preg
]

{ #category : #rendering }
AnsweringComponent >> cancelar [
self answer 
]

{ #category : #'as yet unclassified' }
AnsweringComponent >> crearClase [ 
^(self class dePregunta: pregunta )
]

{ #category : #accessing }
AnsweringComponent >> desarrollo [ 
^desarrollo 
]

{ #category : #accessing }
AnsweringComponent >> desarrollo:desa [
desarrollo:=desa
]

{ #category : #initialization }
AnsweringComponent >> initializeConPregunta:preg [
super initialize.
pregunta :=preg
]

{ #category : #rendering }
AnsweringComponent >> renderAnswerQuestion:aCanvas [.
"muestra el formulario para realizar una respuesta"
	aCanvas label: 'RESPONDER:';break.
	(aCanvas textArea on: #desarrollo of: self) columns: 80; rows: 5.
	aCanvas break.
   aCanvas submitButton callback: [ self cancelar ];with: 'Cancelar' .
   aCanvas submitButton callback: [ self responder ];with: 'Guardar' .
	
]

{ #category : #'as yet unclassified' }
AnsweringComponent >> renderContentOn: aCanvas [
   super renderContentOn: aCanvas.
    self renderPostsOn:aCanvas .
	aCanvas
		form: [ self renderAnswerQuestion:aCanvas.]
]

{ #category : #rendering }
AnsweringComponent >> renderPostsOn: aCanvas [
"muestra la informacion de una pregunta elegida pero sin sus respuestas"
aCanvas text: pregunta titulo.
aCanvas text:'Topicos:'.
aCanvas unorderedList:[ self mostrarTopicos: aCanvas post: pregunta]  .
					aCanvas paragraph: [ self mostrarQuienRealizoLaPregunta: aCanvas preg:pregunta.
					self mostrarCuantasRespuestasTiene:aCanvas preg:pregunta .
					self mostrarLikesYDislikes: aCanvas post:pregunta .
					self renderLikeButton: aCanvas  post:pregunta.
					aCanvas space.
				   self renderDisikeButton: aCanvas  post:pregunta ].
]

{ #category : #'as yet unclassified' }
AnsweringComponent >> responder [
pregunta agregarRespuesta: desarrollo  creador:(self session usuario ). 
self answer 
]
