tests
testStates
	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator saveState.
	self assert: (simulator elements sum: [ :each | each state ]) = 8.
	simulator loadState.
	self assert: (simulator elements sum: [ :each | each state ]) = 4