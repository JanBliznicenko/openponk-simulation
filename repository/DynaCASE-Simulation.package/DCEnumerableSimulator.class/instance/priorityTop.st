stepping
priorityTop
	stepPriority := [ 
	| maxPriority fromCol |
	fromCol := stepFrom value.
	fromCol
		ifNotEmpty: [ 
			maxPriority := fromCol inject: fromCol anyOne into: [ :max :item | item priority max: max ].
			fromCol select: [ :item | item priority = maxPriority ] ] ]