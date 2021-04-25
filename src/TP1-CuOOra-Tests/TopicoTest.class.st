"
A TopicoTest is a test class for testing the behavior of Topico
"
Class {
	#name : #TopicoTest,
	#superclass : #TestCase,
	#instVars : [
		'topico1',
		'usuario',
		'pregunta'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
TopicoTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
   topico1 := Topico nombreDeTopico: 'Smalltalk' descripcion: 'orientacion a objetos'.
	usuario := Usuario nombreDeUsuario: 'usuario1' contraseña: 'clave123'.
	pregunta:=Pregunta newConTitulo: 'pregunta 1' descripcion:'descripcion 1'  yUsuario: usuario.

]

{ #category : #tests }
TopicoTest >> testAgregarPregunta [

   self assert: topico1 obtenerTodasLasPreguntas isEmpty equals:true.
	topico1 agregarPregunta: pregunta.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 1

]

{ #category : #tests }
TopicoTest >> testBorrarPregunta [
	
	topico1 agregarPregunta: pregunta.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 1.
	topico1 borrarPregunta: pregunta.
	self assert: topico1 obtenerTodasLasPreguntas size equals: 0.
	topico1 borrarPregunta: pregunta .
	self assert: topico1 obtenerTodasLasPreguntas size equals: 0.
	

]

{ #category : #tests }
TopicoTest >> testObtenerPreguntasRealizadasPor [
   self assert: (topico1 obtenerPreguntasRealizadasPor: usuario) size equals: 0.
	topico1 agregarPregunta: pregunta.
	self assert: (topico1 obtenerPreguntasRealizadasPor: usuario) size equals: 1.
]

{ #category : #tests }
TopicoTest >> testObtenerRespuestasRealizadasPor [

	topico1 agregarPregunta: pregunta.
	topico1 obtenerTodasLasPreguntas first
		agregarRespuesta: 'Respuesta 1' creador: usuario;
		agregarRespuesta: 'Respuesta 2' creador: usuario.
	self assert: (topico1 obtenerRespuestasRealizadasPor: usuario) size equals: 2.


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
