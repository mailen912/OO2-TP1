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
super renderContentOn: aCanvas.
	aCanvas paragraph: [ aCanvas anchor callback: [ self call:AskQuestionsComponent new ];with: 'Hacer una nueva pregunta' ].
   self renderPostsOn: aCanvas.

]

{ #category : #rendering }
HomeComponent >> renderDisikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceDislikeUnUsuario: (self session usuario).
	self call:(self class new)] ;with:'dislike'
]

{ #category : #'as yet unclassified' }
HomeComponent >> renderLikeButton:aCanvas post:post [
aCanvas anchor callback: [ post haceLikeUnUsuario: (self session usuario).
	self call:(self class new)] ;with:'like'
]

{ #category : #rendering }
HomeComponent >> renderPostsOn: aCanvas [
	aCanvas heading level: 2; with: 'Ultimas Preguntas'.
	aCanvas
		unorderedList: [ ((CuOOra soleInstance )  listado: self session usuario)
				do: [ :preg | aCanvas anchor callback: [ self call:(QuestionInformationComponent dePregunta: preg)] ;with: preg titulo.
					self mostrarTopicos:aCanvas post:preg  .
					self mostrarQuienRealizoLaPregunta:aCanvas preg:preg.
					self mostrarCuantasRespuestasTiene: aCanvas preg:preg. 
					self mostrarLikesYDislikes:aCanvas post:preg.
				    (self renderLikeButton: aCanvas post:preg).
				     aCanvas space.
				    self  renderDisikeButton:aCanvas post:preg ]].
]
