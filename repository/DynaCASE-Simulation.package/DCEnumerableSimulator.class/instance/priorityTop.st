stepping
priorityTop
	"stepping settings
	before: from
	after: in
	
	steps only simulators with top priority"

	stepPriority := [ 
	| maxPriority fromCol |
	fromCol := stepFrom value.
	fromCol
		ifNotEmpty: [ 
			maxPriority := fromCol inject: fromCol anyOne into: [ :max :item | item priority max: max ].
			fromCol select: [ :item | item priority = maxPriority ] ] ]