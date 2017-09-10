accessing
classFor: aModel
	ClassMapping ifNil: [ ClassMapping := self initialClassMapping ].
	^ ClassMapping
		at: aModel class
		ifAbsent:
			[ self error: aModel class name , ' is not part of model of ' , self name , '.' ]