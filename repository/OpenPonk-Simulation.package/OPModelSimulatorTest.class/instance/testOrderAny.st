tests
testOrderAny
	simulator
		fromAllTokens;
		priorityAny;
		orderAny.
	simulator tokens first priority: 1.
	self assert: simulator itemsForSelect size = simulator tokenCount.
	self assert: simulator itemsForSelect first priority = 1