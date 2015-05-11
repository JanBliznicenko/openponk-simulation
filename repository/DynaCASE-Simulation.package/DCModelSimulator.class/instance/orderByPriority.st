stepping
orderByPriority
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority"

	stepItemsOrder := [ 
	(SortedCollection sortBlock: self sortBlock)
		addAll: self itemsForOrder;
		yourself ]