stepping
priorityTop
	"stepping settings
	before: from
	after: in
	
	steps only simulators with top priority"

	stepItemsPriority := [ 
	| maxPriority fromCol |
	fromCol := self itemsForPriority.
	fromCol
		ifNotEmpty: [ 
			maxPriority := fromCol inject: fromCol anyOne priority into: [ :max :item | item priority max: max ].
			fromCol select: [ :item | item priority = maxPriority ] ] ]