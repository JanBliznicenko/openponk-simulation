stepping
selectLast: amount
	"stepping settings
	before: in
	after: action
	
	steps only last amount of simulators"

	stepSelect := [ 
	| collection |
	collection := stepIn value.
	collection last: (amount min: collection size) ]