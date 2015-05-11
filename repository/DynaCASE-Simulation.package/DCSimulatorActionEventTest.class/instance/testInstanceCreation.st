tests
testInstanceCreation
	| event |
	event := DCSimulatorActionEvent simulator: simulator action: [ 2 + 2 ] index: 2.
	self assert: event simulator = simulator & (event action value = 4) & (event index = 2)