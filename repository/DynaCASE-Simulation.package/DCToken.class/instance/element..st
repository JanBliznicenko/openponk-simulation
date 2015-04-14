accessing
element: anElement
	element := anElement.
	self simulation: (element ifNotNil: [ element simulation ] ifNil: [ nil ])