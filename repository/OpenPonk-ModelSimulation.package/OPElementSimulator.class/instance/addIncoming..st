adding
addIncoming: anElement
	"adds element as incoming"

	anElement
		ifNil: [ ^ self ];
		addedOutgoing: self.
	self addedIncoming: anElement