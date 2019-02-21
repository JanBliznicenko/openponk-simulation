accessing
source: anElement
	self incoming ifNotEmpty: [ self error: [ 'edge can have only one source' ] ].
	self addIncoming: anElement