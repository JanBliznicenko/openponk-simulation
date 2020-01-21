Class {
	#name : #OPDummyDCElement,
	#superclass : #Object,
	#instVars : [
		'state'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #accessing }
OPDummyDCElement >> doState [
	state := state + 1
]

{ #category : #initialization }
OPDummyDCElement >> initialize [
	state := 1
]

{ #category : #private }
OPDummyDCElement >> resetState [
	state := 1
]

{ #category : #accessing }
OPDummyDCElement >> state [
	^ state
]
