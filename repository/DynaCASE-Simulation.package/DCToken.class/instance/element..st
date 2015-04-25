accessing
element: anElement
	element := anElement.
	self diagram: (element ifNotNil: [ element diagram ] ifNil: [ nil ])