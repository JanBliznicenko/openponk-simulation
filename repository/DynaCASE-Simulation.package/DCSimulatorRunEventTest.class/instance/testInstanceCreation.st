tests
testInstanceCreation
	| event |
	event := DCSimulatorRunEvent simulator: simulator delay: 2 repeatTimes: 4.
	self assert: event simulator = simulator & event isLimited & (event repeatTimes = 4) & (event delay = 2).

	event := DCSimulatorRunEvent simulator: simulator delay: 2.
	self assert: event simulator = simulator & event isLimited not & (event delay = 2)