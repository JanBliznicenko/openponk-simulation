tests
testSelectAll
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectAll.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = simulator tokenCount.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1.