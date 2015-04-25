stepping
selectLast: amount
	stepSelect := [ 
	| collection |
	collection := stepIn value.
	collection last: (amount min: collection size) ]