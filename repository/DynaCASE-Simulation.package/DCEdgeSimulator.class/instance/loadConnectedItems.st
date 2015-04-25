creation
loadConnectedItems
	super loadConnectedItems.
	self
		addIncoming: (diagramSimulator simulatorOf: model source);
		addOutgoing: (diagramSimulator simulatorOf: model target)