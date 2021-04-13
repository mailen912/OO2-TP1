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

{ #category : #rendering }
AskQuestionsComponent >> initialize [ 
super initialize.
"topicos:=OrderedCollection new."
]

{ #category : #'as yet unclassified' }
AskQuestionsComponent >> preguntar [
|preg|
preg:=Pregunta newConTitulo: titulo descripcion:desarrollo  yUsuario:(self session usuario) .
(CuOOra soleInstance)agregarPreguntaALosTopicos: topicos preg:preg  . 
self answer.
]

{ #category : #rendering }
AskQuestionsComponent >> renderAskQuestion:aCanvas [.
	aCanvas label: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas label: 'Desarrollo';break.
	(aCanvas textArea on: #desarrollo of: self) columns: 80; rows: 5.
	aCanvas break;break;label: 'Topicos'.
	aCanvas multiSelect
   labels: #nombreTopico; 
   list: CuOOra soleInstance  topicos;
   selected: CuOOra soleInstance  topicos ;
   callback: [ :value | topicos:=value ].
   "aCanvas paragraph: [ aCanvas textInput on: #topicos of: self ]."
   aCanvas submitButton callback: [ self cancelar ];with: 'Cancelar' .
   aCanvas submitButton callback: [ self preguntar ];with: 'Guardar' .
	
]

{ #category : #rendering }
AskQuestionsComponent >> renderContentOn: aCanvas [
   super renderContentOn: aCanvas.
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
"topicos:=t."
topicos add:t.
	
]
