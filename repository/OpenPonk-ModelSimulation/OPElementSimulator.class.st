"
I am simulator which simulates element.

Create my instance by providing diagram simulator and element model to simulate to class-side method diagramSimulator:model:

    Instance Variables
	diagramSimulator:		simulator of diagram in which I am
	incoming:		connected elements treated as incoming
	outgoing:		connected elements treated as outgoing
	priority:		priority for step ordering or filtering
	startingModel:		saved model element from beginning of simulation
	tokens:		collection of tokens I contain
"
Class {
	#name : 'OPElementSimulator',
	#superclass : 'OPModelSimulator',
	#instVars : [
		'incoming',
		'outgoing',
		'tokens',
		'startingModel',
		'priority',
		'diagramSimulator'
	],
	#category : 'OpenPonk-ModelSimulation-Simulators',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Simulators'
}

{ #category : 'instance creation' }
OPElementSimulator class >> model: anElement diagramSimulator: aDiagramSimulator [
	^ self new
		model: anElement;
		diagramSimulator: aDiagramSimulator;
		yourself
]

{ #category : 'adding' }
OPElementSimulator >> addIncoming: anElement [
	"adds element as incoming"

	anElement
		ifNil: [ ^ self ];
		addedOutgoing: self.
	self addedIncoming: anElement
]

{ #category : 'adding' }
OPElementSimulator >> addOutgoing: anElement [
	"adds element as outgoing"

	anElement
		ifNil: [ ^ self ];
		addedIncoming: self.
	self addedOutgoing: anElement
]

{ #category : 'tokens' }
OPElementSimulator >> addToken: aToken [
	tokens add: aToken.
	aToken element: self
]

{ #category : 'tokens' }
OPElementSimulator >> addTokens: aCollectionOfTokens [
	tokens addAll: aCollectionOfTokens.
	aCollectionOfTokens do: [ :each | each element: self ]
]

{ #category : 'private - adding' }
OPElementSimulator >> addedIncoming: anElement [
	incoming add: anElement
]

{ #category : 'private - adding' }
OPElementSimulator >> addedOutgoing: anElement [
	outgoing add: anElement
]

{ #category : 'actions' }
OPElementSimulator >> connectedDo: aBlock [
	self
		incomingDo: aBlock;
		outgoingDo: aBlock
]

{ #category : 'accessing' }
OPElementSimulator >> diagramSimulator [
	^ diagramSimulator
]

{ #category : 'private - accessing' }
OPElementSimulator >> diagramSimulator: aDiagramSimulator [
	diagramSimulator := aDiagramSimulator
]

{ #category : 'accessing' }
OPElementSimulator >> incoming [
	^ incoming
]

{ #category : 'actions' }
OPElementSimulator >> incomingDo: aBlock [
	incoming do: aBlock
]

{ #category : 'initialization' }
OPElementSimulator >> initialize [
	super initialize.
	priority := 0.
	incoming := OrderedCollection new.
	outgoing := OrderedCollection new.
	tokens := OrderedCollection new
]

{ #category : 'creation' }
OPElementSimulator >> loadConnectedItems [
	"loads and/or connects appropriate tokens and elements"

	"do nothing by default"
]

{ #category : 'actions' }
OPElementSimulator >> loadState [
	"loads state of model into simulator"

	self stop
]

{ #category : 'accessing' }
OPElementSimulator >> outgoing [
	^ outgoing
]

{ #category : 'actions' }
OPElementSimulator >> outgoingDo: aBlock [
	outgoing do: aBlock
]

{ #category : 'accessing' }
OPElementSimulator >> priority [
	^ priority
]

{ #category : 'accessing' }
OPElementSimulator >> priority: anInteger [
	priority := anInteger
]

{ #category : 'tokens' }
OPElementSimulator >> removeAllTokens [
	^ self removeTokens: self tokenCount
]

{ #category : 'tokens' }
OPElementSimulator >> removeToken: aToken [
	tokens remove: aToken.
	aToken element: nil.
	^ aToken
]

{ #category : 'tokens' }
OPElementSimulator >> removeTokens: anInteger [
	| removedTokens |
	removedTokens := OrderedCollection new.
	anInteger timesRepeat: [ removedTokens add: (self removeToken: tokens first) ].
	^ removedTokens
]

{ #category : 'actions' }
OPElementSimulator >> saveState [
	"saves state after simulation into model"

	startingModel := model copy
]

{ #category : 'initialization' }
OPElementSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self fromSelf
]

{ #category : 'tokens' }
OPElementSimulator >> simulableTokens [
	^ tokens select: [ :token | token isSimulable ]
]

{ #category : 'tokens' }
OPElementSimulator >> steppableTokens [
	^ tokens select: [ :token | token isSteppable ]
]

{ #category : 'tokens' }
OPElementSimulator >> tokenCount [
	^ tokens size
]

{ #category : 'tokens' }
OPElementSimulator >> tokens [
	^ tokens
]

{ #category : 'private - action' }
OPElementSimulator >> tokensDo: aBlock [
	tokens do: aBlock
]
