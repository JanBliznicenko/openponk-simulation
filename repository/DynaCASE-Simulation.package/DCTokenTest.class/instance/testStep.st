tests
testStep
	simulator addAction: [ :item | item doState ].

	self assert: simulator state = 1.
	simulator step.
	self assert: simulator state = 1.
	simulator steppable: true.
	simulator step.
	self assert: simulator state = 2