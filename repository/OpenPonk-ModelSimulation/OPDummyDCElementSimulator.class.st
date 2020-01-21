Class {
	#name : #OPDummyDCElementSimulator,
	#superclass : #OPDummyDCSimulator,
	#instVars : [
		'steppable',
		'incoming',
		'outgoing',
		'loaded',
		'diagramSimulator',
		'loadedConnected',
		'state',
		'model',
		'tokens'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #'as yet unclassified' }
OPDummyDCElementSimulator class >> model: aModel diagramSimulator: aSimulator [
	^ self new
		model: aModel;
		diagramSimulator: aSimulator;
		yourself
]

{ #category : #accessing }
OPDummyDCElementSimulator >> diagramSimulator [
	^ diagramSimulator
]

{ #category : #accessing }
OPDummyDCElementSimulator >> diagramSimulator: aSimulator [
	diagramSimulator := aSimulator
]

{ #category : #initialization }
OPDummyDCElementSimulator >> initialize [
	loaded := false.
	steppable := false.
	state := 0.
	tokens := OrderedCollection with: OPDummyDCToken new.
]

{ #category : #testing }
OPDummyDCElementSimulator >> isSimulable [
	^ true
]

{ #category : #testing }
OPDummyDCElementSimulator >> isSteppable [
	^ steppable
]

{ #category : #creation }
OPDummyDCElementSimulator >> loadConnectedItems [
	loadedConnected := true
]

{ #category : #actions }
OPDummyDCElementSimulator >> loadState [
	state := 1
]

{ #category : #accessing }
OPDummyDCElementSimulator >> loaded [
	^ state > 0 & loadedConnected
]

{ #category : #accessing }
OPDummyDCElementSimulator >> model [
	^ model
]

{ #category : #accessing }
OPDummyDCElementSimulator >> model: aModel [
	model := aModel
]

{ #category : #actions }
OPDummyDCElementSimulator >> saveState [
	state := state + 1
]

{ #category : #tokens }
OPDummyDCElementSimulator >> simulableTokens [
	^ self tokens
]

{ #category : #accessing }
OPDummyDCElementSimulator >> state [
	^ state
]

{ #category : #accessing }
OPDummyDCElementSimulator >> steppable: aBoolean [
	steppable := aBoolean
]

{ #category : #tokens }
OPDummyDCElementSimulator >> steppableTokens [
	^ OrderedCollection new
]

{ #category : #tokens }
OPDummyDCElementSimulator >> tokenCount [
	^ tokens size
]

{ #category : #accessing }
OPDummyDCElementSimulator >> tokens [
	^ tokens
]
