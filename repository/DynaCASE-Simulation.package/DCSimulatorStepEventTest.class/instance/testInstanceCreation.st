tests
testInstanceCreation
	| event |
	event := DCSimulatorStepEvent simulator: simulator.
	self assert: event simulator = simulator