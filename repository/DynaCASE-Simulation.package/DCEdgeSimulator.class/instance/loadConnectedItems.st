creation
loadConnectedItems
	super loadConnectedItems.
	self
		addIncoming: (simulation simulatorOf: model source);
		addOutgoing: (simulation simulatorOf: model target)