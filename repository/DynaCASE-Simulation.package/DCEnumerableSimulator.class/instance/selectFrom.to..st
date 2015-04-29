stepping
selectFrom: firstIndex to: lastIndex
	"stepping settings
	before: in
	after: action
	
	steps simulators within range"

	stepSelect := [ 
	| collection |
	collection := stepIn value.
	collection copyFrom: firstIndex to: (lastIndex min: collection size) ]