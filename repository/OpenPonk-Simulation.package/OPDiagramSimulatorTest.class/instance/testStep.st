tests
testStep
	simulator
		fromSteppableElements;
		orderAny;
		priorityAny;
		selectAll;
		addAction: [ :item | item saveState ].

	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator step.
	self assert: (simulator elements sum: [ :each | each state ]) = 4.
	simulator elements first steppable: true.
	simulator elements second steppable: true.
	simulator step.
	self assert: (simulator elements sum: [ :each | each state ]) = 6