Class {
	#name : #AskQuestionsComponent,
	#superclass : #CuOOraComponent,
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
AskQuestionsComponent >> preguntar [
|preg|
preg:=Pregunta newConTitulo: titulo descripcion:desarrollo  yUsuario:(self session usuario) .
self model agregarPreguntaALosTopicos: topicos preg:preg  . 
self answer.
]

{ #category : #rendering }
AskQuestionsComponent >> renderAskQuestion:aCanvas [.
"muestra un formulario para hacer una pregunta"
	aCanvas label: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas label: 'Desarrollo';break.
	(aCanvas textArea on: #desarrollo of: self) columns: 80; rows: 5.
	aCanvas break;break;label: 'Topicos';break.
	aCanvas multiSelect
   labels: #nombreTopico; 
   list: self model topicos;
   selected:topicos ;
   callback: [ :value | topicos:=value ].
   aCanvas break.
   aCanvas submitButton callback: [ self cancelar ];with: 'Cancelar' .
   aCanvas space.
   aCanvas submitButton callback: [ self preguntar ];with: 'Guardar' .
	
]

{ #category : #rendering }
AskQuestionsComponent >> renderContentOn: aCanvas [
   super renderContentOn: aCanvas.
	aCanvas heading level: 2;
		with: 'Nueva Pregunta'.
	aCanvas horizontalRule.
	aCanvas form: [ self renderAskQuestion:aCanvas.]
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
