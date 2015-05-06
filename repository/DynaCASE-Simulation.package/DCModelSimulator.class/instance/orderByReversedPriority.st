stepping
orderByReversedPriority
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority from least to top"

	stepItemsOrder := [ (SortedCollection sortBlock: self reversedSortBlock) addAll: self valueForOrder ]