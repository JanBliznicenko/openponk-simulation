tests
testStep
	simulator
		fromSelf;
		orderAny;
		priorityAny;
		selectAll;
		addAction: [ :item | item saveState ].

	self assert: simulator model state = 1.
	simulator step.
	self assert: simulator model state = 1.
	simulator steppable: true.
	simulator step.
	self assert: simulator model state = 2