adding
addOutgoing: anElement
	anElement
		ifNil: [ ^ self ];
		addedIncoming: self.
	self addedOutgoing: anElement