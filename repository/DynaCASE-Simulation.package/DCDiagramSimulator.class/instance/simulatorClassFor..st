accesing
simulatorClassFor: aModel
	| simulatorClass errorBlock |
	errorBlock := [ 
	self
		error:
			aModel class asString , ' is not part of model of ' , self class asString
				, ' or ClassMapping is not properly initialized.' ].

	ClassMapping ifNil: [ self class initialize ].
	simulatorClass := ClassMapping at: aModel class ifAbsent: errorBlock.
	elements add: (simulatorClass diagramSimulator: self model: aModel)