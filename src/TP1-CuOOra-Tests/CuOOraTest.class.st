"
A CuOOraTest is a test class for testing the behavior of CuOOra
"
Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
cuoora:= CuOOra new.
]

{ #category : #tests }
CuOOraTest >> testAgregarTopicoConNombreyDescripcion [
	self assert: cuoora cantidadDeTopicos equals: 0.
	cuoora
		agregarTopicoConNombre: 'Smalltalk'
		yDescripcion: 'orientado a objetos'.
	self assert: cuoora cantidadDeTopicos equals: 1
]

{ #category : #tests }
CuOOraTest >> testAgregarUsuarioConNombreyContraseña [ 
self assert: cuoora cantidadDeUsuarios equals: 0.

  cuoora agregarUsuarioConNombre: 'usuario232' yContraseña: '1231'.
self assert: cuoora cantidadDeUsuarios equals: 1.
]

{ #category : #tests }
CuOOraTest >> testCalcularPuntaje [
	| usuario usuarioX |
	usuarioX := Usuario nombreDeUsuario: 'usuario345' contraseña: '678'.
	cuoora
		agregarUsuarioConNombre: 'usuario232' yContraseña: '1231';
		agregarTopicoConNombre: 'Smalltalk'
			yDescripcion: 'orientado a objetos';
		agregarTopicoConNombre: 'Pharo'
			yDescripcion: 'orientacion a objetos 1'.
	usuario := cuoora usuarios first.
	self assert: (cuoora calcularPuntaje: usuario) equals: 0.
	"No realizo ninguna pregunta/respuesta, ni le dio like/dislike a ninguna pregunta/respuesta"
	cuoora topicos first
		agregarPregunta: 'Pregunta 1'
			descripcion: 'Descripcion 1'
			usuario: usuario;
		agregarPregunta: 'Pregunta 2'
			descripcion: 'Descripcion 2'
			usuario: usuario.
	cuoora topicos last
		agregarPregunta: 'Pregunta 3'
		descripcion: 'Descripcion 3'
		usuario: usuarioX.
	self assert: (cuoora calcularPuntaje: usuario) equals: 40.
	"Realizo dos preguntas (20* cada pregunta realizada)"
	cuoora topicos last obtenerTodasLasPreguntas first
		agregarRespuesta: 'Res 1'
		creador: usuario.
	self assert: (cuoora calcularPuntaje: usuario) equals: 40 + 50.
	"Realizo una respuesta a una pregunta que realizó otro usuario (50 * c/preg)"
	cuoora topicos first obtenerTodasLasPreguntas first
		haceLikeUnUsuario: usuario.	"Pregunta 1"
	cuoora topicos first obtenerTodasLasPreguntas last
		haceDislikeUnUsuario: usuario.	"Pregunta 2"
	cuoora topicos last obtenerTodasLasPreguntas first respuestas first
		haceLikeUnUsuario: usuario.	"Res 1"
	"self halt."
	self
		assert: (cuoora calcularPuntaje: usuario)
		equals: 40 + 50 + (1 - 1) + (0 - 0) + (0 - 0) + (1 - 0)
	"Realizo en el primer topico un like y un dislike a dos preguntas(1-1),las respuestas no tuvieron like/dislike (0-0).
		En el segunto topico no dio like/dislike a ninguna pregunta (0-0)y le dio like a una respuesta (1-0)"

]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasRealizadasPor [ 
|usuario|
usuario:=Usuario nombreDeUsuario: 'xyz' contraseña:'clave123'. 
"El usuario no realizo preguntas"
self assert: (cuoora obtenerPreguntasRealizadasPor: usuario)size equals:0.
	cuoora
		agregarTopicoConNombre: 'Smalltalk'
			yDescripcion: 'orientado a objetos';
		agregarTopicoConNombre: 'Pharo'
			yDescripcion: 'orientacion a objetos 1'.
			cuoora topicos first agregarPregunta: 'Pregunta 1' descripcion: 'Descripcion 1' usuario: usuario.
				cuoora topicos last agregarPregunta: 'Pregunta 2' descripcion: 'Descripcion 2' usuario: usuario.
				"El usuario realizo dos preguntas"
				self assert: (cuoora obtenerPreguntasRealizadasPor: usuario)size equals:2.
]

{ #category : #tests }
CuOOraTest >> testObtenerPreguntasRelevantes [
"Obtener preguntas relevantes para un usuario determinado: Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión o bien cuando fue realizada por alguno de los usuarios que sigue en la red social."
|topico1 topico2 topico3 usuario usuario1 usuario2 usuario3 usuario4 usuario5 usuario6 preg|
usuario := Usuario nombreDeUsuario: 'cero' contraseña: 'hhhhh32'.
usuario1 := Usuario nombreDeUsuario: 'uno' contraseña: '232da'.
usuario2 := Usuario nombreDeUsuario: 'dos' contraseña: '23wa'.
usuario3 := Usuario nombreDeUsuario: 'tres' contraseña: '237a'.
usuario4 := Usuario nombreDeUsuario: 'cuatro' contraseña: '2532da'.
usuario5 := Usuario nombreDeUsuario: 'cinco' contraseña: '2532da'.
usuario6 := Usuario nombreDeUsuario: 'seis' contraseña: '23bj'.

topico1:=cuoora agregarTopicoConNombre:'SMALLTALK'  yDescripcion:  'OO2'.
topico2:=cuoora agregarTopicoConNombre:'JAVA'  yDescripcion: 'Taller de programacion'.
topico3:=cuoora agregarTopicoConNombre:'Python'  yDescripcion: 'multiparadigma'.

preg:=(topico1 agregarPregunta: 'Nueva' descripcion: 'cual?' usuario: usuario1).
topico1 agregarPregunta: 'Vieja' descripcion: 'por que?' usuario: usuario2.
topico2 agregarPregunta: 'Nueva' descripcion: 'cual?' usuario: usuario3.
topico2 agregarPregunta: 'Vieja' descripcion: 'por que?' usuario: usuario4.
topico3 agregarPregunta: 'Actual' descripcion: 'Es facil?' usuario: usuario5.
topico3 agregarPregunta: 'Version' descripcion: 'Cual es la version actual?' usuario: usuario6.
usuario registrarTopicoDeInteres: topico1 .
usuario registrarTopicoDeInteres: topico2 .
usuario seguirUsuario: usuario5 .
usuario seguirUsuario: usuario6 .
self assert:((cuoora obtenerPreguntasRelevantes: usuario)size=6) equals: true.
self assert:((cuoora obtenerPreguntasRelevantes: usuario) includes: preg) equals: true.

]

{ #category : #tests }
CuOOraTest >> testObtenerRespuestasRealizadasPor [
	| usuario |
	usuario := Usuario nombreDeUsuario: 'xyz' contraseña: 'clave123'.
	"El usuario no respondio a ninguna pregunta"
	self
		assert: (cuoora obtenerPreguntasRealizadasPor: usuario) size
		equals: 0.
	cuoora
		agregarTopicoConNombre: 'Smalltalk'
			yDescripcion: 'orientado a objetos';
		agregarTopicoConNombre: 'Pharo'
			yDescripcion: 'orientacion a objetos 1'.
	cuoora topicos first
		agregarPregunta: 'Pregunta 1'
		descripcion: 'Descripcion 1'
		usuario: usuario.
	cuoora topicos first obtenerTodasLasPreguntas first
		agregarRespuesta: 'Res 1'
		creador: usuario.
	cuoora topicos last
		agregarPregunta: 'Pregunta 2'
		descripcion: 'Descripcion 2'
		usuario: usuario.
	cuoora topicos first obtenerTodasLasPreguntas first
		agregarRespuesta: 'Res 2'
		creador: usuario.
	"El usuario respondio a dos preguntas de dos topicos diferentes"
	self
		assert: (cuoora obtenerRespuestasRealizadasPor: usuario) size
		equals: 2.
		self assert: (cuoora obtenerRespuestasRealizadasPor: usuario) first texto
		equals: 'Res 1'.
]
