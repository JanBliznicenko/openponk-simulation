accessing
element: anElement
	element := anElement.
	self diagramSimulator: (element ifNotNil: [ element diagramSimulator ] ifNil: [ nil ])