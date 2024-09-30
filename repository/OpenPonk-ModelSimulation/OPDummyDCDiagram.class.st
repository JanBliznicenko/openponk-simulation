Class {
	#name : 'OPDummyDCDiagram',
	#superclass : 'Object',
	#instVars : [
		'elements'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'adding' }
OPDummyDCDiagram >> add: anElement [
	elements add: anElement
]

{ #category : 'adding' }
OPDummyDCDiagram >> addElements: aNumber [
	aNumber timesRepeat: [ elements add: OPDummyDCElement new ]
]

{ #category : 'accessing' }
OPDummyDCDiagram >> allElements [

	^ self elements
]

{ #category : 'accessing' }
OPDummyDCDiagram >> elements [
	^ elements
]

{ #category : 'initialization' }
OPDummyDCDiagram >> initialize [
	elements := OrderedCollection new
]
