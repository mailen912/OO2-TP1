"
A PreguntaTest is a test class for testing the behavior of Pregunta
"
Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'pregunta',
		'usuarioPregunta',
		'pregunta1',
		'usuarioRespuesta'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
PreguntaTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
|creador |
	creador :=Usuario nombreDeUsuario: 'Marco' contraseña:'1111' .
	pregunta:= Pregunta newConTitulo: 'unTitulo' descripcion: 'unaDescripcion' yUsuario:creador. 
	usuarioPregunta := Usuario
		nombreDeUsuario: 'Usuario 1'
		contraseña: 'clave123'.
	pregunta1 := Pregunta
		newConTitulo: 'Pregunta 1'
		descripcion: 'Descripcion 1'
		yUsuario: usuarioPregunta.
	usuarioRespuesta := Usuario
		nombreDeUsuario: 'Usuario 2'
		contraseña: 'clave456'

]

{ #category : #tests }
PreguntaTest >> testAgregarRespuesta [
	self assert: pregunta1 respuestas size equals: 0.
	pregunta1 agregarRespuesta: 'Respuesta 1' creador: usuarioRespuesta.
	self assert: pregunta1 respuestas size equals: 1

]

{ #category : #tests }
PreguntaTest >> testEliminarRespuestas [
	"Si la coleccion respuestas esta vacia no hace nada y si tiene elementos los elimina"

	self assert: pregunta1 respuestas size equals: 0.
	pregunta1 eliminarRespuestas.
	self assert: pregunta1 respuestas size equals: 0.
	pregunta1 agregarRespuesta: 'Respuesta 1' creador: usuarioRespuesta.
	pregunta1 eliminarRespuestas.
	self assert: pregunta1 respuestas size equals: 0


]

{ #category : #tests }
PreguntaTest >> testObtenerRespuestasOrdenadasPorPuntaje [
|   usuario1 usuario2 usuario3 usuario4 usuario5 usuario6 rtasOrdenadas |

usuario1 := Usuario nombreDeUsuario: 'uno' contraseña: '232da'.
usuario2 := Usuario nombreDeUsuario: 'dos' contraseña: '23wa'.
usuario3 := Usuario nombreDeUsuario: 'tres' contraseña: '237a'.
usuario4 := Usuario nombreDeUsuario: 'cuatro' contraseña: '2532da'.
usuario5 := Usuario nombreDeUsuario: 'cinco' contraseña: '2532da'.
usuario6 := Usuario nombreDeUsuario: 'seis' contraseña: '23bj'.

pregunta agregarRespuesta: 'si' creador: usuario1 .
pregunta agregarRespuesta: 'no' creador: usuario2 .
self assert: ((pregunta respuestas first texto)= 'si') equals: true.
self assert: ((pregunta respuestas last texto)= 'no') equals: true.
(pregunta respuestas first)haceLikeUnUsuario:usuario1.
(pregunta respuestas first) haceLikeUnUsuario: usuario2 .
(pregunta respuestas first) haceLikeUnUsuario: usuario3 .
(pregunta respuestas first) haceLikeUnUsuario: usuario4 .
(pregunta respuestas first) haceDislikeUnUsuario: usuario5.
(pregunta respuestas first) haceDislikeUnUsuario: usuario6."sabemos por el test de respuesta que el puntaje de respuesta 1 es al momento, 2"
self assert: ((pregunta respuestas first)cantidadDeLikes =4)equals: true.

(pregunta respuestas last)haceLikeUnUsuario:usuario1.
(pregunta respuestas last) haceLikeUnUsuario: usuario2 .
(pregunta respuestas last) haceLikeUnUsuario: usuario3 .
(pregunta respuestas last) haceLikeUnUsuario: usuario4 .
(pregunta respuestas last) haceDislikeUnUsuario: usuario5.
"sabemos por el test de respuesta que el puntaje de respuesta 1 es al momento, 3"

rtasOrdenadas := pregunta obtenerRespuestasOrdenadasPorPuntaje .
self assert: ((rtasOrdenadas first texto)= 'no') equals: true.
self assert: ((rtasOrdenadas last texto)= 'si') equals: true.

]
