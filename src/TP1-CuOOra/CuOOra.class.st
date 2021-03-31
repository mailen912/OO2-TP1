Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarPreguntaALosTopicos: topicosRelacionada titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
"A cada topico le agregar la pregunta relacionada"
	topicosRelacionada do:[	:each | each agregarPregunta: unTitulo
		descripcion: unaDescripcion
		usuario: unUsuario]

]

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopicoConNombre: nombre yDescripcion:descrip [
"agrega un topico nuevo a la coleccion de topicos"
|nuevoTopico|
nuevoTopico:= Topico nombreDeTopico: nombre descripcion:descrip. 
topicos add: nuevoTopico .
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarUsuarioConNombre: nombre yContraseña:contra [ 
"agrega un usuario nuevo a la coleccion de usuarios"
|nuevoUsuario|
nuevoUsuario:= Usuario nombreDeUsuario: nombre contraseña: contra.
usuarios add: nuevoUsuario .

]

{ #category : #'as yet unclassified' }
CuOOra >> calcularPuntaje: unUsuario [
	^ topicos sumNumbers: [ :topico | topico calcularPuntaje: unUsuario ]


]

{ #category : #ayudaParaTests }
CuOOra >> cantidadDeTopicos [
^topicos size
]

{ #category : #ayudaParaTests }
CuOOra >> cantidadDeUsuarios [
^usuarios size.
]

{ #category : #'as yet unclassified' }
CuOOra >> esMiTopico: topicosRelacionada [
	^ topicos includesAny: topicosRelacionada

]

{ #category : #initialization }
CuOOra >> initialize [ 
usuarios:= OrderedCollection new.
topicos := OrderedCollection new.
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRealizadasPor:unUsuario [
"Busca entre todos los topicos las preguntas realizadas por el usuario pasado por parametro"
^topicos flatCollect: [ :topico | topico obtenerPreguntasRealizadasPor: unUsuario  ]
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerRespuestasRealizadasPor: unUsuario [
	"Recorre todos los topicos para obtener las respuestas que realizo el usuario pasado por parametro"

	^ topicos
		flatCollect: [ :topico | topico obtenerRespuestasRealizadasPor: unUsuario ]
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos

]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios

]
