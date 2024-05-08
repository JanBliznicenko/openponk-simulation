Class {
	#name : 'OPDummyDCEdgeSimulator',
	#superclass : 'OPDummyDCElementSimulator',
	#category : 'OpenPonk-ModelSimulation-Tests',
	#package : 'OpenPonk-ModelSimulation',
	#tag : 'Tests'
}

{ #category : 'testing' }
OPDummyDCEdgeSimulator >> isSimulable [
	^ false
]

{ #category : 'accessing' }
OPDummyDCEdgeSimulator >> source [
	^ incoming first
]

{ #category : 'accessing' }
OPDummyDCEdgeSimulator >> target [
	^ outgoing first
]

{ #category : 'tokens' }
OPDummyDCEdgeSimulator >> tokenCount [
	^ 0
]

{ #category : 'accessing' }
OPDummyDCEdgeSimulator >> tokens [
	^ OrderedCollection new
]
