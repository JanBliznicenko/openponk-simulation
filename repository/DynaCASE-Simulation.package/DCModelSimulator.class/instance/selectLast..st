stepping
selectLast: amount
	"stepping settings
	before: in
	after: action
	
	steps only last amount of simulators"

	stepSelect := [ 
	| collection |
	collection := self valueForSelect.
	collection last: (amount min: collection size) ]