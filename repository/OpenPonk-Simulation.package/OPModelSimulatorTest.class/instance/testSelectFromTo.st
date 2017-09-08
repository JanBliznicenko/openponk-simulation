tests
testSelectFromTo
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectFrom: 1 to: 2.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1