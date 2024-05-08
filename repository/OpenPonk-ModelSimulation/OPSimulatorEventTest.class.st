"
A DCSimulatorEventTest is a test class for testing the behavior of DCSimulatorEvent
"
Class {
	#name : 'OPSimulatorEventTest',
	#superclass : 'TestCase',
	#instVars : [
		'simulator'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPSimulatorEventTest class >> isAbstract [
	^ self == OPSimulatorEventTest
]

{ #category : 'as yet unclassified' }
OPSimulatorEventTest >> setUp [
	simulator := Object new
]
