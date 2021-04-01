"
An UsuarioTest is a test class for testing the behavior of Usuario
"
Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'usuario'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
UsuarioTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
 usuario:=Usuario nombreDeUsuario: 'usuario1254' contraseña:'23231nnk' 
]

{ #category : #tests }
UsuarioTest >> testObtenerPreguntasDeTopicosDeInteres [
"compruebo que obtengo una coleccion de todas las preguntas pertenecientes a los topicos de interes del usuario"
|topico1 topico2 usuario1 usuario2 usuario3 usuario4 preguntas|
usuario1 := Usuario nombreDeUsuario: 'uno' contraseña: '232da'.
usuario2 := Usuario nombreDeUsuario: 'dos' contraseña: '23wa'.
usuario3 := Usuario nombreDeUsuario: 'tres' contraseña: '237a'.
usuario4 := Usuario nombreDeUsuario: 'cuatro' contraseña: '2532da'.


topico1 :=Topico nombreDeTopico: 'SMALLTALK' descripcion:'OO2'.
topico2 :=Topico nombreDeTopico: 'JAVA' descripcion:'Taller de programacion'.

topico1 agregarPregunta: 'Nueva' descripcion: 'cual?' usuario: usuario1.
topico1 agregarPregunta: 'Vieja' descripcion: 'por que?' usuario: usuario2.
topico2 agregarPregunta: 'Nueva' descripcion: 'cual?' usuario: usuario3.
topico2 agregarPregunta: 'Vieja' descripcion: 'por que?' usuario: usuario4.

usuario registrarTopicoDeInteres: topico1 .
usuario registrarTopicoDeInteres: topico2 .

preguntas:=usuario obtenerPreguntasDeTopicosDeInteres .
self assert: ((preguntas size)=4)equals: true.
self assert: ((preguntas size)=2)equals: false.
]

{ #category : #tests }
UsuarioTest >> testRegistrarTopicoDeInteres [
|topico|
topico:=Topico nombreDeTopico: 'JS' descripcion:'lenguaje actual'.
self assert: (usuario cantidadTopicosDeInteres = 0)equals: true"en un principio la coleccion de topicos de interes deberia estar vacia".
usuario registrarTopicoDeInteres: topico."agrego un topico de interes al usuario"
 self assert: (usuario cantidadTopicosDeInteres = 1)equals: true"ahora la coleccion de topicos de interes deberia tener 1 para ese usuario".

]
