accesing
simulatorOf: aModel
	"answers element simulator of model element"

	^ elements
		detect: [ :element | element model = aModel ]
		ifNone: [ 
			model = aModel
				ifTrue: [ model ]
				ifFalse: [ self error: aModel asString , ' not found' ] ]