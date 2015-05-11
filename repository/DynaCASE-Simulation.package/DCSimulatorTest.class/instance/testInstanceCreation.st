tests
testInstanceCreation
	self assert: simulator delay >= 0.
	self shouldnt: [ simulator addAction: [ :item |  ] ] raise: Exception