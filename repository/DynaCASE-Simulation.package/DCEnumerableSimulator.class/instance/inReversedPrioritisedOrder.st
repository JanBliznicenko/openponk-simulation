stepping
inReversedPrioritisedOrder
	"stepping settings
	before: priority
	after: select
	
	steps simulators ordered by priority from least to top"

	| settingPrioritised |
	self inPrioritisedOrder.
	settingPrioritised := stepIn.
	stepIn := [ 
	settingPrioritised value reversed
		sortBlock: self reversedSortBlock;
		yourself ]