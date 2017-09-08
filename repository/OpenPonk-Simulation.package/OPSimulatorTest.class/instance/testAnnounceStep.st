tests
testAnnounceStep
	| will steps |
	self prepareOneNotSteppable.
	will := 0.
	steps := 0.
	simulator when: OPSimulatorWillStep do: [ will := will + 1 ].
	simulator when: OPSimulatorWillStep do: [ self assert: steps = 0 ].
	simulator when: OPSimulatorStepped do: [ steps := steps + 1 ].
	self assert: will = 0.
	self assert: steps = 0.

	simulator step.
	self assert: will = 0.
	self assert: steps = 0.

	simulator steppable: true.
	simulator step.
	self assert: will = 1.
	self assert: steps = 1