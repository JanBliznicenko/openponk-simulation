accessing
target: anElement
	self outgoing ifNotEmpty: [ self error: [ 'edge can have only one target' ] ].
	self addOutgoing: anElement