accessing
element: anElement
	element := anElement.
	self diagramSimulator: (element ifNotNil: [ element diagram ] ifNil: [ nil ])