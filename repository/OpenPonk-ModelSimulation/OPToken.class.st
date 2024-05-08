"
I'm an object meant to run through simulated diagram.
Like all simulation items, I may be directly stepped.

Create my instance by providing element simulator to class-side method element: 
If this element does not know its diagramSimulator yet, provide also that.

    Instance Variables
	diagramSimulator:		simulator of diagram in which I am
	element:		simulator of element in which I am
	priority:		priority for step ordering or filtering
"
Class {
	#name : 'OPToken',
	#superclass : 'OPSimulator',
	#instVars : [
		'element',
		'priority',
		'diagramSimulator'
	],
	#category : 'OpenPonk-ModelSimulation-Simulators',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Simulators'
}

{ #category : 'instance creation' }
OPToken class >> diagramSimulator: aDiagramSimulator [
	^ self new
		diagramSimulator: aDiagramSimulator;
		yourself
]

{ #category : 'instance creation' }
OPToken class >> element: anElement [
	^ self new
		element: anElement;
		yourself
]

{ #category : 'accessing' }
OPToken >> diagramSimulator [
	^ diagramSimulator
]

{ #category : 'private - accessing' }
OPToken >> diagramSimulator: aDiagramSimulator [
	diagramSimulator := aDiagramSimulator
]

{ #category : 'accessing' }
OPToken >> element [
	^ element
]

{ #category : 'accessing' }
OPToken >> element: anElement [
	element := anElement.
	self diagramSimulator: (element ifNotNil: [ element diagramSimulator ] ifNil: [ nil ])
]

{ #category : 'as yet unclassified' }
OPToken >> fromSelf [
	"stepping settings
	before: none
	after: priority
	
	steps self"

	"do nothing"
]

{ #category : 'initialization' }
OPToken >> initialize [
	super initialize.
	priority := 0
]

{ #category : 'private - accessing' }
OPToken >> itemsForAction [

	^ OrderedCollection with: self
]

{ #category : 'accessing' }
OPToken >> priority [
	^ priority
]

{ #category : 'accessing' }
OPToken >> priority: anInteger [
	priority := anInteger
]
