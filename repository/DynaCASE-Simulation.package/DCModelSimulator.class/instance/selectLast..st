stepping
selectLast: amount
	"stepping settings
	before: in
	after: action
	
	steps only last amount of simulators"

	stepItemsSelect := [ 
	| collection |
	collection := self itemsForSelect.
	collection last: (amount min: collection size) ]