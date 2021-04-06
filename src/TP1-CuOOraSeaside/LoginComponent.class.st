Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'nombreUsuario',
		'contraseña'
	],
	#category : #'TP1-CuOOraSeaside'
}

{ #category : #accessing }
LoginComponent >> contraseña [
	^ contraseña
]

{ #category : #accessing }
LoginComponent >> contraseña: unaContra [
	contraseña := unaContra
]

{ #category : #rendering }
LoginComponent >> login [

	(self model
		usuarioConNombreDeUsuario: nombreUsuario
		yContraseña: contraseña) ifNotNil: [ :it | self proceedWith: it ].
	nombreUsuario := nil.
	contraseña := nil
]

{ #category : #accessing }
LoginComponent >> model [
	^ CuOOra soleInstance
]

{ #category : #accessing }
LoginComponent >> nombreUsuario [
	^ nombreUsuario
]

{ #category : #accessing }
LoginComponent >> nombreUsuario: unNombre [
	nombreUsuario := unNombre
]

{ #category : #'as yet unclassified' }
LoginComponent >> proceedWith: aUser [
	self session usuario: aUser.
	self call: HomeComponent new
]

{ #category : #accessing }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas big:[aCanvas strong with: 'CuOOra'].	
	aCanvas
		space;
		horizontalRule.
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderSignInButtonOn: aCanvas ]
]

{ #category : #accessing }
LoginComponent >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Nombre de Usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #nombreUsuario of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #contraseña of: self ]
]

{ #category : #rendering }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Iniciar Sesion'
]
