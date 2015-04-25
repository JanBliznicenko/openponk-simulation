stepping
inReversedPrioritisedOrder
	| settingPrioritised |
	self inPrioritisedOrder.
	settingPrioritised := stepIn.
	stepIn := [ 
	settingPrioritised value reversed
		sortBlock: self reversedSortBlock;
		yourself ]