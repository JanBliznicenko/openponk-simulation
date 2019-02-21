adding
addOutgoing: anElement
	"adds element as outgoing"

	anElement
		ifNil: [ ^ self ];
		addedIncoming: self.
	self addedOutgoing: anElement