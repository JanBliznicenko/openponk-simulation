tests
testConnectedAliases
	self assert: simulator source = nil.
	self assert: simulator target = nil.

	simulator source: self controllerClass new.
	simulator target: self controllerClass new.

	self assert: simulator source class = self controllerClass.
	self assert: simulator target class = self controllerClass.
	self assert: (simulator source outgoing includes: simulator).
	self assert: (simulator target incoming includes: simulator)