Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	aCanvas big:[aCanvas strong with: 'CuOOra'].	
	aCanvas
		space;
		horizontalRule.
   self renderPostsOn: aCanvas.
"	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderSignInButtonOn: aCanvas ]"
		""
]

{ #category : #rendering }
HomeComponent >> renderPostsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Ultimas Preguntas'.
	aCanvas
		unorderedList: [ ((CuOOra soleInstance ) listado: self session usuario) do:[:preg| aCanvas listItem: preg creador]]
]
