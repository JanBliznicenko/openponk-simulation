tests
testAccessing
	self assert: simulator simulableElements size = 3.
	self assert: simulator steppableElements size = 0.
	simulator elements first steppable: true.
	self assert: simulator steppableElements size = 1.

	self assert: simulator tokenCount = 3.
	self assert: simulator tokens size = 3.
	self assert: simulator steppableTokens size = 0.
	self assert: simulator simulableTokens size = 3.

	self assert: simulator model class = DummyDCDiagram