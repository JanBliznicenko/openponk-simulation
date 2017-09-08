tests
testConnectedAliases
	self assert: simulator source = nil.
	self assert: simulator target = nil.

	simulator source: self classForTesting new.
	simulator target: self classForTesting new.

	self assert: simulator source class = self classForTesting.
	self assert: simulator target class = self classForTesting.
	self assert: (simulator source outgoing includes: simulator).
	self assert: (simulator target incoming includes: simulator)