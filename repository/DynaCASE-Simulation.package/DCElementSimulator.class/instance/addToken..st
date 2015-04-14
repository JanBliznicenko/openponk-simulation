tokens
addToken: aToken
	tokens add: aToken.
	aToken element: self.
	self addTokenToModel: aToken