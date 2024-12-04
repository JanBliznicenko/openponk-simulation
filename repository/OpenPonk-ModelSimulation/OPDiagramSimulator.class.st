"
I am simulator which simulates diagram.

Create my instance by providing diagram to simulate to class-side method model:

First all element simulators are created for all elements, then they get interconnected, then is loaded their state. 

    Instance Variables
	elements:		collection of element simulators
	simulableElements:		collection of simulable element simulators
"
Class {
	#name : 'OPDiagramSimulator',
	#superclass : 'OPModelSimulator',
	#instVars : [
		'elements',
		'simulableElements'
	],
	#classInstVars : [
		'ClassMapping'
	],
	#category : 'OpenPonk-ModelSimulation-Simulators',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Simulators'
}

{ #category : 'accessing' }
OPDiagramSimulator class >> classFor: aModel [
	ClassMapping ifNil: [ ClassMapping := self initialClassMapping ].
	^ ClassMapping
		at: aModel class
		ifAbsent:
			[ self error: aModel class name , ' is not part of model of ' , self name , '.' ]
]

{ #category : 'initialization' }
OPDiagramSimulator class >> initialClassMapping [
	^ Dictionary new
]

{ #category : 'initialization' }
OPDiagramSimulator class >> resetClassMapping [

	<script>
	ClassMapping := nil
]

{ #category : 'private - creation' }
OPDiagramSimulator >> allModelElementsWithPossibleDiagramElement [
	"should return all model elements"

	^ model allElements
]

{ #category : 'private - creation' }
OPDiagramSimulator >> createElementFrom: aModel [
	"creates simulator element for model element"

	| simulatorClass |
	simulatorClass := self class classFor: aModel.
	elements add: (simulatorClass model: aModel diagramSimulator: self)
]

{ #category : 'accesing' }
OPDiagramSimulator >> diagramSimulator [
	^ self
]

{ #category : 'accesing' }
OPDiagramSimulator >> elements [
	^ elements
]

{ #category : 'accesing' }
OPDiagramSimulator >> elementsDo: aBlock [
	self elements do: aBlock
]

{ #category : 'stepping' }
OPDiagramSimulator >> fromAllElements [
	"stepping settings
	before: none
	after: priority
	
	steps all elements"

	stepItemsFrom := [ self elements ]
]

{ #category : 'stepping' }
OPDiagramSimulator >> fromSimulableElements [
	"stepping settings
	before: none
	after: priority
	
	steps simulable elements"

	stepItemsFrom := [ self simulableElements ]
]

{ #category : 'stepping' }
OPDiagramSimulator >> fromSteppableElements [
	"stepping settings
	before: none
	after: priority
	
	steps steppable elements"

	stepItemsFrom := [ self steppableElements ]
]

{ #category : 'initialization' }
OPDiagramSimulator >> initialize [
	super initialize.
	elements := OrderedCollection new.
	simulableElements := OrderedCollection new
]

{ #category : 'testing' }
OPDiagramSimulator >> isSimulable [
	"could there be any possibility to step?"

	^ simulableElements isNotEmpty
]

{ #category : 'testing' }
OPDiagramSimulator >> isSteppable [
	"can I step right now?"

	^ simulableElements anySatisfy: [ :any | any isSteppable ]
]

{ #category : 'private - creation' }
OPDiagramSimulator >> loadItems [
	"creates simulators for model elements"

	self allModelElementsWithPossibleDiagramElement do: [ :modelElement |
		self createElementFrom: modelElement ].
	self
		elementsDo: [ :element | element loadConnectedItems ];
		loadSimulableElements
]

{ #category : 'private - creation' }
OPDiagramSimulator >> loadSimulableElements [
	"selects elements which are simulable"

	simulableElements := elements select: [ :element | element isSimulable ]
]

{ #category : 'actions' }
OPDiagramSimulator >> loadState [
	"loads state of model into simulator"

	self stop.
	self elementsDo: [ :element | element loadState ]
]

{ #category : 'private - accessing' }
OPDiagramSimulator >> model: aDiagram [
	"sets and loads model"

	super model: aDiagram.
	self
		loadItems;
		saveState
]

{ #category : 'actions' }
OPDiagramSimulator >> saveState [
	"saves state after simulation into model"

	self elementsDo: [ :element | element saveState ]
]

{ #category : 'stepping' }
OPDiagramSimulator >> setDefaultStepping [
	"sets default stepping settings"

	super setDefaultStepping.
	self fromSimulableElements
]

{ #category : 'accesing' }
OPDiagramSimulator >> simulableElements [
	"elements with possibility to step"

	^ simulableElements
]

{ #category : 'accesing' }
OPDiagramSimulator >> simulableElementsDo: aBlock [
	self simulableElements do: aBlock
]

{ #category : 'accesing' }
OPDiagramSimulator >> simulableTokens [
	"tokens with possibility to step"

	^ elements flatCollect: [ :el | el simulableTokens ]
]

{ #category : 'accesing' }
OPDiagramSimulator >> simulatorOf: aModel [
	"answers element simulator of model element"

	^ elements
		detect: [ :element | element model = aModel ]
		ifNone: [ 
			model = aModel
				ifTrue: [ model ]
				ifFalse: [ self error: aModel asString , ' not found' ] ]
]

{ #category : 'accesing' }
OPDiagramSimulator >> steppableElements [
	"elements which can step right now"

	^ simulableElements select: [ :el | el isSteppable ]
]

{ #category : 'accesing' }
OPDiagramSimulator >> steppableTokens [
	"tokens which can step right now"

	^ elements flatCollect: [ :el | el steppableTokens ]
]

{ #category : 'accesing' }
OPDiagramSimulator >> tokenCount [
	"amount of tokens"

	^ elements inject: 0 into: [ :sum :el | el tokenCount + sum ]
]

{ #category : 'accesing' }
OPDiagramSimulator >> tokens [
	"answers collection of tokens"

	^ elements flatCollect: [ :el | el tokens ]
]
