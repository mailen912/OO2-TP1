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
UsuarioTest >> testRegistrarTopicoDeInteres [
|topico|
topico:=Topico nombreDeTopico: 'JS' descripcion:'lenguaje actual'.
self assert: (usuario cantidadTopicosDeInteres = 0)equals: true"en un principio la coleccion de topicos de interes deberia estar vacia".
usuario registrarTopicoDeInteres: topico."agrego un topico de interes al usuario"
 self assert: (usuario cantidadTopicosDeInteres = 1)equals: true"ahora la coleccion de topicos de interes deberia tener 1 para ese usuario".

]
