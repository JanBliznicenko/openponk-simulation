initialization
initialize
	super initialize.
	priority := 0.
	incoming := OrderedCollection new.
	outgoing := OrderedCollection new.
	tokens := OrderedCollection new.
	self setTokenUpdatingByModel