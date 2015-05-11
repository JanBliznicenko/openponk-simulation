tests
testPriorityAny
	simulator
		fromAllTokens;
		priorityAny.
	simulator tokens first priority: 1.
	self assert: simulator itemsForOrder size = simulator tokenCount