tokens
simulableTokens
	^ tokens select: [ :token | token isSimulable ]