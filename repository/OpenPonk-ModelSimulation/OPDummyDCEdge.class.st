Class {
	#name : #OPDummyDCEdge,
	#superclass : #OPDummyDCElement,
	#instVars : [
		'source',
		'target'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #accessing }
OPDummyDCEdge >> source [
	^ source
]

{ #category : #accessing }
OPDummyDCEdge >> source: anElement [
	source := anElement
]

{ #category : #accessing }
OPDummyDCEdge >> target [
	^ target
]

{ #category : #accessing }
OPDummyDCEdge >> target: anElement [
	target := anElement
]
