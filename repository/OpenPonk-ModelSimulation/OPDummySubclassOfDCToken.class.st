Class {
	#name : 'OPDummySubclassOfDCToken',
	#superclass : 'OPToken',
	#instVars : [
		'steppable',
		'state'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> doState [
	state := state + 1
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> initialize [
	super initialize.
	steppable := false.
	state := 1
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> isSimulable [
	^ true
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> isSteppable [
	^ steppable
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> state [
	^ state
]

{ #category : 'as yet unclassified' }
OPDummySubclassOfDCToken >> steppable: aBoolean [
	steppable := aBoolean
]
