tests
testAnnounceStep
	| will steps |
	self prepareOneNotSteppable.
	will := 0.
	steps := 0.
	simulator when: DCSimulatorWillStep do: [ will := will + 1 ].
	simulator when: DCSimulatorWillStep do: [ self assert: steps = 0 ].
	simulator when: DCSimulatorStepped do: [ steps := steps + 1 ].
	self assert: will = 0.
	self assert: steps = 0.

	simulator step.
	self assert: will = 0.
	self assert: steps = 0.

	simulator steppable: true.
	simulator step.
	self assert: will = 1.
	self assert: steps = 1