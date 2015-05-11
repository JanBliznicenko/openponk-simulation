tests
testOrderByReversedPriority
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority.
	simulator tokens last priority: 1.
	simulator tokens first priority: 2.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect last priority = 2.
	self assert: simulator itemsForSelect allButLast last priority = 1.