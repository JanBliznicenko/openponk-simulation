tests
testSelectOne
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectOne: 2.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 1.
	self assert: simulator itemsForAction first priority = 1