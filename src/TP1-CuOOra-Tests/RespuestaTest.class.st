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
RespuestaTest >> testHaceDislikeUnUsuario [ 
|usuariox|
self assert: respuesta  cantidadDeDislikes equals:0."en un principio mi coleccion de dislikes esta vacia"
usuariox:= Usuario nombreDeUsuario: 'Userxx' contraseña:'xx3242'.
respuesta  haceLikeUnUsuario: usuariox ."el usuariox le da like a ese post"
self assert: respuesta  cantidadDeLikes equals:1."mi coleccion de likes, en un principio vacia, ahora deberia tener 1"
respuesta  haceDislikeUnUsuario: usuariox ."el mismo usuario que dio like a la post, ahora cambia de opinion y le da dislike"
self  assert:  respuesta  cantidadDeDislikes equals: 1."ahora la cantidad de dislikes deberia ser 1"
self assert:respuesta  cantidadDeLikes  equals: 0."ahora la cantidad de likes deberia ser 0"
respuesta  haceDislikeUnUsuario: usuariox .
self  assert: respuesta  cantidadDeDislikes equals:1."un usuario puede hacer como maximo un dislike"
]

{ #category : #tests }
RespuestaTest >> testHaceLikeUnUsuario [
|usuariox|
self assert: respuesta  cantidadDeLikes equals:0."en un principio mi coleccion de likes esta vacia"
usuariox:= Usuario nombreDeUsuario: 'Valen323' contraseña:'21334fx' .
respuesta haceDislikeUnUsuario: usuariox ."el usuariox le da dislike a esa post"
self assert: respuesta cantidadDeDislikes equals:1."mi coleccion de dislike, en un principio vacia, ahora deberia tener 1"
respuesta  haceLikeUnUsuario: usuariox."el mismo usuario que dio dislike a la post, ahora cambia de opinion y le da like"
self assert:respuesta cantidadDeLikes equals:1."ahora la cantidad de likes deberia ser 1"
self assert: respuesta  cantidadDeDislikes equals:0."y la cantidad de dislikes deberia ser 0"
respuesta  haceLikeUnUsuario: usuariox.
self assert:respuesta  cantidadDeLikes equals:1 "un usuario puede hacer como maximo un like"
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
self assert: (respuesta puntaje)equals: 2
]
