accessing
classFor: aModel
	| errorBlock |
	errorBlock := [ 
	self
		error:
			aModel class name , ' is not part of model of ' , self name
				, ' or ClassMapping is not properly initialized.' ].
	ClassMapping ifNil: [ self initializeClassMapping ].
	^ ClassMapping at: aModel class ifAbsent: errorBlock