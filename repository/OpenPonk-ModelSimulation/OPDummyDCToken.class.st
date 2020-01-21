Class {
	#name : #OPDummyDCToken,
	#superclass : #OPDummyDCSimulator,
	#instVars : [
		'element'
	],
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #accessing }
OPDummyDCToken >> element [
	^ element
]

{ #category : #accessing }
OPDummyDCToken >> element: anElement [
	element := anElement
]

{ #category : #testing }
OPDummyDCToken >> isSimulable [
	^ true
]

{ #category : #testing }
OPDummyDCToken >> isSteppable [
	^ false
]
