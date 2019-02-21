initialization
initialize
	super initialize.
	self openWithSpec.
	self window whenClosedDo: [ self closed ].