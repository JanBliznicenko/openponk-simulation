tokens
removeToken: aToken
	tokens remove: aToken.
	aToken element: nil.
	self removeTokenFromModel: aToken.
	^ aToken