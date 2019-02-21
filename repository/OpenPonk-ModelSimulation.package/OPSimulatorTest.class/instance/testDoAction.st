tests
testDoAction
	| counter action1 action2 |
	counter := 0.
	action1 := [ :item | counter := counter + 1 ].
	action2 := [ :item | counter := counter + 10 ].
	self prepareOneSteppable.

	simulator addAction: action1.

	self assert: counter = 0.

	simulator doAction: 1.
	self assert: counter = 1.

	simulator addAction: action2.

	simulator doAction: 1.
	self assert: counter = 2.
	simulator doAction: 2.
	self assert: counter = 12.

	simulator addFirstAction: action2.
	simulator doAction: 1.
	simulator doAction: 3.
	self assert: counter = 32