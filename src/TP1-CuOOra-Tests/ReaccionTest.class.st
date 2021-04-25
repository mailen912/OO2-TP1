"
A ReaccionTest is a test class for testing the behavior of Reaccion
"
Class {
	#name : #ReaccionTest,
	#superclass : #TestCase,
	#instVars : [
		'like',
		'usuariox'
	],
	#category : #'TP1-CuOOra-Tests'
}

{ #category : #running }
ReaccionTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	usuariox:=Usuario nombreDeUsuario: 'User2323' contraseña:'xxxq0'.
like:=Reaccion delUsuario: usuariox.
]

{ #category : #tests }
ReaccionTest >> testPerteneceAlUsuario [
|usuarioy|
self assert: (like perteneceAlUsuario: usuariox) .
usuarioy:=Usuario nombreDeUsuario: 'Useryyum' contraseña:'xxxq0'.
self deny:  (like perteneceAlUsuario: usuarioy) 
]
