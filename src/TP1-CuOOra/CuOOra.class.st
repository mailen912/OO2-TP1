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
	^ soleInstance ifNil: [ soleInstance := self new initializeConDatos ]
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarPreguntaALosTopicos: topicosRelacionada preg:preg [
"A cada topico le agregar la pregunta relacionada"
	topicosRelacionada do:[	:each | each agregarPregunta: preg]

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

]

{ #category : #initialization }
CuOOra >> initializeConDatos [
"instanciación de prueba"
|pedro diego juan t1 t2 p1 p2 t3 t4|
pedro:=self agregarUsuarioConNombre: 'pedro@cuoora.com' yContraseña:'pedro@cuoora.com'.
diego:=self agregarUsuarioConNombre: 'diego@cuoora.com' yContraseña:'diego@cuoora.com'.
juan:=self agregarUsuarioConNombre: 'juan@cuoora.com' yContraseña:'juan@cuoora.com'.
juan seguirUsuario: diego.
pedro seguirUsuario: juan.
t1:=self agregarTopicoConNombre: 'OO1' yDescripcion: ''.
t2:=self agregarTopicoConNombre: 'OO1' yDescripcion: ''.
t3:=self agregarTopicoConNombre: 'Test de unidad' yDescripcion:''.
t4:=self agregarTopicoConNombre: 'Smalltalk' yDescripcion:''.

p1:=Pregunta newConTitulo: '¿Para qué sirve el método SetUp?'  descripcion:''  yUsuario: pedro.
p1 agregarRespuesta: 'Respuesta de Diego: Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.' creador: diego.
p2:=Pregunta newConTitulo:  '¿Qué significa #messageNotUnderstood?' descripcion:''  yUsuario:diego.
p2 agregarRespuesta: 'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.' creador:pedro .

t1 agregarPregunta: p1.
t2 agregarPregunta: p2.
t3 agregarPregunta: p1.
t4 agregarPregunta: p2.
]

{ #category : #'as yet unclassified' }
CuOOra >> listado:usuario [ 
"devuelve el listado de las últimas 5 preguntas relevantes ordenadas según su fecha de creación. Por cada pregunta, se muestra su autor, cuántas respuestas tiene, y la cantidad de likes y dislikes
"
|preguntas|
"self halt."
preguntas:=(self obtenerPreguntasRelevantes: usuario) asSortedCollection:[:unaPreg :otraPreg | unaPreg fechaHora  > otraPreg fechaHora ]. 
^preguntas 
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRealizadasPor:unUsuario [
"Busca entre todos los topicos las preguntas realizadas por el usuario pasado por parametro"
^(topicos flatCollect: [ :topico | topico obtenerPreguntasRealizadasPor: unUsuario  ])asSet.
]

{ #category : #'as yet unclassified' }
CuOOra >> obtenerPreguntasRelevantes:usuario [
"Obtener preguntas relevantes para un usuario determinado: Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
|todas|
todas:=OrderedCollection new.
todas:=usuario siguiendo flatCollect: [ :user| self obtenerPreguntasRealizadasPor: user ].
todas addAll: usuario obtenerPreguntasDeTopicosDeInteres .
^(todas asSet).
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
CuOOra >> topicosPoseenPregunta:pregunta [
"devuelve la coleccion de topicos que posee la pregunta recibida por parametro"
^(topicos select: [:topico | topico tengoPregunta: pregunta])
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
