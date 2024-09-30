"
A DCTokenTest is a test class for testing the behavior of DCToken
"
Class {
	#name : 'OPTokenTest',
	#superclass : 'OPSimulatorTest',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPTokenTest >> controllerClass [
	^ OPDummySubclassOfDCToken
]

{ #category : 'hooks' }
OPTokenTest >> prepareOneSimulable [
	"do nothing"
]

{ #category : 'tests' }
OPTokenTest >> testStep [
	simulator addAction: [ :item | item doState ].

	self assert: simulator state = 1.
	simulator step.
	self assert: simulator state = 1.
	simulator steppable: true.
	simulator step.
	self assert: simulator state = 2
]
