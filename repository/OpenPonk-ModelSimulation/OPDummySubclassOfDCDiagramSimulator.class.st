Class {
	#name : #OPDummySubclassOfDCDiagramSimulator,
	#superclass : #OPDiagramSimulator,
	#category : 'OpenPonk-ModelSimulation-Tests'
}

{ #category : #initialization }
OPDummySubclassOfDCDiagramSimulator class >> initialClassMapping [
	^ super initialClassMapping
		at: OPDummyDCElement put: OPDummyDCElementSimulator;
		at: OPDummyDCEdge put: OPDummyDCEdgeSimulator;
		yourself
]

{ #category : #'as yet unclassified' }
OPDummySubclassOfDCDiagramSimulator >> steppable: aBoolean [
	self elementsDo: [ :each | each steppable: aBoolean ]
]
