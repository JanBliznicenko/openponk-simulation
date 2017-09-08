tests
testAccessing
	| assertTokens |
	assertTokens := [ :amount | 
	self assert: simulator tokenCount = amount.
	self assert: simulator tokens size = amount.
	self assert: simulator steppableTokens size = 0.
	self assert: simulator simulableTokens size = amount.
	self assert: (simulator tokens allSatisfy: [ :token | token element = simulator ]) ].

	simulator addToken: OPDummyDCToken new.
	assertTokens value: 3.
	simulator addToken: OPDummyDCToken new.
	assertTokens value: 4.
	simulator removeToken: simulator tokens first.
	assertTokens value: 3.
	simulator removeAllTokens.
	assertTokens value: 0