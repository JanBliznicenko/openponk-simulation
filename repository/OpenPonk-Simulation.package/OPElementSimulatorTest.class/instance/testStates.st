tests
testStates
	self assert: simulator model state = 1.
	simulator saveState.
	self assert: simulator model state = 2.
	simulator loadState.
	self assert: simulator model state = 1