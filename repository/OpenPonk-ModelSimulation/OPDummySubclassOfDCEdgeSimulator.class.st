Class {
	#name : 'OPDummySubclassOfDCEdgeSimulator',
	#superclass : 'OPEdgeSimulator',
	#instVars : [
		'steppable'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> initialize [
	super initialize.
	steppable := false
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> isSimulable [
	^ true
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> isSteppable [
	^ steppable
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> loadState [
	model resetState
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> saveState [
	model doState
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCEdgeSimulator >> steppable: aBoolean [
	steppable := aBoolean
]
