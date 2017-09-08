tests
testSelectLastN
	simulator
		fromAllTokens;
		priorityAny;
		orderByReversedPriority;
		selectLast: 2.
	simulator tokens last priority: 1.
	simulator tokens first priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 1.
	self assert: simulator itemsForAction second priority = 2