private - creation
createElementFrom: aModel
	"creates simulator element for model element"

	| simulatorClass |
	simulatorClass := ClassMapping
		at: aModel class
		ifAbsent: [ 
			^ self
				error:
					aModel class asString , ' is not part of model of ' , self class asString
						, ' or classMapping is not properly initialized on class side.' ].
	elements add: (simulatorClass simulation: self model: aModel)