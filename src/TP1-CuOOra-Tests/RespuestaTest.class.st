"
A RespuestaTest is a test class for testing the behavior of Respuesta
"
Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'respuesta'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
RespuestaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|creador|
	creador:=Usuario nombreDeUsuario: 'user23231' contraseña:'rrcwooq'. 
	respuesta:=Respuesta conTexto: 'buena' yCreador:creador  .

]

{ #category : #tests }
RespuestaTest >> testPuntaje [
|usuario1 usuario2 usuario3 usuario4 usuario5 usuario6|
usuario1 := Usuario nombreDeUsuario: 'uno' contraseña: '232da'.
usuario2 := Usuario nombreDeUsuario: 'dos' contraseña: '23wa'.
usuario3 := Usuario nombreDeUsuario: 'tres' contraseña: '237a'.
usuario4 := Usuario nombreDeUsuario: 'cuatro' contraseña: '2532da'.
usuario5 := Usuario nombreDeUsuario: 'cinco' contraseña: '2532da'.
usuario6 := Usuario nombreDeUsuario: 'seis' contraseña: '23bj'.

respuesta haceLikeUnUsuario:usuario1.

respuesta haceLikeUnUsuario: usuario2 .
respuesta haceLikeUnUsuario: usuario3 .
respuesta haceLikeUnUsuario: usuario4 .
respuesta haceDislikeUnUsuario: usuario5.
respuesta haceDislikeUnUsuario: usuario6.
self assert: (respuesta puntaje =2)equals: true

]
