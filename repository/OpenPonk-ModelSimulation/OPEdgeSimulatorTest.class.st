"
A DCEdgeSimulatorTest is a test class for testing the behavior of DCEdgeSimulator
"
Class {
	#name : #OPEdgeSimulatorTest,
	#superclass : #OPElementSimulatorTest,
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #hooks }
OPEdgeSimulatorTest >> controllerClass [
	^ OPDummySubclassOfDCEdgeSimulator
]

{ #category : #running }
OPEdgeSimulatorTest >> setUp [
	super setUp.
	simulator model: OPDummyDCEdge new
]

{ #category : #tests }
OPEdgeSimulatorTest >> testConnectedAliases [
	self assert: simulator source = nil.
	self assert: simulator target = nil.

	simulator source: self controllerClass new.
	simulator target: self controllerClass new.

	self assert: simulator source class = self controllerClass.
	self assert: simulator target class = self controllerClass.
	self assert: (simulator source outgoing includes: simulator).
	self assert: (simulator target incoming includes: simulator)
]
