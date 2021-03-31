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

  cuoora agregarTopicoConNombre: 'Smalltalk' yDescripcion: 'orientado a objetos'.
self assert: cuoora cantidadDeTopicos  equals: 1.
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
