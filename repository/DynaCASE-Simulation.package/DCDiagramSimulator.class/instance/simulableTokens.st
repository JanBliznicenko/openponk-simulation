accesing
simulableTokens
	"tokens with possibility to step"

	^ elements flatCollect: [ :el | el simulableTokens ]