accesing
tokenCount
	"amount of tokens"

	^ elements inject: 0 into: [ :sum :el | el tokenCount + sum ]