tests
testInstanceCreation
	| event |
	event := OPSimulatorStepEvent simulator: simulator.
	self assert: event simulator = simulator