Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'TP1-CuOOra'
}

{ #category : #'as yet unclassified' }
CuOOra >> agregarTopicoConNombre: nombre yDescripcion:descrip [
"agrega un topico nuevo a la coleccion de topicos"
|nuevoTopico|
nuevoTopico:= Topico nombreDeTopico: nombre descripcion:descrip. 
topicos add: nuevoTopico .
]

{ #category : #'as yet unclassified' }
CuOOra >> agregarUsuarioConNombre: nombre yContraseña:contra [ 
"agrega un usuario nuevo a la coleccion de usuarios"
|nuevoUsuario|
nuevoUsuario:= Usuario nombreDeUsuario: nombre contraseña: contra.
usuarios add: nuevoUsuario .

]

{ #category : #'as yet unclassified' }
CuOOra >> buscarTopicoParaPreguntar: topicosRelacionada titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
"hay que modificar"
	(topicos select: [ :each | each includesAny: topicosRelacionada ])
		agregarPregunta: unTitulo
		descripcion: unaDescripcion
		usuario: unUsuario

]

{ #category : #'as yet unclassified' }
CuOOra >> calcularPuntaje: unUsuario [
	^ topicos sumNumbers: [ :topico | topico calcularPuntaje: unUsuario ]


]

{ #category : #ayudaParaTests }
CuOOra >> cantidadDeTopicos [
^topicos size
]

{ #category : #ayudaParaTests }
CuOOra >> cantidadDeUsuarios [
^usuarios size.
]

{ #category : #'as yet unclassified' }
CuOOra >> esMiTopico: topicosRelacionada [
	^ topicos includesAny: topicosRelacionada

]

{ #category : #initialization }
CuOOra >> initialize [ 
usuarios:= OrderedCollection new.
topicos := OrderedCollection new.
]

{ #category : #accessing }
CuOOra >> topicos [
	^ topicos

]

{ #category : #accessing }
CuOOra >> usuarios [
	^ usuarios

]
