stepping
inReversedPrioritisedOrder
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority from least to top"

	stepIn := [ (SortedCollection sortBlock: self reversedSortBlock) addAll: self valueForIn ]