initialization
initialize
	super initialize.
	ClassMapping ifNil: [ self initializeClassMapping ].
	elements := OrderedCollection new.
	simulableElements := OrderedCollection new