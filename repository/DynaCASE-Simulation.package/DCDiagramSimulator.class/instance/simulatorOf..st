accesing
simulatorOf: aModel
	"answers element simulator of model element"

	^ elements
		detect: [ :element | element model = aModel ]
		ifNone: [ 
			diagram = aModel
				ifTrue: [ diagram ]
				ifFalse: [ self error: aModel asString , ' not found' ] ]