accessing
removeToken: aToken
	tokens remove: aToken.
	aToken element: nil.
	^ aToken