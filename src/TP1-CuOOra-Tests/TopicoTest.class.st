"
A TopicoTest is a test class for testing the behavior of Topico
"
Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topico1',
		'usuario'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
TopicoTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
 topico1 := Topico
		nombreDeTopico: 'Smalltalk'
		descripcion: 'orientacion a objetos'.
	usuario := Usuario nombreDeUsuario: 'usuario1' contraseña: 'clave123'

]

{ #category : #tests }
TopicoTest >> testAgregarPregunta [
	topico1
		agregarPregunta: '¿Que es smalltalk?'
		descripcion: 'descripcion 1'
		usuario: usuario.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 1

]

{ #category : #tests }
TopicoTest >> testBorrarPregunta [
	| usuario1 |
	usuario1 := Usuario
		nombreDeUsuario: 'Usuario 1'
		contraseña: 'clave123'.
	topico1
		agregarPregunta: 'Pregunta 1'
		descripcion: 'Descripcion 1'
		usuario: usuario1.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 1.
	topico1 borrarPregunta: topico1 obtenerTodasLasPreguntas first.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 0

]

{ #category : #tests }
TopicoTest >> testObtenerPreguntasRealizadasPor [
	topico1
		agregarPregunta: '¿Que es smalltalk?'
		descripcion: 'descripcion 1'
		usuario: usuario.
	topico1
		agregarPregunta: 'Pregunta 2'
		descripcion: 'descripcion 2'
		usuario: usuario.
	topico1
		agregarPregunta: 'Pregunta 3'
		descripcion: 'descripcion 3'
		usuario: usuario.
	self
		assert: (topico1 obtenerPreguntasRealizadasPor: usuario) size
		equals: 3
]

{ #category : #tests }
TopicoTest >> testObtenerRespuestasRealizadasPor [
		| respuestasPorUsuario |
	topico1
		agregarPregunta: '¿Que es smalltalk?'
		descripcion: 'descripcion 1'
		usuario: usuario.
	topico1 obtenerTodasLasPreguntas first
		agregarRespuesta: 'Respuesta 1' creador: usuario;
		agregarRespuesta: 'Respuesta 2' creador: usuario.
	respuestasPorUsuario := topico1
		obtenerRespuestasRealizadasPor: usuario.
	self assert: respuestasPorUsuario size equals: 2.
	self assert: respuestasPorUsuario first texto equals: 'Respuesta 1'

]

{ #category : #test }
TopicoTest >> testTengoPregunta [
|p1 p2 |

p1:= Pregunta newConTitulo: 'EE' descripcion:'11'  yUsuario: usuario.
p2:=Pregunta newConTitulo: 'NO' descripcion:'12'  yUsuario: usuario.
topico1 agregarPregunta: p1.
	self assert: (topico1 tengoPregunta: p1)equals:true.
		self assert: (topico1 tengoPregunta: p2)equals:false.
]
