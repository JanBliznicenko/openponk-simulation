tests
testFromSelf
	simulator fromSelf.
	self assert: simulator itemsForPriority size = 1.
	self assert: simulator itemsForPriority first = simulator