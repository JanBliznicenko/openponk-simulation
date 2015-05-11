tests
testSelectLast
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority;
		selectLast.
	simulator tokens first priority: 1.
	simulator tokens second priority: 2.
	self assert: simulator itemsForAction size = 1.
	self assert: simulator itemsForAction first priority = 2