tests
testSelectFirstN
	simulator
		fromAllTokens;
		priorityAny;
		orderByPriority;
		selectFirst: 2.
	simulator tokens first priority: 1.
	simulator tokens last priority: 2.
	self assert: simulator itemsForAction size = 2.
	self assert: simulator itemsForAction first priority = 2.
	self assert: simulator itemsForAction second priority = 1