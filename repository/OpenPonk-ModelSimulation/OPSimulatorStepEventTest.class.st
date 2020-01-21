"
A DCSimulatorStepEventTest is a test class for testing the behavior of DCSimulatorStepEvent
"
Class {
	#name : #OPSimulatorStepEventTest,
	#superclass : #OPSimulatorEventTest,
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #tests }
OPSimulatorStepEventTest >> testInstanceCreation [
	| event |
	event := OPSimulatorStepEvent simulator: simulator.
	self assert: event simulator = simulator
]
