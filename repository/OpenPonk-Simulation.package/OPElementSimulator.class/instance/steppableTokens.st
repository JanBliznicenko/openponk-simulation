tokens
steppableTokens
	^ tokens select: [ :token | token isSteppable ]