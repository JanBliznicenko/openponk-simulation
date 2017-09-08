accesing
steppableTokens
	"tokens which can step right now"

	^ elements flatCollect: [ :el | el steppableTokens ]