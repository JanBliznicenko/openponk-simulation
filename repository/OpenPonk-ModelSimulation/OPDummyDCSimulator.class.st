Class {
	#name : 'OPDummyDCSimulator',
	#superclass : 'Object',
	#instVars : [
		'priority'
	],
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'initialization' }
OPDummyDCSimulator >> initialize [
	super initialize.
	priority := 0
]

{ #category : 'accessing' }
OPDummyDCSimulator >> priority [
	^ priority
]

{ #category : 'accessing' }
OPDummyDCSimulator >> priority: aPriority [
	priority := aPriority
]
