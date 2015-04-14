adding
addIncoming: anElement
	anElement
		ifNil: [ ^ self ];
		addedOutgoing: self.
	self addedIncoming: anElement