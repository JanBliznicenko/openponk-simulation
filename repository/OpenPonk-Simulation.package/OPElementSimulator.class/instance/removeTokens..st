tokens
removeTokens: anInteger
	| removedTokens |
	removedTokens := OrderedCollection new.
	anInteger timesRepeat: [ removedTokens add: (self removeToken: tokens first) ].
	^ removedTokens