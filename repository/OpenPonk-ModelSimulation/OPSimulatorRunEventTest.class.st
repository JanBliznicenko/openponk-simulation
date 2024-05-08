"
A DCSimulatorRunEventTest is a test class for testing the behavior of DCSimulatorRunEvent
"
Class {
	#name : 'OPSimulatorRunEventTest',
	#superclass : 'OPSimulatorEventTest',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'tests' }
OPSimulatorRunEventTest >> testInstanceCreation [
	| event |
	event := OPSimulatorRunEvent simulator: simulator delay: 2 repeatTimes: 4.
	self assert: event simulator = simulator & event isLimited & (event repeatTimes = 4) & (event delay = 2).

	event := OPSimulatorRunEvent simulator: simulator delay: 2.
	self assert: event simulator = simulator & event isLimited not & (event delay = 2)
]
