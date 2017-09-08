tokens
addTokens: aCollectionOfTokens
	tokens addAll: aCollectionOfTokens.
	aCollectionOfTokens do: [ :each | each element: self ]