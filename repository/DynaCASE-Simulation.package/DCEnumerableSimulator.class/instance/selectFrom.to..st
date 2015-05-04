stepping
selectFrom: firstIndex to: lastIndex
	"stepping settings
	before: in
	after: action
	
	steps simulators within range"

	stepSelect := [ 
	| collection |
	collection := self valueForSelect.
	collection copyFrom: firstIndex to: (lastIndex min: collection size) ]