creation
loadConnectedItems
	super loadConnectedItems.
	self
		addIncoming: (simulation elementOf: model source);
		addOutgoing: (simulation elementOf: model target)