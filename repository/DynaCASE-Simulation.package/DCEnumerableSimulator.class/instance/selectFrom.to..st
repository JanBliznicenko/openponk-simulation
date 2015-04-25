stepping
selectFrom: firstIndex to: lastIndex
	stepSelect := [ 
	| collection |
	collection := stepIn value.
	collection copyFrom: firstIndex to: (lastIndex min: collection size) ]