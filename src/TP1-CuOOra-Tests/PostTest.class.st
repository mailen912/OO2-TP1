"
A PostTest is a test class for testing the behavior of Post
"
Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'post'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
PostTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|creador |
	creador :=Usuario nombreDeUsuario: 'Marco' contraseña:'1111' .
post:=Post new.
post initializeConCreador: creador .
]

{ #category : #tests }
PostTest >> testHaceDislikeUnUsuario [ 
|usuariox|
self assert: (post cantidadDeDislikes =0)equals: true."en un principio mi coleccion de dislikes esta vacia"
usuariox:= Usuario nombreDeUsuario: 'Userxx' contraseña:'xx3242'.
post haceLikeUnUsuario: usuariox ."el usuariox le da like a ese post"
self assert: (post cantidadDeLikes =1)equals: true."mi coleccion de likes, en un principio vacia, ahora deberia tener 1"
post haceDislikeUnUsuario: usuariox ."el mismo usuario que dio like a la post, ahora cambia de opinion y le da dislike"
self  assert: (post cantidadDeDislikes =1)equals: true."ahora la cantidad de dislikes deberia ser 1"
self assert:( post cantidadDeLikes =0) equals: true."ahora la cantidad de likes deberia ser 0"
post haceDislikeUnUsuario: usuariox .
self  assert: (post cantidadDeDislikes =1)equals: true."un usuario puede hacer como maximo un dislike"
]

{ #category : #tests }
PostTest >> testHaceLikeUnUsuario [
|usuariox|
self assert:( post cantidadDeLikes =0) equals: true."en un principio mi coleccion de likes esta vacia"
usuariox:= Usuario nombreDeUsuario: 'Valen323' contraseña:'21334fx' .
post haceDislikeUnUsuario: usuariox ."el usuariox le da dislike a esa post"
self assert: (post cantidadDeDislikes =1)equals: true."mi coleccion de dislike, en un principio vacia, ahora deberia tener 1"
post haceLikeUnUsuario: usuariox."el mismo usuario que dio dislike a la post, ahora cambia de opinion y le da like"
self assert:( post cantidadDeLikes =1) equals: true."ahora la cantidad de likes deberia ser 1"
self assert: (post cantidadDeDislikes =0)equals: true."y la cantidad de dislikes deberia ser 0"
post haceLikeUnUsuario: usuariox.
self assert:( post cantidadDeLikes =1) equals: true"un usuario puede hacer como maximo un like"
]
