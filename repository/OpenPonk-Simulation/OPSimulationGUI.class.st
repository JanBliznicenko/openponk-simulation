"
I'm above Simulation layer and Controller layer which I connect together, like controller connects model and view.

I am responsible for integration into GUI of DynaCASE, for creating own GUI and for special animations only for simulation.

Make my instance only by using class-side method controller:
If there is not any instance for given controller, I create one and if there is one, I return that one.
=> I have singleton-like behavior for each diagramController.

All subclasses should contain simulatorClass method, which returns appropriate class of diagramSimulator.
For adding buttons into my GUI use buttonItems method, for adding own code for diagramController, use loadController method.

Internal Representation and Key Implementation Points.

    Instance Variables
	buttons:		contains collection of blocks used for adding buttons into my GUI
	diagramController:		controller of diagram
	diagramSimulator:		simulator of diagram
"
Class {
	#name : #OPSimulationGUI,
	#superclass : #SpPresenter,
	#instVars : [
		'diagramSimulator',
		'diagramController',
		'buttons'
	],
	#category : #'OpenPonk-Simulation'
}

{ #category : #defaults }
OPSimulationGUI class >> buttonHeight [

	^ StandardFonts defaultFont height + 20
]

{ #category : #'as yet unclassified' }
OPSimulationGUI class >> defaultLayout [
	^ SpBoxLayout newLeftToRight
		add: SpBoxLayout newTopToBottom:  [ :c | c add: SpBoxLayout newLeftToRight:  [ :r |  ] ];
		yourself
]

{ #category : #specs }
OPSimulationGUI class >> defaultSpec [

	self flag: 'Pharo 9- compatibility'.
	^ self defaultLayout
]

{ #category : #'instance creation' }
OPSimulationGUI class >> diagramController: aDiagramController [
	"answers existing simulatorGUI with aDiagramController or creates new one for it"

	| gui |
	gui := self allInstances
		detect:
			[ :anyInstance | anyInstance isOpen and: [ anyInstance diagramController == aDiagramController ] ]
		ifNone: [ self newForController: aDiagramController ].
	gui activate.	"causes simulation GUI to get on top of screen"
	^ gui
]

{ #category : #'instance creation' }
OPSimulationGUI class >> newForController: aDiagramController [
	^ self new
		diagramController: aDiagramController;
		open;
		yourself
]

{ #category : #'instance creation' }
OPSimulationGUI class >> stepSimulatorOfController: anElementController [
	"answers existing simulatorGUI with aDiagramController or creates new one for it and steps simulator of elementController"

	| myInstance |
	myInstance := self diagramController: anElementController diagramController.
	myInstance stepSimulatorOfController: anElementController
]

{ #category : #toolbar }
OPSimulationGUI class >> toolbarMenu: aBuilder [
	self subclassResponsibility
]

{ #category : #toolbar }
OPSimulationGUI class >> toolbarMenuItemFor: aBuilder [
	^ (aBuilder item: 'Simulation')
		action: [ "aBuilder model is editor" self diagramController: aBuilder model diagramController ]
]

{ #category : #windows }
OPSimulationGUI >> activate [
	"causes simulation GUI to get on top of screen"

	self windowMorph activate
]

{ #category : #adding }
OPSimulationGUI >> addButtons [
	buttons := self buttonItems.
	self rebuildWidget
]

{ #category : #'building widgets' }
OPSimulationGUI >> alignButtons [
	"align content of all buttons to left"

	buttons
		select: [ :each | each widget isNotNil ]
		thenDo: [ :each | each widget widget submorphs first listCentering: #topLeft ]
]

{ #category : #'private - hooks' }
OPSimulationGUI >> buttonItems [
	"creates collection of buttons for this GUI"

	^ OrderedCollection
		with:
			((self newButton)
				label: 'Save state';
				iconName: #smallSave;
				help: 'Save current state into model';
				action: [ self diagramSimulator saveState ])
		with:
			((self newButton)
				label: 'Stop + Load state';
				iconName: #smallUpdate;
				help: 'Load state from model from before simulate';
				action: [ self diagramSimulator loadState ])
]

{ #category : #windows }
OPSimulationGUI >> close [
	"ends simulation and closes window
	it ends simulation by event triggered by closing window"

	self window close
]

{ #category : #'private - updating' }
OPSimulationGUI >> closed [
	self diagram announcer unsubscribe: self.
	self diagramSimulator loadState.
	diagramController := nil.
	diagramSimulator := nil
]

{ #category : #'building widgets' }
OPSimulationGUI >> createWidgets [
	buttons do: [ :item | self assign: item to: ('button' , item hash asString) asSymbol ]
]

{ #category : #accessing }
OPSimulationGUI >> diagram [
	^ self diagramController model
]

{ #category : #accessing }
OPSimulationGUI >> diagramController [
	^ diagramController
]

{ #category : #accessing }
OPSimulationGUI >> diagramController: aDiagramController [
	diagramController := aDiagramController.
	self initializeWithController
]

{ #category : #accessing }
OPSimulationGUI >> diagramSimulator [
	^ diagramSimulator
]

{ #category : #'building widgets' }
OPSimulationGUI >> dynamicLayout [
	| keys |
	keys := self widgets keys.
	layout := SpBoxLayout newTopToBottom.
	layout add: SpBoxLayout newLeftToRight:  [ :r | r add: #filler ] height: 2.
	keys size odd
		ifTrue: [ keys := keys copyWith: #filler ].
	keys
		pairsDo: [ :odd :even | 
			layout
				add: SpBoxLayout newLeftToRight:  [ :r | 
					r
						add: odd;
						add: even ]
				height: self class buttonHeight ].
	layout add: SpBoxLayout newLeftToRight:  [ :r |  ].
	^ layout
]

{ #category : #'building widgets' }
OPSimulationGUI >> filler [
	^ self newLabel
]

{ #category : #initialization }
OPSimulationGUI >> initialize [

	buttons := OrderedCollection new.
	super initialize
]

{ #category : #initialization }
OPSimulationGUI >> initializeWindow: aWindow [

	aWindow initialExtent: 360 @ 300.
	aWindow title: 'Simulation'
]

{ #category : #initialization }
OPSimulationGUI >> initializeWithController [

	"creates and prepares simulator for current diagramController"

	self loadSimulation.
	self diagram when: OPElementAdded do: [ self reloadController ].
	self diagram when: OPElementRemoved do: [ self reloadController ].
	self withWindowDo: [ :window | 
		window title: 'Simulation of ' , self diagram name ].
	self addButtons
]

{ #category : #windows }
OPSimulationGUI >> isOpen [
	^ self hasWindow
]

{ #category : #'private - hooks' }
OPSimulationGUI >> loadSimulation [
	"prepares simulation - called with every reload"

	diagramSimulator := self simulatorClass model: self diagram
]

{ #category : #'instance creation' }
OPSimulationGUI >> open [
	self isOpen
		ifTrue: [ ^ self takeKeyboardFocus ].
	self openWithSpec.
	self window whenClosedDo: [ self closed ]
]

{ #category : #'building widgets' }
OPSimulationGUI >> rebuildWidget [
	self widgets removeAll.
	self createWidgets.
	self needFullRebuild: false.
	self buildWithSpecLayout: self dynamicLayout.
	self alignButtons.
	self extent: 360 @ (26 + (buttons size * self class buttonHeight / 2))
]

{ #category : #updating }
OPSimulationGUI >> reloadController [
	"reloads elements from diagramController"

	| controller |
	controller := self diagramController.
	self closed.
	diagramController := controller.
	self
		loadSimulation;
		open;
		activate
]

{ #category : #'private - hooks' }
OPSimulationGUI >> simulatorClass [
	"diagram simulator class"

	^ SubclassResponsibility
]

{ #category : #actions }
OPSimulationGUI >> stepSimulatorOfController: anElementController [
	"steps simulator of elementController"

	| elementSimulator |
	elementSimulator := self diagramSimulator simulatorOf: anElementController model.
	elementSimulator step
]

{ #category : #accessing }
OPSimulationGUI >> windowMorph [
	^ self window window
]
