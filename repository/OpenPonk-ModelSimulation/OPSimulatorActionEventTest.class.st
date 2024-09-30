"
A DCSimulatorActionEventTest is a test class for testing the behavior of DCSimulatorActionEvent
"
Class {
	#name : 'OPSimulatorActionEventTest',
	#superclass : 'OPSimulatorEventTest',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPSimulatorActionEventTest >> testInstanceCreation [
	| event |
	event := OPSimulatorActionEvent simulator: simulator action: [ 2 + 2 ] index: 2.
	self assert: event simulator = simulator & (event action value = 4) & (event index = 2)
]
