"
I am a special case of element simulator, with one source and one target which I connect.
"
Class {
	#name : #OPEdgeSimulator,
	#superclass : #OPElementSimulator,
	#category : 'OpenPonk-ModelSimulation-Simulators'
}

{ #category : #creation }
OPEdgeSimulator >> loadConnectedItems [
	"loads and/or connects appropriate tokens and elements"

	super loadConnectedItems.
	self
		source: (diagramSimulator simulatorOf: model source);
		target: (diagramSimulator simulatorOf: model target)
]

{ #category : #accessing }
OPEdgeSimulator >> source [
	incoming ifEmpty: [ ^ nil ].
	^ incoming first
]

{ #category : #accessing }
OPEdgeSimulator >> source: anElement [
	self incoming ifNotEmpty: [ self error: [ 'edge can have only one source' ] ].
	self addIncoming: anElement
]

{ #category : #accessing }
OPEdgeSimulator >> target [
	outgoing ifEmpty: [ ^ nil ].
	^ outgoing first
]

{ #category : #accessing }
OPEdgeSimulator >> target: anElement [
	self outgoing ifNotEmpty: [ self error: [ 'edge can have only one target' ] ].
	self addOutgoing: anElement
]
