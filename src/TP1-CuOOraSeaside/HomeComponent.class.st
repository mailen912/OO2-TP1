Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #'as yet unclassified' }
HomeComponent >> getOut [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas big:[aCanvas strong with: 'CuOOra'].	
	aCanvas space;text:self session usuario nombreUsuario.
	aCanvas paragraph: [ aCanvas anchor callback: [ self getOut ];with: 'Log Out' ].
	aCanvas horizontalRule.
   self renderPostsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderPostsOn: aCanvas [
	aCanvas paragraph: [ aCanvas anchor callback: [ self call:AskQuestionsComponent new ];with: 'Hacer una nueva pregunta' ].
	aCanvas heading
		level: 2;
		with: 'Ultimas Preguntas'.
	aCanvas
		unorderedList: [ ((CuOOra soleInstance )  listado: self session usuario)
				do: [ :preg | aCanvas listItem: preg titulo.
					aCanvas paragraph: [ aCanvas text:'Realizada por '.
					aCanvas strong with:(preg creador nombreUsuario).aCanvas text:' | ' ,(preg respuestas size)asString ,' repuestas'.
					aCanvas paragraph:[aCanvas text: (preg cantidadDeLikes) asString, ' likes   |   ', (preg cantidadDeDislikes) asString,' dislikes']]]].
		"aCanvas
		unorderedList: [ ((CuOOra soleInstance ) obtenerPreguntasRealizadasPor: (self session) )
				do: [ :preg | aCanvas listItem: preg titulo.]]. esto es para probar que se guarde la pregunta que hace el usuario"
]
