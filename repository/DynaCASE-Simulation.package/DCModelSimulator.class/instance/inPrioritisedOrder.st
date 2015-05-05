stepping
inPrioritisedOrder
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority"

	stepIn := [ (SortedCollection sortBlock: self sortBlock) addAll: self valueForIn ]