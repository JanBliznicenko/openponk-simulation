tests
testOrderByPriority
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority.
	simulator tokens last priority: 2.
	simulator tokens first priority: 1.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect first priority = 2.
	self assert: simulator itemsForSelect second priority = 1