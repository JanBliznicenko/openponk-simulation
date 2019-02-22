tests
testConnected
	self assert: simulator outgoing size = 0.
	self assert: simulator incoming size = 0.
	simulator addIncoming: self controllerClass new.
	self assert: simulator incoming size = 1.
	simulator addOutgoing: self controllerClass new.
	self assert: simulator outgoing size = 1.
	self assert: simulator incoming first outgoing first = simulator.
	self assert: simulator outgoing first incoming first = simulator.
	self assert: simulator outgoing first outgoing size = 0.
	self assert: simulator incoming first incoming size = 0