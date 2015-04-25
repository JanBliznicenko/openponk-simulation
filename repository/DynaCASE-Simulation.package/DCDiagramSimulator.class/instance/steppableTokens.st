accesing
steppableTokens
	^ elements flatCollect: [ :el | el steppableTokens ]