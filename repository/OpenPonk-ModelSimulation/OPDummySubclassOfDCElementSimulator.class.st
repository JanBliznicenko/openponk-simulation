Class {
	#name : #OPDummySubclassOfDCElementSimulator,
	#superclass : #OPElementSimulator,
	#instVars : [
		'steppable'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> initialize [
	super initialize.
	steppable := false
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> isSimulable [
	^ true
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> isSteppable [
	^ steppable
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> loadState [
	model resetState
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> saveState [
	model doState
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCElementSimulator >> steppable: aBoolean [
	steppable := aBoolean
]
