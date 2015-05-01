creation
loadConnectedItems
	"loads and/or connects appropriate tokens and elements"

	super loadConnectedItems.
	self
		addIncoming: (diagramSimulator simulatorOf: model source);
		addOutgoing: (diagramSimulator simulatorOf: model target)