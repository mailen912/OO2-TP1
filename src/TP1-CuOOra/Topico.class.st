Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombreTopico',
		'descripcion',
		'preguntas'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
Topico class >> nombreDeTopico:topico descripcion:descrip [
^self new nombreDeTopico:topico descripcion:descrip
]

{ #category : #public }
Topico >> agregarPregunta: nuevaPregunta [
"agrega una pregunta a la coleccion de preguntas"
preguntas add: nuevaPregunta. 

]

{ #category : #public }
Topico >> borrarPregunta: unaPregunta [
	"Elimina del sistema la pregunta y todas sus respuestas"
	(self tengoPregunta: unaPregunta )ifTrue: [ unaPregunta eliminarRespuestas .
	                                            preguntas remove: unaPregunta].
]

{ #category : #initialization }
Topico >> nombreDeTopico:topico descripcion:descrip [
"inicializa un topico"
nombreTopico :=topico.
descripcion:=descrip . 
preguntas :=OrderedCollection new. 
]

{ #category : #accessing }
Topico >> nombreTopico [
^nombreTopico  
]

{ #category : #'as yet unclassified' }
Topico >> obtenerPreguntasDeOtros:unUsuario [
^preguntas reject: [ :pregunta | pregunta yoLaRealize: unUsuario ]  

]

{ #category : #public }
Topico >> obtenerPreguntasRealizadasPor: unUsuario [
	"Retorna una colección de preguntas en las que coincide el creador con el usuario pasado por parametro"

	^ preguntas select: [ :pregunta | pregunta yoLaRealize: unUsuario ]  

]

{ #category : #public }
Topico >> obtenerRespuestasRealizadasPor: unUsuario [
	"Recorre todas sus preguntas,le delega la responsabilidad a cada una de ellas de obtener una coleccion de respuestas en las que coincida el parametro con el creador y retorna esa coleccion "

	^ preguntas
		flatCollect:  [ :pregunta | pregunta obtenerRespuestasPor: unUsuario ] 
		
]

{ #category : #public }
Topico >> obtenerTodasLasPreguntas [
	"Retornar todas las preguntas que se realizaron relacionadas a ese tópico"
	^ preguntas 

]

{ #category : #public }
Topico >> tengoPregunta:pregunta [
"devuelve un boolean indicando si tiene o no la pregunta que recibe como parametro"
^preguntas includes: pregunta . 
]
