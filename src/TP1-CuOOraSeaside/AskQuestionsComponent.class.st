Class {
	#name : #AskQuestionsComponent,
	#superclass : #WAComponent,
	#instVars : [
		'titulo',
		'desarrollo',
		'topicos'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #rendering }
AskQuestionsComponent >> cancelar [
self answer 
	
]

{ #category : #rendering }
AskQuestionsComponent >> desarrollo [
^desarrollo 
	
]

{ #category : #rendering }
AskQuestionsComponent >> desarrollo:unD [
desarrollo:=unD
	
]

{ #category : #'as yet unclassified' }
AskQuestionsComponent >> getOut [
	self session unregister.
	self requestContext redirectTo: self application url
]

{ #category : #'as yet unclassified' }
AskQuestionsComponent >> preguntar [
|preg|
preg:=Pregunta newConTitulo: titulo descripcion:desarrollo  yUsuario:(self session ) .
((CuOOra soleInstance)agregarTopicoConNombre: topicos  yDescripcion: '')agregarPregunta: preg . 
self answer.
]

{ #category : #rendering }
AskQuestionsComponent >> renderAskQuestion:aCanvas [.
	aCanvas label: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas label: 'Desarrollo';break.
	(aCanvas textArea on: #desarrollo of: self) columns: 80; rows: 5.
	aCanvas break;break;label: 'Topicos'.
	aCanvas paragraph: [ aCanvas textInput on: #topicos of: self ].
   aCanvas submitButton callback: [ self cancelar ];with: 'Cancelar' .
   aCanvas submitButton callback: [ self preguntar ];with: 'Guardar' .
	
]

{ #category : #rendering }
AskQuestionsComponent >> renderContentOn: aCanvas [
	aCanvas big:[aCanvas strong with: 'CuOOra'];space.	
	aCanvas paragraph: [ aCanvas anchor callback: [ self getOut ];with: 'Log Out' ].
	aCanvas horizontalRule.
	aCanvas heading level: 2;
		with: 'Ultimas Preguntas'.
	aCanvas horizontalRule.
	aCanvas
		form: [ self renderAskQuestion:aCanvas.]
]

{ #category : #rendering }
AskQuestionsComponent >> titulo [
^titulo
	
]

{ #category : #rendering }
AskQuestionsComponent >> titulo:unTitulo [
titulo:=unTitulo
	
]

{ #category : #rendering }
AskQuestionsComponent >> topicos [
^topicos
	
]

{ #category : #rendering }
AskQuestionsComponent >> topicos:t [
topicos:=t.
	
]
