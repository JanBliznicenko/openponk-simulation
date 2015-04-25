accesing
tokenCount
	^ elements inject: 0 into: [ :sum :el | el tokenCount + sum ]