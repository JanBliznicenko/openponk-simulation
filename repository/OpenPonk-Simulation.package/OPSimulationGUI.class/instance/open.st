instance creation
open
	self isOpen
		ifTrue: [ ^ self takeKeyboardFocus ].
	self openWithSpec.
	self window whenClosedDo: [ self closed ]