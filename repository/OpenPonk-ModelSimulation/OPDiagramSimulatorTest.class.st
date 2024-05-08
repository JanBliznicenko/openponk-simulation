"
A DCDiagramSimulatorTest is a test class for testing the behavior of DCDiagramSimulator
"
Class {
	#name : 'OPDiagramSimulatorTest',
	#superclass : 'OPModelSimulatorTest',
	#instVars : [
		'diagram'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'hooks' }
OPDiagramSimulatorTest >> controllerClass [
	^ OPDummySubclassOfDCDiagramSimulator
]

{ #category : 'hooks' }
OPDiagramSimulatorTest >> prepareOneSimulable [
	diagram := OPDummyDCDiagram new addElements: 1.
	simulator := self controllerClass model: diagram
]

{ #category : 'running' }
OPDiagramSimulatorTest >> setUp [
	| edge |
	super setUp.
	diagram := OPDummyDCDiagram new.
	diagram addElements: 3.
	edge := OPDummyDCEdge new
		source: diagram elements first;
		target: diagram elements second;
		yourself.
	diagram add: edge.
	simulator model: diagram
]

{ #category : 'tests' }
OPDiagramSimulatorTest >> testAccessing [
	self assert: simulator simulableElements size = 3.
	self assert: simulator steppableElements size = 0.
	simulator elements first steppable: true.
	self assert: simulator steppableElements size = 1.

	self assert: simulator tokenCount = 3.
	self assert: simulator tokens size = 3.
	self assert: simulator steppableTokens size = 0.
	self assert: simulator simulableTokens size = 3.

	self assert: simulator model class = OPDummyDCDiagram
]

{ #category : 'tests' }
OPDiagramSimulatorTest >> testEnumeration [
	self assert: (simulator elements allSatisfy: [ :each | each state = 1 ]).
	simulator elementsDo: [ :each | each saveState ].
	self assert: (simulator elements allSatisfy: [ :each | each state = 2 ]).
	simulator simulableElementsDo: [ :each | each saveState ].
	self assert: (simulator elements allSatisfy: [ :each | each isSimulable not or: [ each state = 3 ] ])
]

{ #category : 'tests' }
OPDiagramSimulatorTest >> testLoadingOfModel [
	self assert: (simulator elements allSatisfy: [ :each | each loaded ]).
	self assert: simulator elements size = 4.
	self assert: (simulator elements count: [ :each | each class = OPDummyDCEdgeSimulator ]) = 1.
	self assert: (simulator elements count: [ :each | each class = OPDummyDCElementSimulator ]) = 3.

	self assert: (simulator simulatorOf: diagram elements last) class = OPDummyDCEdgeSimulator.
	self assert: (simulator elements allSatisfy: [ :each | each diagramSimulator = simulator ])
]

{ #category : 'tests' }
OPDiagramSimulatorTest >> testStates [
	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator saveState.
	self assert: (simulator elements sum: [ :each | each state ]) = 8.
	simulator loadState.
	self assert: (simulator elements sum: [ :each | each state ]) = 4
]

{ #category : 'tests' }
OPDiagramSimulatorTest >> testStep [
	simulator
		fromSteppableElements;
		orderAny;
		priorityAny;
		selectAll;
		addAction: [ :item | item saveState ].

	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator step.
	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator elements first steppable: true.
	simulator elements second steppable: true.
	simulator step.
	self assert: (simulator elements sum: [ :each | each state ]) = 6
]
