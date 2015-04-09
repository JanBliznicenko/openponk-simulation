tokens
removeTokens: anInteger
	| removedTokens |
	removedTokens := SortedCollection new.
	anInteger timesRepeat: [ removedTokens add: (self removeToken: tokens first) ].
	^ removedTokens