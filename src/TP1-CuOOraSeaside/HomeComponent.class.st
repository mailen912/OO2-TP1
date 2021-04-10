"
| application |
application := WAAdmin register: LoginComponent asApplicationAt: 'InicioSesion'.
application sessionClass: SessionWithUser.
"
Class {
	#name : #HomeComponent,
	#superclass : #CuOOraComponent,
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas big:[aCanvas strong with: 'CuOOra'].	
	aCanvas space";text:self session usuario nombreUsuario".
	aCanvas anchor callback:[self call:(ProfileComponent conUsuario: (self session usuario))];with:self session usuario nombreUsuario .
	aCanvas paragraph: [ aCanvas anchor callback: [ self getOut ];with: 'Log Out' ].
	aCanvas horizontalRule.
   self renderPostsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderPostsOn: aCanvas [
	aCanvas paragraph: [ aCanvas anchor callback: [ self call:AskQuestionsComponent new ];with: 'Hacer una nueva pregunta' ].
	aCanvas heading level: 2; with: 'Ultimas Preguntas'.
	aCanvas
		unorderedList: [ ((CuOOra soleInstance )  listado: self session usuario)
				do: [ :preg | aCanvas anchor callback: [ self call:(QuestionInformationComponent dePregunta: preg)] ;with: preg titulo.
					self mostrarTopicos:aCanvas preg:preg  .
					self mostrarQuienRealizoLaPregunta:aCanvas preg:preg.
					self mostrarCuantasRespuestasTiene: aCanvas preg:preg. 
					self mostrarLikesYDislikes:aCanvas preg:preg]].

]
