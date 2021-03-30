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

{ #category : #'as yet unclassified' }
Topico >> agregarPregunta: unTitulo descripcion: unaDescripcion usuario: unUsuario [
"agrega una pregunta a la coleccion de preguntas del topico"
	| nuevaPregunta |
	nuevaPregunta := Pregunta
		newConTitulo: unTitulo
		descripcion: unaDescripcion
		yUsuario: unUsuario.
	preguntas add: nuevaPregunta

]

{ #category : #'as yet unclassified' }
Topico >> borrarPregunta: unaPregunta [
	"Elimina del sistema la pregunta y todas sus respuestas"
  unaPregunta eliminarRespuestas .

	preguntas remove: unaPregunta

]

{ #category : #'as yet unclassified' }
Topico >> calcularPuntaje: unUsuario [
	"Se indica un usuario, y se retorna un puntaje que se calcula en función de su actividad en la red social. Por cada pregunta realizada, suma 20 puntos, y por cada respuesta a una pregunta que realizó otro usuario, suma 50 puntos. Además, se suma puntaje determinado por la diferencia entre likes y dislikes de todas sus participaciones, que de tener mas dislikes que likes, puede ser negativo"

	| susPreguntas preguntasDeOtros susRespuestas puntajePreguntas puntajeRespuestas |
	susPreguntas := self obtenerPreguntasRealizadasPor: unUsuario.
	preguntasDeOtros := self obtenerPreguntasDeOtrosUsuarios: unUsuario.
	susRespuestas := (preguntasDeOtros
		flatCollect: [ :preg | preg obtenerRespuestasPor: unUsuario ]) size.
	puntajePreguntas := susPreguntas sumNumbers: [ :preg | preg puntaje ].
	puntajeRespuestas := (self obtenerRespuestasRealizadasPor: unUsuario)
		sumNumbers: [ :res | res puntaje ].
	^ susPreguntas size * 20 + (susRespuestas * 50) + puntajePreguntas
		+ puntajeRespuestas


]

{ #category : #initialization }
Topico >> nombreDeTopico:topico descripcion:descrip [
"inicializa un topico"
nombreTopico :=topico.
descripcion:=descrip . 
preguntas :=OrderedCollection new.
]

{ #category : #'as yet unclassified' }
Topico >> obtenerPreguntasDeOtrosUsuarios: unUsuario [
	"Retorna una coleccion de preguntas que no realizo el usuario pasado por parametro"

	^ preguntas reject: [ :pregunta | pregunta yoLaRealize: unUsuario ]

]

{ #category : #'as yet unclassified' }
Topico >> obtenerPreguntasRealizadasPor: unUsuario [
	"Retorna una colección de preguntas en las que coincide el creador con el usuario pasado por parametro"

	^ preguntas select: [ :pregunta | pregunta yoLaRealize: unUsuario ]

]

{ #category : #'as yet unclassified' }
Topico >> obtenerRespuestasRealizadasPor: unUsuario [
	"Recorre todas sus preguntas,le delega la responsabilidad a cada una de ellas de obtener una coleccion de respuestas en las que coincida el parametro con el creador y retorna esa coleccion "

	^ preguntas
		flatCollect: [ :pregunta | pregunta obtenerRespuestasPor: unUsuario ]

]

{ #category : #'as yet unclassified' }
Topico >> obtenerTodasLasPreguntas [
	"Retornar todas las preguntas que se realizaron relacionadas a ese tópico"
	^ preguntas

]
