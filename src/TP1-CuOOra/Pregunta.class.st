Class {
	#name : #Pregunta,
	#superclass : #Post,
	#instVars : [
		'titulo',
		'descripcion',
		'respuestas'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'instance creation' }
Pregunta class >> newConTitulo: unTitulo descripcion: unaDescripcion yUsuario: unUsuario [
	^self new
		initializeConTitulo: unTitulo
		yDescripcion: unaDescripcion
		yUsuario: unUsuario
]

{ #category : #public }
Pregunta >> agregarRespuesta: texto creador: unUsuario [
"se agrega una respuesta a la coleccion de respuestas"
	| nuevaRespuesta |
	nuevaRespuesta := Respuesta conTexto: texto  yCreador:unUsuario.
	respuestas add: nuevaRespuesta.
	^nuevaRespuesta


]

{ #category : #accessing }
Pregunta >> descripcion [
^descripcion 
]

{ #category : #public }
Pregunta >> eliminarRespuestas [
           "Elimina todas sus respuestas"
	respuestas removeAll

]

{ #category : #initialization }
Pregunta >> initializeConTitulo: unTitulo yDescripcion: unaDescripcion yUsuario: unUsuario [
"inicializa los valores de una pregunta"
    self initializeConCreador: unUsuario .
	titulo := unTitulo.
	descripcion := unaDescripcion.
	respuestas := OrderedCollection new

]

{ #category : #public }
Pregunta >> obtenerRespuestasOrdenadasPorPuntaje [
"se retornan todas las respuestas ordenadas de mayor a menor por cantidad mayor puntaje, el que está dado por la diferencia de likes y dislikes. "
^respuestas  asSortedCollection: [:unaRta :otraRta | unaRta puntaje > otraRta puntaje]. 
]

{ #category : #public }
Pregunta >> obtenerRespuestasPor: unUsuario [
           "Restorna una coleccion de respuestas en donde el creador coincide con el parametro "
	^ respuestas
		select: [ :respuesta | respuesta yoLaRealize: unUsuario ]

]

{ #category : #accessing }
Pregunta >> respuestas [
	^ respuestas

]

{ #category : #accessing }
Pregunta >> titulo [
^titulo
]
