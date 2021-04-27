"
An UsuarioTest is a test class for testing the behavior of Usuario
"
Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario',
		'usuariox',
		'topico'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
 usuario:=Usuario nombreDeUsuario: 'usuario1254' contraseña:'23231nnk'.
 usuariox:=Usuario nombreDeUsuario: 'usuario234' contraseña: 'clave145'.
 topico:=Topico nombreDeTopico: 'JS' descripcion:'lenguaje actual'.
]

{ #category : #tests }
UsuarioTest >> testObtenerPreguntasDeTopicosDeInteres [
"compruebo que obtengo una coleccion de todas las preguntas pertenecientes a los topicos de interes del usuario"
|topico1  pregunta1 pregunta2|

pregunta1:=Pregunta newConTitulo: 'pregunta 1' descripcion:'descripcion 1'  yUsuario:usuario.
pregunta2:=Pregunta newConTitulo: 'pregunta 2' descripcion:'descripcion 2'  yUsuario:usuariox.  

topico1 :=Topico nombreDeTopico: 'SMALLTALK' descripcion:'OO2'.

topico agregarPregunta: pregunta1.
topico1 agregarPregunta: pregunta2.

self assert: (usuario obtenerPreguntasDeTopicosDeInteres) isEmpty .

usuario registrarTopicoDeInteres: topico .
usuario registrarTopicoDeInteres: topico1 .

self assert: (usuario obtenerPreguntasDeTopicosDeInteres size)equals: 2.
]

{ #category : #tests }
UsuarioTest >> testRegistrarTopicoDeInteres [

self assert: usuario topicosDeInteres size equals: 0."en un principio la coleccion de topicos de interes esta vacia".
usuario registrarTopicoDeInteres: topico."agrego un topico de interes al usuario"
 self assert: usuario topicosDeInteres size equals: 1"ahora la coleccion de topicos de interes tiene 1 para ese usuario".

]

{ #category : #test }
UsuarioTest >> testSeguirUsuario [

 self assert: usuario siguiendo isEmpty .
 usuario seguirUsuario: usuariox.
 self deny: usuario siguiendo isEmpty.
 usuario seguirUsuario:usuariox.
 self assert: usuario siguiendo size equals:1.


]
