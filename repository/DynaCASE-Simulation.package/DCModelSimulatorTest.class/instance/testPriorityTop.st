tests
testPriorityTop
	simulator
		fromAllTokens;
		priorityTop.
	simulator tokens allButFirstDo: [ :token | token priority: 1 ].
	self assert: simulator itemsForOrder size = (simulator tokenCount - 1)