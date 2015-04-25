accesing
simulableTokens
	^ elements flatCollect: [ :el | el simulableTokens ]