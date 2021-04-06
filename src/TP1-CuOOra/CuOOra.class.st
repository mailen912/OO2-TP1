Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'instance creation' }
CuOOra class >> clearInstance [
	soleInstance := nil
]

{ #category : #'instance creation' }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

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
^nuevoTopico 
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarUsuarioConNombre: nombre yContraseña:contra [ 
"agrega un usuario nuevo a la coleccion de usuarios"
|nuevoUsuario|
nuevoUsuario:= Usuario nombreDeUsuario: nombre contraseña: contra.
usuarios add: nuevoUsuario .
^nuevoUsuario 

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
self initializeConDatos.
]

{ #category : #initialization }
CuOOra >> initializeConDatos [
"Para probar avance en la interfaz"
|usuario1 topicoInteres usuario2 topicoComun|
usuario2:=self agregarUsuarioConNombre: 'Lujan' yContraseña:  '3333'.
topicoComun:= self agregarTopicoConNombre: 'Java' yDescripcion:'Orientado a Objetos' .
topicoInteres := self agregarTopicoConNombre: 'Seside' yDescripcion:'Interfaz web' .
topicoInteres agregarPregunta: 'Caja' descripcion:'caja negra o caja blanca?'  usuario:usuario2.
topicoComun agregarPregunta: 'Orientacion a objetos' descripcion:'es puro?'  usuario: usuario2.
usuario1:=self agregarUsuarioConNombre: 'Mailen' yContraseña:  '1234'.
usuario1 registrarTopicoDeInteres: topicoInteres .
usuario1 seguirUsuario: usuario2 .
]

{ #category : #'as yet unclassified' }
CuOOra >> listado:usuario [ 
"devuelve el listado de las últimas 5 preguntas relevantes ordenadas según su fecha de creación. Por cada pregunta, se muestra su autor, cuántas respuestas tiene, y la cantidad de likes y dislikes
"
|preguntas|
preguntas:=(self obtenerPreguntasRelevantes: usuario) asSortedCollection:[:unaPreg :otraPreg | unaPreg fechaHora  > otraPreg fechaHora ]. 
^preguntas 
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRealizadasPor:unUsuario [
"Busca entre todos los topicos las preguntas realizadas por el usuario pasado por parametro"
^topicos flatCollect: [ :topico | topico obtenerPreguntasRealizadasPor: unUsuario  ]
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantes:usuario [
"Obtener preguntas relevantes para un usuario determinado: Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
|todas|
todas:=Set new.
todas:=usuario siguiendo flatCollect: [ :user| self obtenerPreguntasRealizadasPor: user ].
todas addAll: usuario obtenerPreguntasDeTopicosDeInteres .
^todas
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

{ #category : #'as yet unclassified' }
CuOOra >> usuarioConNombreDeUsuario: unNombre yContraseña: unaContra [
	"Retorna el usuario si esta registrado en el sistema caso contrario retorna nil"

^usuarios
		detect:
			[ :usuario | usuario nombreUsuario = unNombre & (usuario contraseña = unaContra) ]
		ifNone: [ nil ].
	
]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios

]
