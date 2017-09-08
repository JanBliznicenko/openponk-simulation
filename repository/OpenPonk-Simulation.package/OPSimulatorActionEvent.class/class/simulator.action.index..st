instance creation
simulator: aSimulator action: anAction index: anIndex
	^ (super simulator: aSimulator)
		action: anAction;
		index: anIndex;
		yourself